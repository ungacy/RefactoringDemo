//
//  Movie.swift
//  RefactoringDemo
//
//  Created by Ye Tao on 2017/3/8.
//  Copyright © 2017年 Ye Tao. All rights reserved.
//

import Foundation

class Movie {
    
    enum PriceCodeType: Int {
        case REGULAR = 0
        case NEW_RELEASE = 1
        case CHILDREN = 2
    }
    
    public var title: String
    public var priceCode: PriceCodeType
    
    init(title: String, priceCode: PriceCodeType) {
        self.title = title
        self.priceCode = priceCode
    }
}
