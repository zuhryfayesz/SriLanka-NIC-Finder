//
//  NIC.swift
//  NIC
//
//  Created by Zuhry Fayesz on 1/12/17.
//  Copyright © 2017 Zuhry Fayesz. All rights reserved.
//

import Foundation

class NIC {

    var month:    [Int]     = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var monthTag: [String]  = ["", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    
    // Get Birth Year from NIC String
    func getYear(nic: String) -> Int {
       // let nicString = String(nic.characters.prefix(2))
        let nicString =   String(describing: nic.prefix(2))
        let numberNic = Int(nicString)
        let year      = 1900 + numberNic!
        return year
    }
    
    // Get Age from NIC String
    func getAge(nic: String) -> Int {
        let dateFormatter   = DateFormatter()
        let date            = Date()
        dateFormatter.locale = Locale(identifier: "en_LK")
        dateFormatter.setLocalizedDateFormatFromTemplate("YYYY")
        let postYear        = Int(dateFormatter.string(from: date))
        let age             = postYear! - getYear(nic: nic)
        return age
    }
    
    // Get the Birth Day and Month -> Return a Array of Strings
    func getMyDayMonth(myDay: Int) -> [String]  {
        var mo   = 0;
        var da   = 0;
        var days = myDay
        for i in 0 ..< month.count {
            if days < month[i] {
                mo = i + 1
                da = days
                break
            } else {
                days = days - month[i];
            }
        }
        let day = String(da)
        let myArray = [monthTag[mo], day]
        return myArray
    }
    
    // Get Gender from NIC String
    func getGender (nic: String) -> String {
        var gender:String
        let nicNumber = nic as NSString
        let nicInt = Int(nicNumber.substring(with:NSRange(location: 2, length: 3)))
        if nicInt! > 500 {
            gender = "Female"
        } else {
            gender = "Male"
        }
        return gender
    }
    
    // Get Days value from NIC String
    func getDays (nic: String) -> Int {
        let days: Int
        let nicNumber = nic as NSString
        let nicInt = Int(nicNumber.substring(with:NSRange(location: 2, length: 3)))
        if nicInt! > 500 {
            days = nicInt! - 500
        } else {
            days = nicInt!
        }
        return days
    }


}
