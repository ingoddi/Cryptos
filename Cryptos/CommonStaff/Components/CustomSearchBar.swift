//
//  SearchBar.swift
//  Cryptos
//
//  Created by Иван Карплюк on 27.09.2023.
//

import SwiftUI

struct CustomSearchBar: View {
    
    @Binding var searchText: String
    
    var body: some View
    {
        HStack
        {
            Image(systemName: "magnifyingglass")
            
            TextField("Search by symbol...", text: $searchText)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        },
                    alignment: .trailing
                )
            
        }
        .font(.headline)
        .padding()
        .background (
            RoundedRectangle (cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: Color.black.opacity (0.15),
                        radius: 10, x: 0, y: 0)
        )
    }
}

#Preview {
    CustomSearchBar(searchText: .constant(""))
}
