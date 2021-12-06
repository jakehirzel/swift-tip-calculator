//
//  KeypadBehavior.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/30/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class KeypadBehavior {
    
    // A function for number key taps
    
    func keypadButtonTapped(_ button: UIButton, totalIn: String) -> String {
        
        // Limit to 8 characters (thousands + change)
        if totalIn.count >= 8 {
            return totalIn
        }
        
        // Otherwise append the button text, remove leading zero (if it exists), and move the decimal one place to the right
        else {
            
            // Assign and append
            var totalOut = totalIn
            totalOut += button.titleLabel!.text!
            
            // Check for leading zero
            let firstCharacter = totalOut[totalOut.startIndex]
            if firstCharacter == "0" {
                totalOut.removeFirst()
            }
            
            // Move decimal
            let decimalOldIndex = totalOut.index(totalOut.endIndex, offsetBy: -4 )
            let decimalNewIndex = totalOut.index(totalOut.endIndex, offsetBy: -3 )
            let thirdToLastCharacter = totalOut[decimalOldIndex]
            if thirdToLastCharacter == "." {
                totalOut.remove(at: decimalOldIndex)
                totalOut.insert(".", at: decimalNewIndex)
            }
            
            return totalOut
            
        }
        
    }
    
    // A function for delete key taps
    
    func deleteButtonTapped(_ button: UIButton, totalIn: String) -> String {
                
        // If it's $0.00, do nothing
        if totalIn == "0.00" {
            return totalIn
        }
        
        else {
            
            // Assign and remove last character
            var totalOut = totalIn
            totalOut.remove(at: totalOut.index(before: totalOut.endIndex))
            
            // Add leading zeros if needed
            while totalOut.count < 4 {
                totalOut.insert("0", at: totalOut.startIndex)
            }
            
            // Move the decimal
            let decimalOldIndex = totalOut.index(totalOut.endIndex, offsetBy: -2 )
            let decimalNewIndex = totalOut.index(totalOut.endIndex, offsetBy: -3 )
            let secondToLastCharacter = totalOut[decimalOldIndex]
            if secondToLastCharacter == "." {
                totalOut.remove(at: decimalOldIndex)
                totalOut.insert(".", at: decimalNewIndex)
            }
            
            return totalOut
            
        }

        
        
        
    }
}
