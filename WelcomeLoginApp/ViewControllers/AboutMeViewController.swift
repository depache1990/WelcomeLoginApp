//
//  AboutMeViewController.swift
//  lesson2.4logIn
//
//  Created by Anton Duplin on 23/1/22.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var aboutMeLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    var aboutMe: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = aboutMe.info.fullInfo
        myImage.image = UIImage(named: aboutMe.info.image)
        

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
