//
//  BaseViewModel.swift
//  MedisApplication
//
//  Created by Samsud Dhuha on 06/09/23.
//

import Foundation

class BaseViewModel: NSObject {
    var showLoading: ((Bool) -> Void)?
    var showErrorAlert: ((String) -> Void)?
}
