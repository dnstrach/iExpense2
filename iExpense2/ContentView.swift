//
//  ContentView.swift
//  iExpense2
//
//  Created by Dominique Strachan on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    // @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
          //  NavigationView {
                List {
                   // ForEach(expenses.items) { item in
                        ExpenseSection(title: "Business", expense: expenses.businessItems, deleteItems: removeBusinessItems)
                        
                        ExpenseSection(title: "Personal", expense: expenses.personalItems, deleteItems: removePersonalItems)
                        
                    //}
                    //.onDelete(perform: removeItems)
                    
                }
                .navigationTitle("iExpense")
                .toolbar {
                    NavigationLink(destination: AddView(expenses: expenses)) {
                        Image(systemName: "plus")
                    }
                }
                
                /*
                .toolbar {
                    Button {
    //                    showingAddExpense = true
                        
    //                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5.0)
    //                    expenses.items.append(expense)
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
            */
          //  }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) { // function used to delete items in our list
            var objectsToDelete = IndexSet()
            
            for offset in offsets {
                let item = inputArray[offset]
                
                if let index = expenses.items.firstIndex(of: item) {
                    objectsToDelete.insert(index)
                }
            }
            
            expenses.items.remove(atOffsets: objectsToDelete)
        }
        
        func removePersonalItems(at offsets: IndexSet) {
            removeItems(at: offsets, in: expenses.personalItems)
        }
        
        func removeBusinessItems(at offsets: IndexSet) {
            removeItems(at: offsets, in: expenses.businessItems)
        }
    
//    func removeItems(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
//    }
}

#Preview {
    ContentView()
}
