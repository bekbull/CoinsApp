//
//  Double.swift
//  Coins
//
//  Created by Bekbol Bolatov on 06.01.2024.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    func toCurrencyWithTwoDecimals() -> String {
        return currencyFormatter.string(for: self) ?? ""
    }
    
    func toPercent() -> String {
        var _res = numberFormatter.string(for: self) ?? ""
        _res = self > 0 ? "+" + _res : _res
        return _res + "%"
    }
}
