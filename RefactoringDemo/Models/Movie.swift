//
//  Movie.swift
//  RefactoringDemo
//
//  Created by Ye Tao on 2017/3/8.
//  Copyright © 2017年 Ye Tao. All rights reserved.
//

import Foundation

public enum PriceCodeType: Int {
    case REGULAR = 0
    case NEW_RELEASE = 1
    case CHILDREN = 2
}

class Movie {
    
    public var title: String
    public var priceCode: PriceCodeType {
        set(newValue) {
            switch newValue {
            case .REGULAR:
                price = RegularPrice()
            case .CHILDREN:
                price = ChildrenPrice()
            case .NEW_RELEASE:
                price = NewReleasePrice()
            }
        }
        get {
            if let priceValue = price {
                return priceValue.priceCode()
            }
            assert(price != nil, "No price found")
            return .NEW_RELEASE
        }
        
    }
    private var price: Price?
    
    init(title: String, priceCode: PriceCodeType) {
        self.title = title
        self.priceCode = priceCode
    }
    
    func getCharge(daysRented: Int) -> Double {
        return price!.getCharge(daysRented: daysRented)
    }
    
    func getFrequentRenterPoints(daysRented: Int) -> Int {
        return price!.getFrequentRenterPoints(daysRented: daysRented)
    }
    
}
