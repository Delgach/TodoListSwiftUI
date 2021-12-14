//
//  Item.swift
//  TodoListSwiftUI
//
//  Created by Владимир Дельгадильо on 08.12.2021.
//

import Foundation

struct Item: Identifiable, Codable {
    let id = UUID()
    var name: String
    var isDone = false
}
