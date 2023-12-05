//
//  AddView.swift
//  iExpense2
//
//  Created by Dominique Strachan on 12/5/23.
//

import SwiftUI

struct customizeAmount: ViewModifier {
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<10:
            content
                .foregroundColor(Color("Light"))
                .fontWeight(.semibold)
        case 10..<100:
            content
                .foregroundColor(Color("Mid"))
                .fontWeight(.semibold)
                
        default:
            content
                .foregroundColor(Color("Dark"))
                .fontWeight(.semibold)
        }
        
    }
}

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var title = "Expense Name"
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
               // TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            
          /*
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        */
        }
    }
}

extension View {
    func amountStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(customizeAmount(expenseItem: expenseItem))
    }
}

#Preview {
    AddView(expenses: Expenses())
}
