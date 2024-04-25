//
//  CoinImageView.swift
//  Cryptos
//
//  Created by Иван Карплюк on 25.09.2023.
//

import SwiftUI


struct CoinImageView: View
{
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel)
    {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View
    {
        ZStack
        {
            if let image = vm.image
            {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading
            {
                ProgressView()
            } else
            {
                Image(systemName: "questionmark")
                    .foregroundStyle(.black)
            }
        }
    }
}

struct CoinImageView_Preview: PreviewProvider
{
    static var previews: some View
    {
        CoinImageView(coin: dev.coin)
    }
}

