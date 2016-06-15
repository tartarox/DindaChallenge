//
//  TransactionManager.swift
//  DindaSwift
//
//  Created by Fabio Yudi Takahara on 14/06/16.
//  Copyright © 2016 Fabio Yudi Takahara. All rights reserved.
//

import Foundation

class TransactionManager: NSObject {
    
    ////////////////////////////////
    //       Do transaction       //
    ////////////////////////////////
    
    //Class responsible for making the transaction of customers and deduct the value of 500 case accessible to transfer is negative
    class func calculateTransaction(accArray: NSArray, transactionArray: NSArray) -> NSArray
    {
        for accObject in accArray as! [AccountObject]{
            let currentID = accObject.accountId

            for transactionObject in transactionArray as! [TransactionObject]{
                if currentID == transactionObject.accountId {
                    accObject.value += transactionObject.value
                    if transactionObject.value < 0 && accObject.value < 0 {
                        accObject.value -= 500
                    }
                }
            }
        }
        return accArray
    }
}