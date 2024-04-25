//
//  CircleButton.swift
//  Cryptos
//
//  Created by Иван Карплюк on 14.09.2023.
//

import SwiftUI

struct CircleButtonView: View
{
    
    let systemIconName: String
    
    var body: some View
    {
        Image(systemName: systemIconName)
            .foregroundStyle(.black)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(.background)
            )
            .shadow(color: Color.black.opacity(0.25),
                    radius: 10)
            .padding()
    }
}

#Preview {
    CircleButtonView(systemIconName: "info")
        .previewLayout(.sizeThatFits)
}
