//
//  RecCalViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/13/21.
//

import UIKit

class RecCalViewController: UIViewController {

    
    @IBOutlet weak var bmrLabel: UILabel!
    @IBOutlet weak var maintainLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    //    var rec = ApiRestActions().bmrResponse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bmrLabel.text = "\(ApiRestActions().rec_bmr)"
        self.maintainLabel.text = "\(ApiRestActions().rec_calories)"
        self.loseLabel.text = "\(ApiRestActions().rec_cal_lose)"


    }
    
    @IBAction func reloadLabels(_ sender: UIBarButtonItem) {
    }


}

