//
//  UserViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import SwiftUI
import PhotosUI
import CoreTransferable

final class UserViewModel: ObservableObject {
    @MainActor @Published var user: User?
    
    private let userDataManager = UserDataManager()
    
    @MainActor @State var isLoading = false

    @MainActor @Published var errorMessage = ""
    
    @MainActor @Published private(set) var imageState: ImageState = .empty
    
    @MainActor @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                let progress = loadTransferable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }
    
    init() {
        Task {
            await MainActor.run {
                if let currentUser = userDataManager.getUserFromLocalStorage() {
                    self.user = currentUser
                }
            }
        }
    }
    
    @MainActor public func loginUser(email: String, password: String) async {
        isLoading = true
        defer {
            self.isLoading = false
        }
        
        do {
            user = try await userDataManager.loginUser(
                email: email,
                password: password
            )
        } catch let error {
            print(error)
            handleError(error)
        }
    }
    
    @MainActor public func registerUser(username: String,
                                        email: String,
                                        password: String,
                                        rePassword: String) async {
        guard password == rePassword else {
            errorMessage = "Passwords should match!"
            return
        }
        
        isLoading = true
        defer {
            self.isLoading = false
        }
        
        do {
            user = try await userDataManager.registerUser(
                username: username,
                email: email,
                password: password
            )
        } catch let error {
            print(error)
            handleError(error)
        }
    }
    
    @MainActor private func handleError(_ error: Error) {
        if let networkError = error as? APIServiceError {
            switch networkError {
            case .failedToCreateUrl:
                errorMessage = "Error Sending Data"
            case .requestFailed(let message):
                errorMessage = message
            case .responseDecodingFailed(let message):
                errorMessage = message
            case .failedToConnectToServer(let message):
                errorMessage = message
            case .invalidResponse(let message):
                errorMessage = message
            case .objectEncodingFailed:
                errorMessage = "Bad Data from Server"
            }
        } else {
            errorMessage = "Something went wrong!"
        }
    }
    
    @MainActor public func logoutUser() {
         user = nil
         userDataManager.logoutUser()
    }
    
    @MainActor public func updateUser() async throws {
        guard var currentUser = self.user else { return }
        
        if let avatarImageUrl = ProfileImage.profileImageFileName {
            currentUser.avatarUrl = avatarImageUrl
        }
        
        Task {
            do {
                try await userDataManager.updateUser(user: currentUser)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - User Avatar

extension UserViewModel {
    enum ImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }
    
    enum TransferError: Error {
        case importFailed
    }
    
    struct ProfileImage: Transferable {
        let image: Image
        static var profileImageFileName: String?
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
            #if canImport(AppKit)
                guard let nsImage = NSImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(nsImage: nsImage)
                return ProfileImage(image: image)
            #elseif canImport(UIKit)
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                
                // Upload Image to server
                let requestUrl = RequestUrl(endpoint: .users, pathComponents: ["images"])
                
                Task {
                    if let uploadedImageFileName = try await APIService
                        .shared
                        .uploadImage(imageData: data, requestUrl: requestUrl) {
                        profileImageFileName = uploadedImageFileName
                    }
                }
                
                return ProfileImage(image: image)
            #else
                throw TransferError.importFailed
            #endif
            }
        }
    }
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: ProfileImage.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let profileImage?):
                    self.imageState = .success(profileImage.image)
                case .success(nil):
                    self.imageState = .empty
                case .failure(let error):
                    self.imageState = .failure(error)
                }
            }
        }
    }
}
