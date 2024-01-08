//
//  CoinDetailsView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 06.01.2024.
//

import SwiftUI

struct CoinDetailsView: View {
    let coin: Coin
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // chart
                
                // overview
                let overviewSection = CoinDetailsSection(
                    title: "Overview",
                    stats: [
                        Statistic(
                            title: "Current Price",
                            value: coin.currentPrice.toCurrencyWithTwoDecimals(),
                            percentageDelta: coin.priceChangePercentage24H
                        ),
                        Statistic(
                            title: "Market Capitalization",
                            value: coin.marketCap.toCurrencyWithTwoDecimals(),
                            percentageDelta: coin.marketCapChangePercentage24H
                        ),
                        Statistic(
                            title: "Rank",
                            value: String(coin.marketCapRank)
                        ),
                        Statistic(
                            title: "Volume",
                            value: String(coin.totalVolume)
                        )
                    ]
                )
                CoinDetailsSectionView(model: overviewSection)
                    .padding(.vertical)
                // additional details
                let additionalDetails = CoinDetailsSection(
                    title: "Additional Details",
                    stats: [
                        Statistic(
                            title: "24H High",
                            value: coin.high24H.toCurrencyWithTwoDecimals()
                        ),
                        Statistic(
                            title: "24H Low",
                            value: coin.low24H.toCurrencyWithTwoDecimals()
                        ),
                        Statistic(
                            title: "24H Price Change",
                            value: coin.priceChange24H.toCurrencyWithTwoDecimals(),
                            percentageDelta: coin.priceChangePercentage24H
                        ),
                        Statistic(
                            title: "24H Market Cap Change",
                            value: coin.marketCapChange24H.toCurrencyWithTwoDecimals(),
                            percentageDelta: coin.marketCapChangePercentage24H
                        )
                    ]
                )
                CoinDetailsSectionView(model: additionalDetails)
                    .padding(.vertical)
            }
            .navigationTitle(coin.name)
            .padding()
        }
        
    }
}
