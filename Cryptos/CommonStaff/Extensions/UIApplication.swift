//
//  UIApplication.swift
//  Cryptos
//
//  Created by Иван Карплюк on 07.10.2023.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
