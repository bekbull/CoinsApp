//
//  CoinDetailsSectionView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 08.01.2024.
//

import SwiftUI

struct CoinDetailsSectionView: View {
    let model: CoinDetailsSection
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack {
            Text(model.title)
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(model.stats) { stat in
                    StatisticView(model: stat)
                }
            }
        }
    }
}
