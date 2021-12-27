//
//  ItemList.swift
//  TodoListSwiftUI
//
//  Created by Владимир Дельгадильо on 08.12.2021.
//

import Foundation

class ItemsList: ObservableObject {
    @Published var items: [Item] = [Item(name: "name"), Item(name: "name2"), Item(name: "name3")]
    
    init() {
        loadData()
    }
    
    func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        saveData()
    }
    
    func addNewItem(name: String) {
        items.append(Item(name: name))
        saveData()
    }
    
    func getDocumentDirectory() -> URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return documentDirectory[0]
    }
    
    func getDataFilePath() -> URL {
        return getDocumentDirectory().appendingPathComponent("TodoList.plist")
    }
    
    func saveData() {
        let encoder = PropertyListEncoder()
        
        do {
            let encodedData = try encoder.encode(items)
            try encodedData.write(to: getDataFilePath())
        }
        catch {
            print("throw error at saving: \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        let decoder = PropertyListDecoder()
        
        if let data = try? Data(contentsOf: getDataFilePath()) {
            do {
                items = try decoder.decode([Item].self, from: data)
            } catch {
                print("throw error at load: \(error.localizedDescription)")
            }
        }
    }
}
