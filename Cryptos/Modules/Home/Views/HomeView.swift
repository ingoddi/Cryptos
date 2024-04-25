//
//  HomeView.swift
//  Cryptos
//
//  Created by Иван Карплюк on 14.09.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = true
    
    var body: some View {
        ZStack {
            
            //MARK: - Background layer
            Color.white
                .ignoresSafeArea()
            
            //MARK: - Content Layer
            VStack {
                headerView
                
                CustomSearchBar(searchText: $vm.searchText)
                    .padding()
                
                columnTitles
                
                if !showPortfolio {
                    allCoinList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}


//MARK: - Views
extension HomeView {
    
    //Header
    private var headerView: some View {
        VStack {
            HStack {
                CircleButtonView(systemIconName: showPortfolio ? "plus" : "info")
                    .animation(.none)
                    .background(
                        CircleButtonAnimationView(animate: $showPortfolio)
                    )
                Spacer()
                Text(showPortfolio ? "Портфолио" : "Живые цены")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                    .animation(.none)
                Spacer()
                CircleButtonView(systemIconName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring) {
                            showPortfolio.toggle()
                        }
                    }
            }
        }
        
    }
    
    //All Coins List
    private var allCoinList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    //Portfolio Coins List
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    //Column Titles
    private var columnTitles: some View {
        HStack {
            Text("Монета")
            Spacer()
            
            if showPortfolio {
                Text("Запас")
            }
           
            Text("Цена")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
        .padding(.horizontal, 20)
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden)
        }
        .environmentObject(dev.homeVM)
    }
}
