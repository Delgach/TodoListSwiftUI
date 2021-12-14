//
//  ItemList.swift
//  TodoListSwiftUI
//
//  Created by Владимир Дельгадильо on 08.12.2021.
//

import Foundation

class ItemsList: ObservableObject {
    @Published var items: [Item] = [Item(name: "name"), Item(name: "name2"), Item(name: "name3")]
    
    func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewItem(name: String) {
        items.append(Item(name: name))
    }
}
