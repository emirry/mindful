//
//  WelcomeViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/14/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Welcome to mindfull!"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Thasadith-Regular", size: 20)!]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 246/225.0, green: 141/225.0, blue: 95/225.0, alpha: 1)
        self.navigationItem.setHidesBackButton(true, animated: true)

    }

}
