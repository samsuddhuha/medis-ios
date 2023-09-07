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
            self.showAlert("Horee", message: "Login Berhasil, Token : \(token)")
        }
        
        viewModel.showLoading = { isLoading in
            self.showLoading(parent: self, state: isLoading)
        }
        
        viewModel.showErrorAlert = { error in
            self.showAlert(message: error)
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if emailField.text == "" {
            self.showAlert("Mohon maaf!", message: "Masukkan email terlebih dahulu")
        } else if passwordField.text == "" {
            self.showAlert("Mohon maaf!", message: "Masukkan passwrod terlebih dahulu")
        } else {
            viewModel.login(email: emailField.text ?? "", password: passwordField.text ?? "")
        }
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

