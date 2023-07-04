//
//  Tansitions.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.05.23.
//

import SwiftUI

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
}
