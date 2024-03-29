//
//  AddNFTViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 24.04.23.
//

import SwiftUI
import PhotosUI
import CoreTransferable

final class AddNFTViewModel: ObservableObject {
    enum TransferError: Error {
        case importFailed
    }
    
    struct UploadImage: Transferable {
        let image: Image
        static var imageFileName: String?
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
            #if canImport(AppKit)
                guard let nsImage = NSImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(nsImage: nsImage)
                return UploadImage(image: image)
            #elseif canImport(UIKit)
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                
                let requestUrl = RequestUrl(endpoint: .nftItems, pathComponents: ["images"])
                Task {
                    if let uploadedImageFileName = try await APIService
                        .shared
                        .uploadImage(imageData: data, requestUrl: requestUrl) {
                        Self.imageFileName = uploadedImageFileName
                    }
                }
                return UploadImage(image: image)
            #else
                throw TransferError.importFailed
            #endif
            }
        }
    }
    
    // MARK: - Properties
    
    @Published private(set) var imageState: ImageUploadView.ImageState = .empty
    
    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                let progress = loadTransferable(from: imageSelection)
                imageState = .loading(progress)
            } else {
                imageState = .empty
            }
        }
    }
    
    private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(type: UploadImage.self) { result in
            DispatchQueue.main.async {
                guard imageSelection == self.imageSelection else {
                    print("Failed to get the selected item.")
                    return
                }
                switch result {
                case .success(let nftImage?):
                    self.imageState = .success(nftImage.image)
                case .success(nil):
                    self.imageState = .empty
                case .failure(let error):
                    self.imageState = .failure(error)
                }
            }
        }
    }
    
    public func resetImage() {
        imageState = .empty
    }
}

extension AddNFTViewModel {
    public func postNFT(nft: NFT) async throws {
        
        var currentNFT = nft
        
        guard let imageUrl = UploadImage.imageFileName else {
            return
        }
    
        currentNFT.imageUrl = imageUrl
        
        let requestUrl = RequestUrl(endpoint: .nftItems)
        
        do {
            let _ = try await APIService.shared.postData(
                requestUrl,
                bodyData: currentNFT
            )
        } catch let error {
            throw error
        }
    }
}
