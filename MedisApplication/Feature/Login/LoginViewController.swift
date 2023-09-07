//
//  LoginViewController.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel : LoginViewModel = LoginViewModel()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var seePasswordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.successLogin = { token in
            let alert = UIAlertController(title: "Horee", message: "Login Berhasil, Token : \(token)", preferredStyle:UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Tutup", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        viewModel.showLoading = { isLoading in
            self.showLoading(parent: self, state: isLoading)
        }
        
        viewModel.showErrorAlert = { error in
            self.showAlert(message: error)
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        viewModel.login(email: "eve.holt@reqres.in", password: "cityslicka")
    }
    
    @IBAction func seePasswordButton(_ sender: Any) {
        if seePasswordButton.currentTitle == "Lihat" {
            passwordField.isSecureTextEntry = false
            seePasswordButton.setTitle("Tutup", for: .normal)
        } else {
            passwordField.isSecureTextEntry = true
            seePasswordButton.setTitle("Lihat", for: .normal)
        }
    }
}

