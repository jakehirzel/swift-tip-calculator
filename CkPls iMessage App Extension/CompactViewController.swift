//
//  CompactViewController.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/30/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit
import Messages

class CompactViewController: MSMessagesAppViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var compactCursor: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        compactCursor.blink()
    }
    
    // MARK: Actions
    
    @IBAction func compactViewTapped(_ sender: AnyObject) {
        requestPresentationStyle(.expanded)
    }
    
}
