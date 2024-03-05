//
//  File.swift
//  
//
//  Created by yen on 3/5/24.
//

import Foundation

public class CategoryModel {
    public var id: UUID?
    public var title: String
    public var color: String?
    public var indexNumber: Int32?
    public var todo: TodoModel?
    
    public init(id: UUID?, title: String, color: String?, indexNumber: Int32?, todo: TodoModel?) {
        self.id = id
        self.title = title
        self.color = color
        self.indexNumber = indexNumber
        self.todo = todo
    }
}

public class TodoModel{
    public var id: UUID?
    public var title: String
    public var dueDate: Date?
    public var dueTime: Date?
    public var place: String?
    public var isCompleted: Bool
    public var fixed: Bool
    public var timeAlarm: Bool
    public var placeAlarm: Bool
    public weak var category: CategoryModel?
    
    public init(id: UUID?,
                title: String,
                dueDate: Date?,
                dueTime: Date?,
                place: String?,
                isCompleted: Bool,
                fixed: Bool,
                timeAlarm: Bool,
                placeAlarm: Bool,
                category: CategoryModel?
    ) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.dueTime = dueTime
        self.place = place
        self.isCompleted = isCompleted
        self.fixed = fixed
        self.timeAlarm = timeAlarm
        self.placeAlarm = placeAlarm
        self.category = category
    }
}
