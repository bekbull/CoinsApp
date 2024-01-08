//
//  StatisticView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 08.01.2024.
//

import SwiftUI

struct StatisticView: View {
    let model: Statistic

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.caption)
            Text(model.value)
                .font(.headline)
            
            let up = model.percentageDelta ?? 0 > 0
            if let delta = model.percentageDelta {
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                        .rotationEffect(.degrees(up ? 0 : 180))
                    Text(delta.toPercent())
                        .font(.caption).bold()
                }
                .foregroundStyle(up ? .green : .red)
            }
        }
    }
}
