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
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 246/225.0, green: 141/225.0, blue: 95/225.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Thasadith-Regular", size: 20)!]
//        self.navigationItem.backBarButtonItem?.tintColor = .black
        
        self.bmrLabel.text = "\(bmr)"
        self.maintainLabel.text = "\(calories)"
        self.loseLabel.text = "\(calToLose)"


    }
    @IBAction func startClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loadToPage = storyboard.instantiateViewController(identifier: "journal") as! JournalViewController
        
        loadToPage.totalCal = self.bmr

        
        self.navigationController?.pushViewController(loadToPage, animated: true)
    }

}

