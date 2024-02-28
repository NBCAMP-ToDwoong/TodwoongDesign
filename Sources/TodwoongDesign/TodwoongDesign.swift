
import UIKit

public class TDStyle {
    public static let font: TDFonts = TDFonts()
    public static let color: TDColors = TDColors()
}

public class TDButton {
    public static func chip(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> TDCustomButtons {
        return TDCustomButtons(frame: frame, type: .chip, title: title, backgroundColor: backgroundColor)
    }
    
    public static func medium(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> TDCustomButtons {
        return TDCustomButtons(frame: frame, type: .medium, title: title, backgroundColor: backgroundColor)
    }
    
    public static func full(
        frame: CGRect = .zero,
        title: String,
        backgroundColor: UIColor
    ) -> TDCustomButtons {
        return TDCustomButtons(frame: frame, type: .full, title: title, backgroundColor: backgroundColor)
    }
}
