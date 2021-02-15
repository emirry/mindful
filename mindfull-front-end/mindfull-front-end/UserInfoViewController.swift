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
    
    var textFields = [UITextField]()
    
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
        textFields.append(nameTextField)
        
        maleOrFemaleTextField.delegate = self
        textFields.append(maleOrFemaleTextField)

        weightTextField.delegate = self
        textFields.append(weightTextField)

        heightTextField.delegate = self
        textFields.append(heightTextField)

        ageTextField.delegate = self
        textFields.append(ageTextField)

        activityTextField.delegate = self
        textFields.append(activityTextField)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 246/225.0, green: 141/225.0, blue: 95/225.0, alpha: 1)
        self.navigationController?.toolbar.barTintColor = UIColor(red: 246/225.0, green: 141/225.0, blue: 95/225.0, alpha: 1)
        setupView()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
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
        
        let userToSave = UserDetail(user_name: user_name, male_or_female: maleOrFemale, weight: weight, height: height, age: age, activity_level: activityLevel)
                
        print("USER", userToSave)
        
        let userPostRequest = ApiRestActions()
        userPostRequest.saveToUserDB(userToSave) {
            
            DispatchQueue.main.sync {
                //manually pushes to next vc
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loadToPage = storyboard.instantiateViewController(identifier: "renderRec") as! RecCalViewController
                
                loadToPage.bmr = userPostRequest.rec_bmr
                loadToPage.calories = userPostRequest.rec_calories
                loadToPage.calToLose = userPostRequest.rec_cal_lose
                
                self.navigationController?.pushViewController(loadToPage, animated: true)
            }
        
        }


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
            return(text.count <= 1, "Please type in M or F")
        }
   
        return(text.count > 0, "This field cannot be empty.")
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//        }
    
    
   @objc fileprivate func textDidChange(_ notification: Notification) {
        var formIsValid = true

        for textField in textFields {
            //Validate text field
            let (valid, _) = validate(textField)

            guard valid else {
                formIsValid = false
                break
            }
        }
        submitButton.isEnabled = formIsValid
    }

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
