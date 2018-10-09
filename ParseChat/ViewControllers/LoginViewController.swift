//
//  LoginViewController.swift
//  ParseChat
//
//  Created by MacBookPro9 on 10/5/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

  
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBAction func signupBtn(_ sender: Any) {
        registerUser()
        
    }
    
   
    @IBAction func loginBtn(_ sender: Any) {
        loginUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameField.becomeFirstResponder()
        self.passwordField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // ------------------------------------------MEHTODs------------------------------------------------
    
            //all the methods related to th login and signin
    
    //-------------------------------------------METHODS -----------------------------------------------
    
            //user registration
            func registerUser() {
                let newUser = PFUser()
                
                // set user properties
                newUser.username = usernameField.text
                newUser.password = passwordField.text
                
                // call sign up function on the object
                newUser.signUpInBackground { (success: Bool, error: Error?) in
                    
                    if (newUser.username?.isEmpty)!{
                        let OKAction = UIAlertAction(title: "OK", style: .default){(action) in}
                        let alertController = UIAlertController(title: "Username is Required!", message: "Please Choose your Username.", preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                    }
                    else if (newUser.password?.isEmpty)!{
                        let OKAction = UIAlertAction(title: "OK", style: .default){(action) in}
                        let alertController = UIAlertController(title: "Password is Required!", message: "Please Enter a New Password.", preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                    }
                    
                    if let error = error{
                        let errorAlertController = UIAlertController(title: "Sign up Failed!!!", message: "Account Already Exist for this username or Check your internet Connection", preferredStyle: .alert)
                        let cancelAction = UIAlertAction(title: "Retry", style: .cancel)
                        errorAlertController.addAction(cancelAction)
                        self.present(errorAlertController, animated: true)
                        print(error.localizedDescription)
                    }else {
                        let OKAction = UIAlertAction(title: "OK", style: .default){(action) in}
                        let alertController = UIAlertController(title: "Registered Success!", message: "Now Enter your Username and password to Login.", preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                        // manually segue to logged in view
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    }
                }
            }
    
    
    
            func loginUser() {
                
                let username = usernameField.text ?? ""
                let password = passwordField.text ?? ""
                
                PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
                    
                    if username.isEmpty{
                        let OKAction = UIAlertAction(title: "OK", style: .default){(action) in}
                        let alertController = UIAlertController(title: "Username Failed!", message: "Please Enter your Username.", preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                    }
                    else if password.isEmpty{
                        let OKAction = UIAlertAction(title: "OK", style: .default){(action) in}
                        let alertController = UIAlertController(title: "Password Failed!", message: "Please Enter your Password.", preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        // add the OK action to the alert controller
                        alertController.addAction(OKAction)
                    }
                    else{
                        if let error = error{
                            let errorAlertController = UIAlertController(title: "User Log in Failed!", message: "Plese, Verify your username and password or Check your internet Connection", preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "Retry", style: .cancel)
                            errorAlertController.addAction(cancelAction)
                            self.present(errorAlertController, animated: true)
                            print(error.localizedDescription)
                            
                        }else {
                            print("Login Success")
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                            
                        }
                    }
                    
                }
                
            }
    
  
   
    
    
    // -----------------------------------------EndMEHTOD-----------------------------------------------
    
                                //all the methods related to th login and signin
    
    //-----------------------------------------EndMETHOD------------------------------------------------
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
