//
//  HomeViewController.swift
//  Movies
//
//  Created by Rosalie Snijders on 15-12-17.
//  Copyright © 2017 Rosalie Snijders. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    var user = Auth.auth().currentUser!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBAction func logOutAction(_ sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogIn")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateUI(){
        userLabel.text = user.email
    }

}
