//
//  CoinImageViewModel.swift
//  Cryptos
//
//  Created by Иван Карплюк on 25.09.2023.
//

import SwiftUI
import Combine


final class CoinImageViewModel: ObservableObject
{
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel)
    {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        
        addSubscribers()
    }
    
    private func addSubscribers()
    {
        
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
    
}
