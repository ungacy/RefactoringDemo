//
//  Customer.swift
//  RefactoringDemo
//
//  Created by Ye Tao on 2017/3/8.
//  Copyright © 2017年 Ye Tao. All rights reserved.
//

import Foundation

class Customer {
    public private(set) var name: String
    private var rentals = [Rental]()
    
    init(name: String) {
        self.name = name
    }
    
    public func addRental(rental: Rental) {
        rentals.append(rental)
    }
    
    func statement() -> String {
        var frequentRenterPoints: Int = 0
        var result = "Rental Record for \(name)\n"
        // determine amounts for each line
        for each in rentals {
            
            // add frequent renter points
            frequentRenterPoints += each.getFrequentRenterPoints()
            
            // show figures for this rental
            result.append("\t\(each.movie.title)\t\(each.getCharge())\n")
            
        }
        // add footer lines
        result.append("Amount owed is \(getTotalCharge())\n")
        result.append("You earned \(frequentRenterPoints) frequent renter points")
        return result
    }
    
    func getTotalCharge() -> Double {
        var result: Double = 0.0
        for each in rentals {
            result += each.getCharge()
        }
        return result
    }
    
}
