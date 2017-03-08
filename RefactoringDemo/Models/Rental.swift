//
//  Rental.swift
//  RefactoringDemo
//
//  Created by Ye Tao on 2017/3/8.
//  Copyright © 2017年 Ye Tao. All rights reserved.
//

import Foundation

class Rental {
    public private(set) var movie: Movie
    public private(set) var daysRented: Int
    
    init(movie: Movie, daysRented: Int) {
        self.movie =  movie
        self.daysRented = daysRented
    }
    
    func getCharge() -> Double {
        var result: Double = 0.0
        switch movie.priceCode {
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
