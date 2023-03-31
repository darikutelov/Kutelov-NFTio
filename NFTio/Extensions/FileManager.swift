//
//  FileManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 30.03.23.
//

import Foundation

public extension FileManager {
  static var documentsDirectoryURL: URL {
    `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
