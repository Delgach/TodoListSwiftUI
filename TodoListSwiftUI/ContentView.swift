//
//  ContentView.swift
//  TodoListSwiftUI
//
//  Created by Владимир Дельгадильо on 08.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var list = ItemsList()
    @State var isModalOpen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach (list.items) { item in
                    Text(item.name)
                }.onDelete(perform: list.removeItem).onMove(perform: list.moveItem)
            }.navigationBarItems(leading: Button(action: { self.isModalOpen = true }) {
                Text("add new item")
            }, trailing: EditButton())
            .sheet(isPresented: $isModalOpen) {
                ItemForm(itemslist: self.list)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
