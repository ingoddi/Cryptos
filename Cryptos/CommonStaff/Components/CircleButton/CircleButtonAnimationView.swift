//
//  CircleButtonAnimationView.swift
//  Cryptos
//
//  Created by Иван Карплюк on 14.09.2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animate: Bool
    
    
    var body: some View
    {
        Circle()
            .stroke(style: .init(lineWidth: 5))
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeInOut(duration: 1.0) : .none)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
}
