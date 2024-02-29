
import UIKit

public class TDFont {
    
    public init() {}
    
    public enum FontStyle {
        case regular
        case bold
    }
    
    public func largeTitle(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .largeTitle)
            : UIFont.preferredFont(forTextStyle: .largeTitle).withTraits(.traitBold)
    }
    
    public func title1(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .title1)
            : UIFont.preferredFont(forTextStyle: .title1).withTraits(.traitBold)
    }

    public func title2(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .title2)
            : UIFont.preferredFont(forTextStyle: .title2).withTraits(.traitBold)
    }
    
    public func title3(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .title3)
            : UIFont.preferredFont(forTextStyle: .title3).withTraits(.traitBold)
    }
    
    public func body(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .body)
            : UIFont.preferredFont(forTextStyle: .body).withTraits(.traitBold)
    }
    
    public func subheadline(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .subheadline)
            : UIFont.preferredFont(forTextStyle: .subheadline).withTraits(.traitBold)
    }
    
    public func footnote(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .footnote)
            : UIFont.preferredFont(forTextStyle: .footnote).withTraits(.traitBold)
    }
    
    public func caption1(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .caption1)
            : UIFont.preferredFont(forTextStyle: .caption1).withTraits(.traitBold)
    }
    
    public func caption2(style: FontStyle) -> UIFont {
        return style == .regular
            ? UIFont.preferredFont(forTextStyle: .caption2)
            : UIFont.preferredFont(forTextStyle: .caption2).withTraits(.traitBold)
    }
}
