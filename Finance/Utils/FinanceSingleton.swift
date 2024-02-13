//
//  FinanceSingleton.swift
//  Finance
//
//  Created by Diggo Silva on 13/02/24.
//

import Foundation

class FinanceSingleton {
    static let shared: FinanceSingleton = FinanceSingleton()
    var listFinance: Bindable<[Finance]> = Bindable(value: [])
    
    private init() {}
}
