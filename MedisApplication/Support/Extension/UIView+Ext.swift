//
//  UIView+Ext.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import UIKit

extension UIView {
    func addTapGesture(tapNumber: Int = 1, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
}
