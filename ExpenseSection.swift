//
//  ExpenseSection.swift
//  iExpense2
//
//  Created by Dominique Strachan on 12/5/23.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expense: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(expense == [] ? "" : title) {
            ForEach(expense) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .amountStyle(for: item)
                    
                }
            }
            .onDelete(perform: deleteItems)
            
        }
        
    }
}

#Preview {
    ExpenseSection(title: "Test", expense: [], deleteItems: { _ in })
}
