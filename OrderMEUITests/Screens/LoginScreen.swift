//
//  LoginScreen.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/25/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import Foundation

class LoginScreen: BaseScreen {
    
    private let loginLaterButton = app.buttons["loginLaterButton"]

    func tapOnLoginLaterButton() {
        tap(loginLaterButton)
    }
}
