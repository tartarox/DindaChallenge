//
//  AccountObject.swift
//  DindaSwift
//
//  Created by Fabio Yudi Takahara on 14/06/16.
//  Copyright © 2016 Fabio Yudi Takahara. All rights reserved.
//

import Foundation

//Account Object
class AccountObject: NSObject {
    var accountId: Int = 0
    var value: Int = 0
    
    init(array:[String]) {
        super.init()
        
        if let accID = array.first, let value = array.last {
            self.accountId = (accID as NSString).integerValue
            self.value = (value as NSString).integerValue
        }
    }
}