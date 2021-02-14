//
//  RecCalViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/13/21.
//

import UIKit

class RecCalViewController: UIViewController {

    var bmr = 0
    var calories = 0
    var calToLose = 0
    
    @IBOutlet weak var bmrLabel: UILabel!
    @IBOutlet weak var maintainLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    //    var rec = ApiRestActions().bmrResponse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bmrLabel.text = "\(bmr)"
        self.maintainLabel.text = "\(calories)"
        self.loseLabel.text = "\(calToLose)"


    }
    
    @IBAction func reloadLabels(_ sender: UIBarButtonItem) {

    
    }


}

