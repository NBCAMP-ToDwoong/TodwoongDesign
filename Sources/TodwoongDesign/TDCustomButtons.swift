
import UIKit

public class TDCustomButtons: UIButton {
    
    public enum ButtonStyle {
        case chip
        case medium
        case full
    }
    
    public init(frame: CGRect, type: ButtonStyle, title: String, backgroundColor: UIColor) {
        super.init(frame: frame)
        configureButton(type: type, title: title, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func textColor(forBackgroundColor backgroundColor: UIColor) -> UIColor {
        switch backgroundColor {
        case TDStyle.color.bgGray: return .black
        case TDStyle.color.bgRed: return TDStyle.color.textRed
        case TDStyle.color.bgOrange: return TDStyle.color.textOrangeYellow
        case TDStyle.color.bgYellow: return TDStyle.color.textOrangeYellow
        case TDStyle.color.bgGreen: return TDStyle.color.textGreen
        case TDStyle.color.bgBlue: return TDStyle.color.textBlue
        case TDStyle.color.bgPurple: return TDStyle.color.textPurple
        default: return backgroundColor.isLight ? .black : .white // 기본값
        }
    }
    
    private func configureButton(type: ButtonStyle, title: String, backgroundColor: UIColor) {
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = backgroundColor
        config.cornerStyle = .capsule
        
        switch type {
        case .chip: config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 12, bottom: 5, trailing: 12)
        case .medium: config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        case .full: config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32)
        }
        
        let textColor = self.textColor(forBackgroundColor: backgroundColor)
        let attributes = AttributeContainer([.font: TDStyle.font.body(style: .regular), .foregroundColor: textColor])
        let attributedString = AttributedString(title, attributes: attributes)
        config.attributedTitle = attributedString
        
        self.configuration = config
    }
}
