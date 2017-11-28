//
//  KeypadBehavior.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/30/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class KeypadBehavior {
    
    func keypadButtonTapped(_ button: UIButton, textIn: String, totalIn: String) -> (textOut: String, totalOut: String) {
        
        // Only allow one .
        if button.titleLabel!.text == "." && textIn.contains(".") == true {
            return (textOut: textIn, totalOut: totalIn)
        }
        
        // Only allow two characters after a .
        else if textIn.count > 3 && textIn[(textIn.index(textIn.endIndex, offsetBy: -3))] == "." {
            return (textOut: textIn, totalOut: totalIn)
        }
        
        // Limit to thousands place (plus optional decimal and change)
        else if textIn.count == 5 && textIn.contains(".") == false && button.titleLabel?.text != "." {
            return (textOut: textIn, totalOut: totalIn)
        }
        
        // Otherwise add the characters to both strings
        else {
            var textOut = textIn
            textOut.append(button.titleLabel!.text!)
            var totalOut = totalIn
            totalOut += button.titleLabel!.text!
            return (textOut: textOut, totalOut: totalOut)
        }
        
    }
}
