//
//  NFTDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

class NFTDataManager: ObservableObject {
    enum DataModel: String, CaseIterable {
        case nftItems
        case likedNftItems
        case categories
        case nftCollections
    }
    
    // MARK: - Properties
    
    @Published var nftItems = [NFT]() {
        didSet {
            saveDataToJSON(.nftItems)
        }
    }
    @Published var likedNftItems = [String](){
        didSet {
            saveDataToJSON(.likedNftItems)
        }
    }
    @Published var categories = [Category](){
        didSet {
            saveDataToJSON(.categories)
        }
    }
    @Published var nftCollections = [NFTCollection](){
        didSet {
            saveDataToJSON(.nftCollections)
        }
    }

    var decoder: JSONDecoder
    var encoder: JSONEncoder
    
    // MARK: - Init
    
    init() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        setUpCoders()
        
        DataModel.allCases.forEach {
            loadDataFromJSON($0)
        }
     }
    
    private func setUpCoders() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        encoder.outputFormatting = .prettyPrinted
    }
    
    // MARK: - Fetch and save methods
    
    //Assignment 1 & 3
    func loadDataFromJSON(_ dataModel: DataModel) {
        guard let jsonFileURL = getJsonDataUrl(
            fileName: dataModel.rawValue
        ) else {
            print(Constants.Text.ErrorMessages.JSONFileNotFound)
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonFileURL)
            
            switch dataModel {
            case .nftItems:
                self.nftItems = try decoder.decode([NFT].self, from: jsonData)
            case .likedNftItems:
                self.likedNftItems = try decoder.decode([String].self, from: jsonData)
            case .categories:
                self.categories = try decoder.decode([Category].self, from: jsonData)
            case .nftCollections:
                self.nftCollections = try decoder.decode([NFTCollection].self, from: jsonData)
            }
            
            let _ = Log.general.debug("🎯 \(dataModel.rawValue) loaded from url: \(jsonFileURL)")
        } catch let error {
            print(error)
        }
    }
    
    private func getJsonDataUrl(fileName: String) -> URL? {
        let urlFromDocuments = URL(
            fileURLWithPath: fileName,
            relativeTo: FileManager.documentsDirectoryURL
        )
            .appendingPathExtension("json")

        if FileManager.default.fileExists(atPath: urlFromDocuments.path) {
            return urlFromDocuments
        } else {
            guard let urlFromResources = Bundle.main.url(
                forResource: fileName,
                withExtension: "json"
            ) else {
                return nil
            }
            return urlFromResources
        }
    }
    
    //Assignment 2
    func saveDataToJSON(_ dataModel: DataModel) {
        do {
            let jsonFileURL = URL(
                fileURLWithPath: dataModel.rawValue,
                relativeTo: FileManager.documentsDirectoryURL
            )
                .appendingPathExtension("json")

            var jsonData: Data
            
            switch dataModel {
            case .nftItems:
                jsonData = try encoder.encode(nftItems)
            case .likedNftItems:
                jsonData = try encoder.encode(likedNftItems)
            case .categories:
                jsonData = try encoder.encode(categories)
            case .nftCollections:
                jsonData = try encoder.encode(nftCollections)
            }

            try jsonData.write(to: jsonFileURL, options: .atomic)
        } catch let error {
            print(error)
        }
    }
    
    //Assignment 4


    
    // MARK: - NFT methods
    
    func addNew(nftItem: NFT) {
        self.nftItems.append(nftItem)
    }
    
    func fetchNftItems() async throws -> [NFT] {
        let seconds = 2.0
        try await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
        
        return nftItems
    }
}
