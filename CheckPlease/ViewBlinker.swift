//
//  ViewBlinker.swift
//  CheckPlease
//
//  Created by Jake Hirzel on 7/6/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

extension UIView {
    func blink() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: [.autoreverse, .repeat],
            animations: { [weak self] in self?.alpha = 0.0 },
            completion: { [weak self] _ in self?.alpha = 1.0 })
    }
    
    func fadeIn() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: UIViewAnimationOptions.curveEaseIn,
            animations: { self.alpha = 1.0 },
            completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: UIViewAnimationOptions.curveEaseOut,
            animations: { self.alpha = 0.0 },
            completion: nil)
    }
    
}
