//
//  FileManager.swift
//  DindaSwift
//
//  Created by Fabio Yudi Takahara on 14/06/16.
//  Copyright © 2016 Fabio Yudi Takahara. All rights reserved.
//

import Foundation

class FileManager: NSObject {
    
    //////////////////////////////////////////////////////
    //Method for get a row array from a Account csv file//
    //////////////////////////////////////////////////////
    
    class func getAccountCsvData() -> NSArray
    {
        //check if file is CSV type
        guard let filepath = NSBundle.mainBundle().pathForResource("contas", ofType: "csv")
            else {
                return []
        }
        do {
            //get rows from CSV files
            let contents = try String(contentsOfFile: filepath, usedEncoding: nil)
            let rowsArray = contents.componentsSeparatedByString("\n")
            let accObjectArray: NSMutableArray = []
            
            //Convert CSV array into object
            for i in 0...rowsArray.count - 1 {
                let accountValue = rowsArray[i]
                let columnsArray = accountValue.componentsSeparatedByString(",")
                let accObject = AccountObject.init(array: columnsArray)
                
                accObjectArray.addObject(accObject)
            }
            
            //Success! Return Account Object Array
            return accObjectArray
            
        } catch {
            //Error
            return []
        }
    }
    
    //////////////////////////////////////////////////////////
    //Method for get a row array from a Transaction csv File//
    //////////////////////////////////////////////////////////
    
    class func getTransitionCsvData() -> NSArray
    {
        //check if file is SCV type
        guard let filepath = NSBundle.mainBundle().pathForResource("transacoes", ofType: "csv")
            else {
                return []
        }
        do {
            //get rows from CSV files
            let contents = try String(contentsOfFile: filepath, usedEncoding: nil)
            let rowsArray = contents.componentsSeparatedByString("\n")
            let TransitionObjectArray: NSMutableArray = []
            
            //Convert CSV array into object
            for i in 0...rowsArray.count - 1 {
                let transitionValue = rowsArray[i]
                let columnsArray = transitionValue.componentsSeparatedByString(",")
                let transitionObject = TransactionObject.init(array: columnsArray)
                
                TransitionObjectArray.addObject(transitionObject)
            }
            
            //Success! Return Account Object Array
            return TransitionObjectArray
            
        } catch {
            //Error
            return []
        }
    }
}