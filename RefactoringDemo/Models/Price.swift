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
}

public extension Price {
    public func getCharge(daysRented: Int) -> Double {
        var result: Double = 0.0
        switch priceCode() {
        case .REGULAR:
            result += 2
            if daysRented > 2 {
                result += Double((daysRented - 2)) * 1.5
            }
        case .NEW_RELEASE:
            result += Double(daysRented) * 3
        case .CHILDREN:
            result += 1.5
            if daysRented > 3 {
                result += Double((daysRented - 3)) * 1.5
            }
        }
        
        return result
    }
}

public class ChildrenPrice : Price {
    public func priceCode() -> PriceCodeType {
        return .CHILDREN
    }
}

public class NewReleasePrice : Price {
    public func priceCode() -> PriceCodeType {
        return .NEW_RELEASE
    }
}

public class RegularPrice : Price {
    public func priceCode() -> PriceCodeType {
        return .REGULAR
    }
}
