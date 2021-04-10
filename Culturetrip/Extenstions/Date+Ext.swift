//
//  Date+Ext.swift
//  Culturetrip
//
//  Created by MiciH on 4/11/21.
//

import Foundation

extension Date{
    
    func convertStringToMonthYearFormat() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
