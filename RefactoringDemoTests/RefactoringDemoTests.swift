//
//  RefactoringDemoTests.swift
//  RefactoringDemoTests
//
//  Created by Ye Tao on 2017/3/8.
//  Copyright © 2017年 Ye Tao. All rights reserved.
//

import XCTest


class RefactoringDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let customer = Customer(name: "Ungacy")
        
        customer.addRental(rental: Rental(movie: Movie(title: "Logan", priceCode: .NEW_RELEASE), daysRented: 2))
        XCTAssertEqual(customer.statement(),
                       "Rental Record for Ungacy\n\tLogan\t6.0\nAmount owed is 6.0\nYou earned 2 frequent renter points")
        
        customer.addRental(rental: Rental(movie: Movie(title: "Logan", priceCode: .NEW_RELEASE), daysRented: 3))
        XCTAssertEqual(customer.statement(),
                       "Rental Record for Ungacy\n\tLogan\t6.0\n\tLogan\t9.0\nAmount owed is 15.0\nYou earned 4 frequent renter points")
        
        customer.addRental(rental: Rental(movie: Movie(title: "Little Prince", priceCode: .CHILDREN), daysRented: 3))
        XCTAssertEqual(customer.statement(),
                       "Rental Record for Ungacy\n\tLogan\t6.0\n\tLogan\t9.0\n\tLittle Prince\t1.5\nAmount owed is 16.5\nYou earned 5 frequent renter points")
        
        customer.addRental(rental: Rental(movie: Movie(title: "Little Prince", priceCode: .CHILDREN), daysRented: 4))
        XCTAssertEqual(customer.statement(),
                       "Rental Record for Ungacy\n\tLogan\t6.0\n\tLogan\t9.0\n\tLittle Prince\t1.5\n\tLittle Prince\t3.0\nAmount owed is 19.5\nYou earned 6 frequent renter points")
        
        customer.addRental(rental: Rental(movie: Movie(title: "Swift Programming", priceCode: .REGULAR), daysRented: 2))
        XCTAssertEqual(customer.statement(),
                       "Rental Record for Ungacy\n\tLogan\t6.0\n\tLogan\t9.0\n\tLittle Prince\t1.5\n\tLittle Prince\t3.0\n\tSwift Programming\t2.0\nAmount owed is 21.5\nYou earned 7 frequent renter points")
        
        customer.addRental(rental: Rental(movie: Movie(title: "Swift Programming", priceCode: .REGULAR), daysRented: 3))
        XCTAssertEqual(customer.statement(),
                       "Rental Record for Ungacy\n\tLogan\t6.0\n\tLogan\t9.0\n\tLittle Prince\t1.5\n\tLittle Prince\t3.0\n\tSwift Programming\t2.0\n\tSwift Programming\t3.5\nAmount owed is 25.0\nYou earned 8 frequent renter points")
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
