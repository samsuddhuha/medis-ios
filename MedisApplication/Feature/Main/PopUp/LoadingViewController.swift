//
//  LoadingViewController.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import Foundation
import Lottie

class LoadingViewController: UIViewController{
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = UIColor.black?.withAlphaComponent(0.50)
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.play()
    }
}
