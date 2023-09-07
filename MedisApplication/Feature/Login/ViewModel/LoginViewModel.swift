//
//  LoginViewModel.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import SwiftyJSON

class LoginViewModel: BaseViewModel {
    
    var successLogin: ((String) -> Void)?
    
    func login(email: String, password: String) {
        self.showLoading?(true)
        CommonService.request(Common.login(email: email, password: password), completion: {result in switch result {
            
        case .success(let response):
            let data = JSON.init(response.data)
            self.showLoading?(false)
            print("\(data)")
            do {
                _ = try response.filterSuccessfulStatusCodes()
                self.successLogin?(data["token"].stringValue)
            } catch {
                self.showErrorAlert?("\(data["error"].stringValue)")
            }
        case .failure(let error):
            self.showErrorAlert?(error.localizedDescription)
            self.showLoading?(false)
        }})
    }
}
