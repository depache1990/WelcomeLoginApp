//
//  ViewController.swift
//  WelcomeLoginApp
//
//  Created by Anton Duplin on 16/1/22.
//

import UIKit

class logInController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: - Private properties
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
    // MARK: IBActions
    @IBAction func forgotLogIn(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "ouups", message: "Your User name is \(info.userName)")
        } else {
            showAlert(title: "ouups", message: "your Password is \(info.password)")
        }
    }
    
    @IBAction func logInAction() {
        if userNameTextField.text != info.userName || passwordTextField.text != info.password {
            showAlert(
                title: "Wrong User name or Password",
                message: "Please check your User name and password",
                textField: passwordTextField
            )
            return
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: - Alert Controller

extension logInController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Alert Controller
extension logInController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInAction()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}

