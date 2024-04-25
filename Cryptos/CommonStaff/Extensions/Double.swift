//
//  Double.swift
//  Cryptos
//
//  Created by Иван Карплюк on 14.09.2023.
//

import Foundation

extension Double {
    
    ///Конвертирует Double в Currency с 2-4 знаками после запятой
    ///```
    ///Ковертирует 1234.45645 в $1234.4564
    ///```
    private var currencyFormatter4: NumberFormatter
    {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 4
        return formatter
    }
    
    ///Конвертирует Double в валюту как String с 2-4 знаками после запятой
    ///```
    ///Ковертирует 1234.45645 в "$1234.4564"
    ///```
    func asCurrencyWith4Decimals(
    ) -> String {
        let number = NSNumber(value: self)
        return currencyFormatter4.string(from: number) ?? "$0.00"
    }
    
    ///Конвертирует Double в Currency с 1-2 знаками после запятой
    ///```
    ///Ковертирует 1234.45645 в $1234.45
    ///```
    private var currencyFormatter2: NumberFormatter
    {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    ///Конвертирует Double в валюту как String с 1-2 знаками после запятой
    ///```
    ///Ковертирует 1234.45645 в "$1234.45"
    ///```
    func asCurrencyWith2Decimals() -> String
    {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    ///Конвертирует Double в String с 2 знаками после запятой
    ///```
    ///Ковертирует 1234.45645 в "1234.45"
    ///```
    func asNumberString() -> String
    {
        return String(format: "%.2f", self)
    }
    
    ///Конвертирует Double в String с 2 знаками после запятой и знаком "%" в конце строки
    ///```
    ///Ковертирует 1234.45645 в "1234.45%"
    ///```
    func asPercentString() -> String
    {
        return asNumberString() + "%"
    }
}
