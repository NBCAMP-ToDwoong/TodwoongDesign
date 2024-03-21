
import UIKit

extension UIFont {
    func withTraits(_ traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
}

extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1.0

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    
    func adjustColor(brightnessDecreaseFactor: CGFloat = 0.2, saturationIncreaseFactor: CGFloat = 0.2) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            let adjustedBrightness = max(brightness - brightnessDecreaseFactor, 0)
            let adjustedSaturation = min(saturation + saturationIncreaseFactor, 1)
            return UIColor(hue: hue, saturation: adjustedSaturation, brightness: adjustedBrightness, alpha: alpha)
        } else {
            return UIColor(red: max(0, self.redComponent - brightnessDecreaseFactor),
                           green: max(0, self.greenComponent - brightnessDecreaseFactor),
                           blue: max(0, self.blueComponent - brightnessDecreaseFactor),
                           alpha: alpha)
        }
    }
    
    private var redComponent: CGFloat {
        var red: CGFloat = 0
        self.getRed(&red, green: nil, blue: nil, alpha: nil)
        return red
    }
    
    private var greenComponent: CGFloat {
        var green: CGFloat = 0
        self.getRed(nil, green: &green, blue: nil, alpha: nil)
        return green
    }
    
    private var blueComponent: CGFloat {
        var blue: CGFloat = 0
        self.getRed(nil, green: nil, blue: &blue, alpha: nil)
        return blue
    }
    
    var isLight: Bool {
        var white: CGFloat = 0.0
        getWhite(&white, alpha: nil)
        return white > 0.5
    }
}

extension UIImageView {
    static func createIconImageView(systemName: String, tintColor: UIColor, width: CGFloat, height: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: systemName)?.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
