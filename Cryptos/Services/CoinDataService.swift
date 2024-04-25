//
//  CoinDataService.swift
//  Cryptos
//
//  Created by Иван Карплюк on 18.09.2023.
//

import Foundation
import Combine

final class CoinDataService: ObservableObject
{
    
    @Published var allCoins: [CoinModel] = []
    
    private var coinSubscription: AnyCancellable?
    
    init() { getAllCoins() }
    
    private func getAllCoins()
    {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }

        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }

}


