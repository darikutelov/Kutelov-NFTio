//
//  Hashable.swift
//  NFTio
//
//  Created by Dariy Kutelov on 13.03.23.
//

import Foundation

public extension Hashable where Self: Identifiable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
