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
        return movie.getCharge(daysRented: daysRented)
    }
    
    func getFrequentRenterPoints() -> Int {
        if (movie.priceCode == .NEW_RELEASE) && (daysRented > 1) {
            return 2
        }
        return 1
    }
    
}
