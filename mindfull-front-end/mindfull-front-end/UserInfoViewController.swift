//
//  UserInfoViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/11/21.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var maleOrFemaleTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var maleOrFemaleValidation: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet var textFields: [UITextField]!
    
    //variables to store user info
    var user_name = ""
    var maleOrFemale = ""
    var weight = 0
    var height = 0
    var age = 0
    var activityLevel = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        maleOrFemaleTextField.delegate = self
        weightTextField.delegate = self
        heightTextField.delegate = self
        ageTextField.delegate = self
        activityTextField.delegate = self
            
        setupView()

        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //Submit button and post request to API
    @IBAction func submitPressed(_ sender: UIButton) {
        // call api?
        
        user_name = nameTextField.text ?? ""
        maleOrFemale = "\(maleOrFemaleTextField.text ?? "Please enter M or F")"
        weight = Int(weightTextField.text ?? "") ?? 0
        height = Int(heightTextField.text ?? "") ?? 0
        age = Int(ageTextField.text ?? "") ?? 0
        activityLevel = Int(activityTextField.text ?? "") ?? 0
        print("NAME", user_name)
        print("WEIGHT", weight)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        activityTextField.resignFirstResponder()
    }
  
    
    fileprivate func setupView() {
        //configure subtmit button
//        submitButton.isEnabled = false
        
        //Configure male or female validation label
        maleOrFemaleValidation.isHidden = true
    }
    
    //Validating that first text field is M or F
    fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return(false, nil)
        }
        
        if textField == maleOrFemaleTextField {
            return(text.count <= 2, "Please type in M or F")
        }
   
        return(text.count > 0, "This field cannot be empty.")
    }
    
    
//   @objc fileprivate func textDidChange(_ notification: Notification) {
//        var formIsValid = true
//
//        for textField in textFields {
//            //Validate text field
//            let (valid, _) = validate(textField)
//
//            guard valid else {
//                formIsValid = false
//                break
//            }
//        }
//        submitButton.isEnabled = formIsValid
//    }

}

extension UserInfoViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        
        switch textField {
        case nameTextField:
            maleOrFemaleTextField.becomeFirstResponder()
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
