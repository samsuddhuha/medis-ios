//
//  ServiceCommon+Ext.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import Foundation
import Moya
import SwiftyJSON

extension Common: TargetType {
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        var data = [String:Any]()
        
        switch self {
        case .login(email: let email, password: let password):
            data["email"] = email
            data["password"] = password
            return .requestParameters(parameters: data, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
