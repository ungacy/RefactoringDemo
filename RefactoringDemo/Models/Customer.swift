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
            var thisAmount: Double = 0.0
            switch each.movie.priceCode {
            case .REGULAR:
                thisAmount += 2
                if each.daysRented > 2 {
                    thisAmount += Double((each.daysRented - 2)) * 1.5
                }
            case .NEW_RELEASE:
                thisAmount += Double(each.daysRented) * 3
            case .CHILDREN:
                thisAmount += 1.5
                if each.daysRented > 3 {
                    thisAmount += Double((each.daysRented - 3)) * 1.5
                }
            }
            
            // add frequent renter points
            frequentRenterPoints += 1
            // add bounds for a two day new release rental
            if (each.movie.priceCode == .NEW_RELEASE) && (each.daysRented > 1) {
                frequentRenterPoints += 1
            }
            
            // show figures for this rental
            result.append("\t\(each.movie.title)\t\(thisAmount)\n")
            totalAmount += thisAmount
            
        }
        // add footer lines
        result.append("Amount owed is \(totalAmount)\n")
        result.append("You earned \(frequentRenterPoints) frequent renter points")
        return result
    }
    
}
