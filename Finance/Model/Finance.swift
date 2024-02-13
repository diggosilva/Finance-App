//
//  Finance.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import UIKit

class Finance {
    var title: String
    var description: String
    var tag: String
    var amount: Double
    
    init(title: String, description: String, tag: String, amount: Double) {
        self.title = title
        self.description = description
        self.tag = tag
        self.amount = amount
    }
}
