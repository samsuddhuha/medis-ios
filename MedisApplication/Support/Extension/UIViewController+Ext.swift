//
//  UIViewController+Ext.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import UIKit


extension UIViewController: UIGestureRecognizerDelegate {
    func showNavigationBar() {
        self.tabBarController?.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.backgroundColor = .white
        navigationItem.backButtonTitle = ""
    }
    
    func hideNavigationBar() {
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        navigationItem.backButtonTitle = ""
    }
    
    func showLoading(parent: UIViewController, state: Bool){
        let popupViewController = LoadingViewController(nibName: "LoadingViewController", bundle: nil)
        if state {
            popupViewController.modalPresentationStyle = .custom
            parent.present(popupViewController, animated: false)
        } else {
            parent.dismiss(animated: false, completion: nil)
        }
    }
    
    func showAlert(_ title: String = "Oops! Something went wrong.", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
