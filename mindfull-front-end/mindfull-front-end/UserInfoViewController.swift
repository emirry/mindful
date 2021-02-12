//
//  UserInfoViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/11/21.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var maleOrFemaleTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var maleOrFemaleValidation: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        maleOrFemaleValidation.isHidden = true
    }
    
    @IBAction func submitPressed(_ sender: Any, forEvent event: UIEvent) {
    }
    
    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return(false, nil)
        }
        if textField == maleOrFemaleTextField {
            if text != "M" || text != "F" {
                return(text.count <= 2, "Please only type in M or F")
            }
        }
        return(text.count > 0, "This field cannot be empty.")
    }
    
}

extension UserInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case maleOrFemaleTextField:
            let(valid, message) = validate(textField)
            
            if valid {
                weightTextField.becomeFirstResponder()
            }
            self.maleOrFemaleValidation.text = message
            
            UIView.animate(withDuration: 0.25, animations: {
                self.maleOrFemaleValidation.isHidden = valid
            })
        case weightTextField:
            heightTextField.becomeFirstResponder()
        case heightTextField:
            ageTextField.becomeFirstResponder()
        default:
            activityTextField.becomeFirstResponder()
        }
        return true

    }
}
