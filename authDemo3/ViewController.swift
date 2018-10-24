//
//  ViewController.swift
//  authDemo3
//
//  Created by Guerra Jose on 24/10/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import FirebaseUI
//import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginTapped(_ sender: UIButton) {
        
        //creando  el auth Ui objeto por defecto
        let  authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            //log error
            return
        }
        //set  ourselves as the delegate
        authUI?.delegate = self
        
        
        //get reference to the auth Ui View  Controller
        let authViewController=authUI!.authViewController()
        
        //show it
        present(authViewController, animated: true, completion: nil)
        
    }
}


extension ViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        //chek  if there was an error
        guard error == nil else{
            return
        }
        if error != nil{
            //log error
            return
        }
        //authDataResult?.user.uid
        performSegue(withIdentifier: "goHome", sender: self)
    }
}
