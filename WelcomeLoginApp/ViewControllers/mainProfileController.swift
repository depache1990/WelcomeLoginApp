//
//  mainProfileController.swift
//  WelcomeLoginApp
//
//  Created by Anton Duplin on 16/1/22.
//

import UIKit

class mainProfileController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var userInfo: UserInfo!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = "Welcome, \(userInfo.info.fullName)!☺️"
 
    }
}
