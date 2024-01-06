//
//  CoinRowView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 06.01.2024.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack {
            // market cap rank
            Text("\(coin.marketCapRank ?? 0)")
                .font(.caption)
                .foregroundStyle(.gray)
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
            // coin name info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            // coin price info
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrencyWithTwoDecimals())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(coin.priceChangePercentage24H.toPercent())
                    .font(.caption)
                    .foregroundStyle(
                        coin.priceChangePercentage24H < 0 ? .red : .green
                    )
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
