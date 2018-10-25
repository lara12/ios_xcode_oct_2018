//
//  RestaurantScreen.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/25/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import Foundation

class RestaurantScreen: BaseScreen {
    
    private let detectTable = app.collectionViews.staticTexts["Detect table"]
    private let callWaiter = app.collectionViews.staticTexts["Call a waiter"]
    private let bringAMenu = app.alerts["The waiter is on his way"].buttons["Bring a menu"]
    private let gotItAlert = app.alerts["Got it!"]

    var gotItAlertExists: Bool {
        return gotItAlert.exists
    }

    func tapOnDetectTable() {
        detectTable.tap()
    }

    func tapOnCallAWaiter() {
        callWaiter.tap()
    }

    func tapOnBringAMenu() {
        bringAMenu.tap()
    }
}
