//
//  HomeViewModel.swift
//  Coins
//
//  Created by Bekbol Bolatov on 06.01.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovers = [Coin]()
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err { print("DEBUG: Error while fetching: \(err.localizedDescription)"); return }
            
            if let res = res as? HTTPURLResponse { print("DEBUG: Response code: \(res.statusCode)") }
            
            guard let data = data else { return }
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async { [unowned self] in
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch let err {
                print("DEBUG: Failed to decode with error: \(err.localizedDescription)")
            }
        }.resume()
    }
    
    func configureTopMovingCoins() {
        let _topMovers = coins.sorted { abs($0.priceChangePercentage24H) > abs($1.priceChangePercentage24H) }
        topMovers = Array(_topMovers.prefix(5))
    }
}
