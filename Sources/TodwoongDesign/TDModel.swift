//
//  File.swift
//  
//
//  Created by yen on 3/5/24.
//

import Foundation

public struct CategoryStruct {
    public var id: UUID?
    public var title: String
    public var color: String?
    public var indexNumber: Int32?
    public var todoId: UUID?

    public init(id: UUID?, title: String, color: String?, indexNumber: Int32?, todoId: UUID?) {
        self.id = id
        self.title = title
        self.color = color
        self.indexNumber = indexNumber
        self.todoId = todoId
    }
}

public struct TodoStruct {
    public var id: UUID?
    public var title: String
    public var dueDate: Date?
    public var dueTime: Date?
    public var place: String?
    public var isCompleted: Bool
    public var fixed: Bool
    public var timeAlarm: Bool
    public var placeAlarm: Bool
    public var categoryId: UUID?

    public init(id: UUID?, title: String, dueDate: Date?, dueTime: Date?, place: String?, isCompleted: Bool, fixed: Bool, timeAlarm: Bool, placeAlarm: Bool, categoryId: UUID?) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.dueTime = dueTime
        self.place = place
        self.isCompleted = isCompleted
        self.fixed = fixed
        self.timeAlarm = timeAlarm
        self.placeAlarm = placeAlarm
        self.categoryId = categoryId
    }
}
