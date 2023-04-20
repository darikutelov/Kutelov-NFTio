//
//  TimeUnit.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import Foundation

enum TimeUnit: String, CaseIterable {
    case days, hours, mins, secs
}

extension TimeUnit {
    func getTimeUnitValue(totalRemainingSeconds: Int) -> String {
        var time = 0
        
        guard totalRemainingSeconds >= 0 else {
            return "00"
        }
        
        switch self {
        case . days:
            let totalRemainingDays = totalRemainingSeconds / ( 60 * 60 * 24 )
            guard totalRemainingDays > 0 else { return "00" }
            time = totalRemainingDays
        case . hours:
            let totalRemainingHours = totalRemainingSeconds / ( 60 * 60 )
            guard totalRemainingHours > 0 else { return "00" }
            time = totalRemainingHours % 24
        case .mins:
            let totalRemainingMinutes = totalRemainingSeconds / 60
            guard totalRemainingMinutes > 0 else { return "00" }
            time = totalRemainingMinutes % 60
        case .secs:
            time = totalRemainingSeconds % 60
        }
        
        return time < 10 ? "0\(time)" : "" + "\(time)"
    }
}
