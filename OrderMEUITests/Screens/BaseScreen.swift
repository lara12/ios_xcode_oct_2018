//
//  BaseScreen.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/25/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import XCTest

class BaseScreen {
    static let app = XCUIApplication()

    func tap(_ element: XCUIElement) {
        element.tap()
    }

    func type(_ text: String, in element: XCUIElement) {
        element.tap()
        element.typeText(text)
    }
}
