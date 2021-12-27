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
                ForEach (list.items.indexed(), id: \.1.id) { index, book in
                    HStack {
                        Toggle(list.items[index].name, isOn: $list.items[index].isDone)
                    }
                }.onDelete(perform: list.removeItem).onMove(perform: list.moveItem)
            }.navigationBarItems(leading: Button(action: { self.isModalOpen = true }) {
                Text("add new item")
            }, trailing: EditButton()).onAppear{ list.saveData()}
            .sheet(isPresented: $isModalOpen) {
                ItemForm(itemslist: self.list)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

