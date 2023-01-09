//
//  Extensions.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit

//  MARK: - UIColor

extension UIColor {
//    static let background = UIColor(displayP3Red: 46/255, green: 78/255, blue: 116/255, alpha: 1)
    static let background = UIColor(displayP3Red: 38/255, green: 42/255, blue: 72/255, alpha: 1)
    static let textColor = UIColor(displayP3Red: 243/255, green: 249/255, blue: 249/255, alpha: 1)
    static let darkBlue = UIColor(displayP3Red: 53/255, green: 56/255, blue: 101/255, alpha: 1)
    static let selectedCell = UIColor(displayP3Red: 44/255, green: 209/255, blue: 222/255, alpha: 1)
    static let placeholderColor = UIColor(displayP3Red: 243/255, green: 249/255, blue: 249/255, alpha: 0.4)
    static let buttonBackground = UIColor(displayP3Red: 152/255, green: 189/255, blue: 221/255, alpha: 1)
    
    static let asteroidCellFirst = UIColor(displayP3Red: 228/255, green: 154/255, blue: 143/255, alpha: 1)
    static let asteroidCellSecond = UIColor(displayP3Red: 203/255, green: 205/255, blue: 148/255, alpha: 1)
    static let asteroidCellThird = UIColor(displayP3Red: 95/255, green: 77/255, blue: 137/255, alpha: 1)
    
    static let travelCellBackground = UIColor(displayP3Red: 53/255, green: 56/255, blue: 101/255, alpha: 1)
    
    static let selectedCompletedCell = UIColor(displayP3Red: 152/255, green: 189/255, blue: 221/255, alpha: 1)
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
    
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
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
