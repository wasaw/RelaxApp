//
//  Extensions.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit

//  MARK: - UIColor

extension UIColor {
    static let background = UIColor(displayP3Red: 46/255, green: 78/255, blue: 116/255, alpha: 1)
    static let textColor = UIColor(displayP3Red: 243/255, green: 249/255, blue: 249/255, alpha: 1)
    static let placeholderColor = UIColor(displayP3Red: 243/255, green: 249/255, blue: 249/255, alpha: 0.4)
    static let buttonBackground = UIColor(displayP3Red: 152/255, green: 189/255, blue: 221/255, alpha: 1)
}

//  MARK: - UIView

extension UIView {
    func anchor(left: NSLayoutXAxisAnchor? = nil, top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, paddingLeft: CGFloat = 0, paddingTop: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

//  MARK: - UITextField

extension UITextField {
    func homeTextField(withPlaceholder: String) -> UITextField {
        let tf = UITextField()
        tf.font = UIFont.boldSystemFont(ofSize: 18)
        tf.textColor = .textColor
        tf.attributedPlaceholder = NSAttributedString(string: withPlaceholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.placeholderColor])
        return tf
    }
}
