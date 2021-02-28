//
//  LoginViewController.swift
//  Twitter
//
//  Created by lxy on 2/28/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        if (UserDefaults.standard.bool(forKey: "userLoggedIn")==true){
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }      //later on when the button clicked again ,it check the value 1st, them go to homescreen w/out login
    @IBAction func onLoginButton(_ sender: Any) {
        let url="https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: url, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            // use default value to stay logged in  forKey=> what is the methods name
            // when user 1st logged in create a variable in mem, set it to true
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login")
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
