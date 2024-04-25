//
//  CoinRowView.swift
//  Cryptos
//
//  Created by Иван Карплюк on 14.09.2023.
//

import SwiftUI

struct CoinRowView: View
{
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View
    {
        HStack(spacing: 4)
        {
            leftColumnOfRow
            Spacer()
            if showHoldingsColumn {
                centerColumnOfRow
            }
            rightColumnOfRow
        }
        .font(.subheadline)
    }
}

extension CoinRowView
{
    
    private var leftColumnOfRow: some View
    {
        HStack
        {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(.black
            )
        }
    }
    
    private var centerColumnOfRow: some View
    {
        Group
        {
            VStack(alignment: .trailing)
            {
                Text(coin.currentHoldingsValue.asCurrencyWith4Decimals())
                Text(coin.currentHoldings?.asNumberString() ?? "nil")
            }
            .foregroundStyle(.black)
        }
    }
    
    private var rightColumnOfRow: some View
    {
        Group
        {
            VStack(alignment: .trailing)
            {
                Text("\(coin.currentPrice.asCurrencyWith2Decimals())")
                    .bold()
                    .foregroundStyle(.black)
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "nil")
                    .foregroundStyle(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                        Color.green :
                        Color.red
                    )
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
    }
}


struct CoinRowView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
    }
}
