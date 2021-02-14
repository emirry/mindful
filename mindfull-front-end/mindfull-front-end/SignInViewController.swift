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
        
        GIDSignIn.sharedInstance()?.delegate = self
          // Automatically sign in the user.
//          GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
    }
    
    @IBAction func login(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(user.userID!)
        }


    }
    

    //Sign out
//    @objc func signOutButtonTapped(_ sender: UIButton) {
//        GIDSignIn.sharedInstance()?.signOut()
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {


        }
    
}
