//
//  CoinImageService.swift
//  Cryptos
//
//  Created by Иван Карплюк on 25.09.2023.
//

import SwiftUI
import Combine


final class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private let coin: CoinModel
    private let imageName: String
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    
    private var imageSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id,
                                                 folderName: "coin_images") {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] (returnedImage) in
                guard let self = self,
                                 let downloadedImage = returnedImage
                else {
                    return
                }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage,
                                           imageName: imageName,
                                           folderName: folderName)
            })
    }
    
}
