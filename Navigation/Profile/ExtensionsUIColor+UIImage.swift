//
//  ExtensionUIColor.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 19.06.2022.
//

import Foundation
import UIKit

//расширение для конвертации HEX в UIColor
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")
       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

//расширение для добавления прозрачности изображению
extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

let blueHexColor = UIColor(rgb: 0x4885CC)

let bluePixel: UIImage = { () -> UIImage in
    var image: UIImage? = nil
    if let bluePixel = UIImage(named: "blue_pixel") {
        image = bluePixel
    }
    return image!
}()
