//
//  TopMoversView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 04.01.2024.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topMovers) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }.padding(2)
            }
        }
        .padding()
    }
}

#Preview {
    TopMoversView(viewModel: HomeViewModel())
}
