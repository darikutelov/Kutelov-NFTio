//
//  Log.swift
//  NFTio
//
//  Created by Dariy Kutelov on 28.03.23.
//

import Foundation
import os.log

enum Log {
    private static let subsystem = "com.kutelov.NFTio"
    
    static let general = Logger(subsystem: subsystem, category: "general")
    static let network = Logger(subsystem: subsystem, category: "network")
    static let info = Logger(subsystem: subsystem, category: "info")
    static let error = Logger(subsystem: subsystem, category: "error")
}
