//
//  ExpandedViewController.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/30/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit
import Messages

class ExpandedViewController: MSMessagesAppViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var percentOne: UILabel!
    @IBOutlet weak var percentTwo: UILabel!
    @IBOutlet weak var percentThree: UILabel!
    
    @IBOutlet weak var tipsView: UIView!
    @IBOutlet weak var splitsView: UIView!
    @IBOutlet var tipLines: [UIStackView]!
    
    @IBOutlet weak var splitPercent: UILabel!
    @IBOutlet weak var splitTotal: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitNumber: UILabel!
    @IBOutlet weak var splitPeople: UILabel!
    @IBOutlet weak var eachTotal: UILabel!
    
    @IBOutlet weak var keyOne: UIButton!
    @IBOutlet weak var keyTwo: UIButton!
    @IBOutlet weak var keyThree: UIButton!
    @IBOutlet weak var keyFour: UIButton!
    @IBOutlet weak var keyFive: UIButton!
    @IBOutlet weak var keySix: UIButton!
    @IBOutlet weak var keySeven: UIButton!
    @IBOutlet weak var keyEight: UIButton!
    @IBOutlet weak var keyNine: UIButton!
    @IBOutlet weak var keyZero: UIButton!
    @IBOutlet weak var keyPoint: UIButton!
    @IBOutlet weak var keyDelete: UIButton!
    
    @IBOutlet weak var cursor: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        cursor.blink()
    }

}
