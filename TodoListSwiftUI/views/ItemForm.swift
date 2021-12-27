//
//  ItemForm.swift
//  TodoListSwiftUI
//
//  Created by Владимир Дельгадильо on 13.12.2021.
//

import SwiftUI

struct ItemForm: View {
    var itemslist: ItemsList
    
    @State var itemName = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Form {
                TextField("name", text: $itemName)
                Button(action: {
                    itemslist.addNewItem(name: itemName)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("create new item")
                    }
                }
            }
        }
    }
}

struct ItemForm_Previews: PreviewProvider {
    static var previews: some View {
        ItemForm(itemslist: ItemsList())
    }
}
