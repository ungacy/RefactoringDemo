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
        var totalAmount: Double = 0.0
        var frequentRenterPoints: Int = 0
        var result = "Rental Record for \(name)\n"
        
        // determine amounts for each line
        for each in rentals {
            
            // add frequent renter points
            frequentRenterPoints += 1
            // add bounds for a two day new release rental
            if (each.movie.priceCode == .NEW_RELEASE) && (each.daysRented > 1) {
                frequentRenterPoints += 1
            }
            
            // show figures for this rental
            result.append("\t\(each.movie.title)\t\(each.getCharge())\n")
            totalAmount += each.getCharge()
            
        }
        // add footer lines
        result.append("Amount owed is \(totalAmount)\n")
        result.append("You earned \(frequentRenterPoints) frequent renter points")
        return result
    }
    
}
