
import Foundation

public struct TodoModel {
    public var id: String
    public var title: String
    public var place: String?
    public var dueDate: Date?
    public var dueTime: Date?
    public var isCompleted: Bool
    public var placeAlarm: Bool
    public var timeAlarm: Bool
    public var category: String?

    public init(id: String, title: String, place: String? = nil, dueDate: Date? = nil, dueTime: Date? = nil, isCompleted: Bool, placeAlarm: Bool, timeAlarm: Bool, category: String? = nil) {
        self.id = id
        self.title = title
        self.place = place
        self.dueDate = dueDate
        self.dueTime = dueTime
        self.isCompleted = isCompleted
        self.placeAlarm = placeAlarm
        self.timeAlarm = timeAlarm
        self.category = category
    }
}
