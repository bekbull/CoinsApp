//
//  TopMoversItemView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 04.01.2024.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            // logo
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
                .padding(.bottom, 8)
            // title
            
            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .textCase(.uppercase)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(LCColors.primaryTextColor)
                Text(coin.currentPrice.toCurrencyWithTwoDecimals())
                    .textCase(.uppercase)
                    .font(.caption)
                    .foregroundStyle(LCColors.primaryTextColor)
                    .opacity(0.5)
            }
            
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundStyle(
                    coin.priceChangePercentage24H < 0 ? .red : .green
                )
            // percentage change
        }
        .frame(width: 140, height: 140)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(coin.priceChangePercentage24H < 0 ? .red : .green), lineWidth: 1)
        }
    }
}
