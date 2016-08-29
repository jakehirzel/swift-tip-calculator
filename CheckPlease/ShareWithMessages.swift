//
//  ShareWithMessages.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/25/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit
import MessageUI

class ShareWithMessages {
    
    // MARK: Properties
    var messageComposeDelegate = self
    var
    
    let composeVC = MFMessageComposeViewController()
    composeVC.messageComposeDelegate = self
    
    // Configure the fields of the interface.
    composeVC.recipients = ["4085551212"]
    composeVC.body = "Hello from California!"
    
    // Present the view controller modally.
    self.presentViewController(composeVC, animated: true, completion: nil)
}
