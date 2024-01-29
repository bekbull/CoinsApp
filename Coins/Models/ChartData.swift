//
//  ChartData.swift
//  Coins
//
//  Created by Bekbol Bolatov on 09.01.2024.
//

import Foundation

struct ChartData: Identifiable {
    let id = UUID().uuidString
    let date: Date
    let value: Double
}
