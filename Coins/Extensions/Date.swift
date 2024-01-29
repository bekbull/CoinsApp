//
//  Date.swift
//  Coins
//
//  Created by Bekbol Bolatov on 09.01.2024.
//

import Foundation

extension Date {
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}
