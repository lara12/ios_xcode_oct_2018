//
//  OrderMEUITests.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/15/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import XCTest

class WaiterTests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testBringAMenu() {

        let loginLaterButton = app.buttons["loginLaterButton"]
        loginLaterButton.tap()

        app.tables.staticTexts["Republique"].tap()

        app.collectionViews.staticTexts["Detect table"].tap()

        app.textFields["tableNumberTextField"].tap()
        app.textFields["tableNumberTextField"].typeText("5")
        app.buttons["Select table"].tap()

        app.collectionViews.staticTexts["Call a waiter"].tap()

        app.alerts["The waiter is on his way"].buttons["Bring a menu"].tap()
        sleep(1)
        app.alerts["Got it!"].buttons["OK"].tap()
    }
    
    func testCallHookahMan() {
        
        let loginLaterButton = app.buttons["loginLaterButton"]
        loginLaterButton.tap()
        
        let restaurant = app.tables.staticTexts["Hakkasan"]
        restaurant.tap()
        
        let callWaiterBtn = app.collectionViews.staticTexts["Call a waiter"]
        callWaiterBtn.tap()
        
        let pickTableAlertOkBtn = app.alerts["Pick the table, please"].buttons["Ok"]
        pickTableAlertOkBtn.tap()
        
        let hakkasanBackBtn = app.buttons["Hakkasan"]
        hakkasanBackBtn.tap()
        
        let backBtn = app.buttons["Back 50"]
        backBtn.tap()
    }

}
