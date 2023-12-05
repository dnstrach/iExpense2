//
//  ExpenseItem.swift
//  iExpense2
//
//  Created by Dominique Strachan on 12/5/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
