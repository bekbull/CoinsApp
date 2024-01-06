//
//  AllCoinView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 06.01.2024.
//

import SwiftUI

struct AllCoinView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
            
            HStack {
                Text("Coin")
                
                Spacer()
                
                Text("Price")
                    
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            .padding(.vertical, 4)
        }
        .padding(.horizontal)
        
        ScrollView(.vertical) {
            VStack {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(destination: {
                        CoinDetailsView()
                    }, label: {
                        CoinRowView(coin: coin)
                    })
                }
            }
        }
    }
}

#Preview {
    AllCoinView(viewModel: HomeViewModel())
}
