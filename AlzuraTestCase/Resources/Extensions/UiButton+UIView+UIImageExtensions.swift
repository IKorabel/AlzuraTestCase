//
//  UiButton+UIView+UIImageExtensions.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 19.08.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func addSpringAnimation() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } completion: { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
    
    func dropOutView() {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            self.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }
    }
    
    func raiseView() {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
}

// MARK: UIImage extension

extension UIImage {
    
    static func pixel(ofColor color: UIColor) -> UIImage {

     let lightModeImage = UIImage.generatePixel(ofColor: color, userInterfaceStyle: .light)

     let darkModeImage = UIImage.generatePixel(ofColor: color, userInterfaceStyle: .dark)

     lightModeImage.imageAsset?.register(darkModeImage, with: UITraitCollection(userInterfaceStyle: .dark))

     return lightModeImage

     }

     static private func generatePixel(ofColor color: UIColor, userInterfaceStyle: UIUserInterfaceStyle) -> UIImage {

     var image: UIImage!

     if #available(iOS 13.0, *) {
         UITraitCollection(userInterfaceStyle: userInterfaceStyle).performAsCurrent { image = .generatePixel(ofColor: color) }
     } else {
        image = .generatePixel(ofColor: color)
     }

     return image
     }

     static private func generatePixel(ofColor color: UIColor) -> UIImage {
     let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

     UIGraphicsBeginImageContext(pixel.size)
     defer { UIGraphicsEndImageContext() }

     guard let context = UIGraphicsGetCurrentContext() else {
     return UIImage()
     }

     context.setFillColor(color.cgColor)
     context.fill(pixel)

     return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}

// MARK: UIButton extension

extension UIButton {
    func setBackgroundColor(_ backgroundColor: UIColor, forState: UIButton.State) {
        setBackgroundImage(.pixel(ofColor: backgroundColor), for: forState)
    }
    
    func setInsets(forContentPadding contentPadding: UIEdgeInsets,imageTitlePadding: CGFloat) {
            self.contentEdgeInsets = UIEdgeInsets(
                top: contentPadding.top,
                left: contentPadding.left,
                bottom: contentPadding.bottom,
                right: contentPadding.right + imageTitlePadding
            )
            self.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: imageTitlePadding,
                bottom: 0,
                right: -imageTitlePadding
            )
        }
    
    func makeASStyleCircularButton(title: String,cornerRadius: CGFloat = 0, backgroundColor: UIColor, titleColor: UIColor = .white) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setBackgroundColor(backgroundColor, forState: .normal)
    }
}


