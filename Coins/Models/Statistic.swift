//
//  Statistic.swift
//  Coins
//
//  Created by Bekbol Bolatov on 08.01.2024.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID().uuidString
    
    var title: String
    var value: String
    var percentageDelta: Double?
}
