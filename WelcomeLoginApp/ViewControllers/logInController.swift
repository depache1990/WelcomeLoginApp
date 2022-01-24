//
//  ViewController.swift
//  lesson2.3logIn
//
//  Created by Anton Duplin on 16/1/22.
//

import UIKit

class logInController: UIViewController {
    
    @IBOutlet weak var logInTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let userName = "Anton"
    let password = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    private let info = UserInfo.getUserInfo()
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewController = tabBarController.viewControllers else { return }
        viewController.forEach {
            if let loginVC = $0 as? mainProfileController {
                loginVC.userInfo = info
            } else if let navigationVC = $0 as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                aboutUserVC.aboutMe = info
            }
        }
    }
    
    @IBAction func forgotLogIn(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "ouups", message: "Your User name is \(info.userName)")
        } else {
            showAlert(title: "ouups", message: "your Password is \(info.password)")
        }
    }
    
    
    
    
    @IBAction func logInAction() {
        if logInTF.text != info.userName || passwordTF.text != info.password {
            showAlert(title: "Wrong User name or Password", message: "Please check your User name and password")
            passwordTF.text = ""
        }
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        logInTF.text = ""
        passwordTF.text = ""
    }
    
}

extension logInController {
    private func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
}

