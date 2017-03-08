//
//  ViewController.swift
//  RefactoringDemo
//
//  Created by Ye Tao on 2017/3/8.
//  Copyright © 2017年 Ye Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let movie = Movie(title: "Logan", priceCode: .NEW_RELEASE)
        let rental = Rental(movie: movie, daysRented: 3)
        let customer = Customer(name: "Ungacy")
        customer.addRental(rental: rental)
        let statement = customer.statement()
        display.text = statement
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

