//
//  AboutMeViewController.swift
//  WelcomeLoginApp
//
//  Created by Anton Duplin on 23/1/22.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var aboutMeLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView! {
        didSet{
            myImage.layer.cornerRadius = myImage.frame.height / 2
        }
    }
    
    var aboutMe: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = aboutMe.info.fullInfo
        myImage.image = UIImage(named: aboutMe.info.image)
        
    }

}
