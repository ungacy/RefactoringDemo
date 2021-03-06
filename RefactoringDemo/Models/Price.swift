//
//  Price.swift
//  RefactoringDemo
//
//  Created by Ye Tao on 2017/3/8.
//  Copyright © 2017年 Ye Tao. All rights reserved.
//

import Foundation

public protocol Price {
    func priceCode() -> PriceCodeType
    func getCharge(daysRented: Int) -> Double
    func getFrequentRenterPoints(daysRented: Int) -> Int
}

public extension Price {
    public func getFrequentRenterPoints(daysRented: Int) -> Int {
        return 1
    }
}

public class ChildrenPrice : Price {
    public func priceCode() -> PriceCodeType {
        return .CHILDREN
    }
    
    public func getCharge(daysRented: Int) -> Double {
        var result: Double = 0.0
        result += 1.5
        if daysRented > 3 {
            result += Double((daysRented - 3)) * 1.5
        }
        return result
    }
}

public class NewReleasePrice : Price {
    public func priceCode() -> PriceCodeType {
        return .NEW_RELEASE
    }
    
    public func getCharge(daysRented: Int) -> Double {
        var result: Double = 0.0
        result += Double(daysRented) * 3
        return result
    }
    
    public func getFrequentRenterPoints(daysRented: Int) -> Int {
        return daysRented > 1 ? 2 : 1
    }

}

public class RegularPrice : Price {
    public func priceCode() -> PriceCodeType {
        return .REGULAR
    }
    
    public func getCharge(daysRented: Int) -> Double {
        var result: Double = 0.0
        result += 2
        if daysRented > 2 {
            result += Double((daysRented - 2)) * 1.5
        }
        return result
    }
}
