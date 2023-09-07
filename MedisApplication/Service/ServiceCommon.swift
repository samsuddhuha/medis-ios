//
//  ServiceCommon.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import Foundation
import Moya
import SwiftyJSON

enum Common: Equatable {
    case login(email: String, password: String)
}

let commonClosure = { (target: Common) -> Endpoint in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    
    switch target {
    case .login:
        return defaultEndpoint
    }
}

let CommonService = MoyaProvider<Common>(endpointClosure: commonClosure)
