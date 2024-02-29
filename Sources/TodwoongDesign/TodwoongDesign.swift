
import UIKit

public class TDStyle {
    public static let font: TDFont = TDFont()
    public static let color: TDColor = TDColor()
}

public class TDButton {
    public static func chip(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> TDCustomButton {
        return TDCustomButton(frame: frame, type: .chip, title: title, backgroundColor: backgroundColor)
    }
    
    public static func medium(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> TDCustomButton {
        return TDCustomButton(frame: frame, type: .medium, title: title, backgroundColor: backgroundColor)
    }
    
    public static func full(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> TDCustomButton {
        return TDCustomButton(frame: frame, type: .full, title: title, backgroundColor: backgroundColor)
    }
}
