//
//  String.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

extension String {
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: self) ?? Date.now
    }
}
