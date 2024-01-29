//
//  CoinDetailsView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 06.01.2024.
//

import SwiftUI

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel
    
    init(coin: Coin) {
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                // chart
                ChartView(viewModel: viewModel)
                    .frame(height: 250)
                    .padding(.vertical)
                // overview
                CoinDetailsSectionView(model: viewModel.getOverviewSectionModel())
                    .padding(.vertical)
                // additional details
                CoinDetailsSectionView(model: viewModel.getAdditionalDetailsModel())
                    .padding(.vertical)
            }
            .navigationTitle(viewModel.getCoinName())
            .scrollIndicators(.never)
            .padding()
        }
        
    }
}
