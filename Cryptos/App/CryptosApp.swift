//
//  CryptosApp.swift
//  Cryptos
//
//  Created by Иван Карплюк on 14.09.2023.
//

import SwiftUI

@main
struct CryptosApp: App
{
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene
    {
        WindowGroup
        {
            NavigationView
            {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
