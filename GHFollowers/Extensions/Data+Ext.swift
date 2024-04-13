//
//  Data+Ext.swift
//  GHFollowers
//
//  Created by I Made Indra Mahaarta on 13/04/24.
//

import Foundation

extension Date {
    func convertToMonthYearFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
