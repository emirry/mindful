//
//  SignInViewController.swift
//  mindfull-front-end
//
//  Created by Emily Nagai on 2/11/21.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInDelegate {


    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = 20
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
          // Automatically sign in the user.
          GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
    }

    
    @IBAction func login(_ sender: UIButton) {
//        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        
  
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toWelcomePage = storyboard.instantiateViewController(identifier: "welcome") as! WelcomeViewController
    

        self.navigationController?.pushViewController(toWelcomePage, animated: true)
    
    }
    
    //Sign out
    @objc func signOutButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(user.userID!)
        }


    }

    
}

