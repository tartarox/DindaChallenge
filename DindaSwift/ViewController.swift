//
//  ViewController.swift
//  DindaSwift
//
//  Created by Fabio Yudi Takahara on 14/06/16.
//  Copyright © 2016 Fabio Yudi Takahara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get Array of Accounts Objects
        let accountArray = FileManager.getAccountCsvData()
        
        //Get Array of Transaction Objects
        let transactionArray = FileManager.getTransitionCsvData()
        
        //Check if no one empty array
        if accountArray.count != 0 && transactionArray.count != 0 {
            
            //Performing calculations between Accounts and Transactions, return account Objects Array
            let transactionResult = TransactionManager.calculateTransaction(accountArray, transactionArray: transactionArray)
            
            //Log for display result
            for accObject in transactionResult as! [AccountObject]{
                print("\(accObject.accountId),\(accObject.value)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

