//
//  CoinDetailsViewModel.swift
//  Coins
//
//  Created by Bekbol Bolatov on 09.01.2024.
//

import Foundation

final class CoinDetailsViewModel {
    private let coin: Coin
    
    var chartDataArray = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    
    var minPrice = 0.0
    var maxPrice = 0.0
    
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    
    private var overviewSectionModel: CoinDetailsSection {
        let currentPrice = Statistic(
            title: "Current Price",
            value: coin.currentPrice.toCurrencyWithTwoDecimals(),
            percentageDelta: coin.priceChangePercentage24H
        )
        let marketCap = Statistic(
            title: "Market Capitalization",
            value: coin.marketCap.toCurrencyWithTwoDecimals(),
            percentageDelta: coin.marketCapChangePercentage24H
        )
        let rank = Statistic(
            title: "Rank",
            value: String(coin.marketCapRank)
        )
        let volume = Statistic(
            title: "Volume",
            value: String(coin.totalVolume)
        )
        
        let section = CoinDetailsSection(
            title: "Overview",
            stats: [
                currentPrice,
                marketCap,
                rank,
                volume
            ]
        )
        
        return section
    }
    
    private var additionalDetailsModel: CoinDetailsSection {
        let high24H = Statistic(
            title: "24H High",
            value: coin.high24H.toCurrencyWithTwoDecimals()
        )
        let low24H = Statistic(
            title: "24H Low",
            value: coin.low24H.toCurrencyWithTwoDecimals()
        )
        let priceChange24H = Statistic(
            title: "24H Price Change",
            value: coin.priceChange24H.toCurrencyWithTwoDecimals(),
            percentageDelta: coin.priceChangePercentage24H
        )
        let marketCapChange24H = Statistic(
            title: "24H Market Cap Change",
            value: coin.marketCapChange24H.toCurrencyWithTwoDecimals(),
            percentageDelta: coin.marketCapChangePercentage24H
        )
        
        let section = CoinDetailsSection(
            title: "Additional Details",
            stats: [
                high24H,
                low24H,
                priceChange24H,
                marketCapChange24H
            ]
        )
        
        return section
    }

    
    init(coin: Coin) {
        self.coin = coin
        configureChartData()
    }
    
    func getOverviewSectionModel() -> CoinDetailsSection {
        overviewSectionModel
    }
    
    func getAdditionalDetailsModel() -> CoinDetailsSection {
        additionalDetailsModel
    }
    
    func getCoinName() -> String {
        coin.name
    }
    
    private func configureChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return }
        var index = 0
        
        minPrice = priceData.min() ?? 0.0
        maxPrice = priceData.max() ?? 0.0
        
        endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        
        yAxisValues = [minPrice, (minPrice + maxPrice) / 2, maxPrice]
        xAxisValues = [startDate, endDate]
        
        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 3600 * Double(index))
            
            let chartData = ChartData(date: date, value: price)
            chartDataArray.append(chartData)
            index += 1
        }
    }
}
