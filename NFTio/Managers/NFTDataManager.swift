//
//  NFTDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

final class NFTDataManager {
    enum DataModel: String, CaseIterable {
        case nftItems
        case likedNftItems
        case categories
        case nftCollections
    }
    
    // MARK: - Properties
    
    var nftItems = [NFT]() {
        didSet {
            saveDataToJSON(.nftItems)
        }
    }
    
    var likedNftItems = [String]() {
        didSet {
            saveDataToJSON(.likedNftItems)
        }
    }
    
    var categories = [Category]() {
        didSet {
            saveDataToJSON(.categories)
        }
    }
    
    var nftCollections = [NFTCollection]() {
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
    
    func loadDataFromJSON(_ dataModel: DataModel) {
        guard let jsonFileURL = getJsonDataUrl(
            fileName: dataModel.rawValue
        ) else {
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
}
