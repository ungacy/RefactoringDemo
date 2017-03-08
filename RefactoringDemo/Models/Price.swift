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
