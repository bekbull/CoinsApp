//
//  HomeView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 04.01.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // top mover
                TopMoversView(viewModel: viewModel)
                Divider()
                    .padding(.bottom)
                // all coins
                AllCoinView(viewModel: viewModel)
            }.navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
