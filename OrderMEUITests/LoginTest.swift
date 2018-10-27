//
//  LoginTest.swift
//  OrderMEUITests
//
//  Created by Larissa Bruter on 10/26/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import XCTest

class LoginTest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testLogin() {
        let loginLaterButto = app.buttons["loginLaterButton"]
        loginLaterButto.tap()
        app.tables.staticTexts["Republique"].tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.cells["Detect table"].tap()
        
        let tablenumbertextfieldTextFi = app/*@START_MENU_TOKEN@*/.textFields["Table #"]/*[[".textFields[\"Table #\"]",".textFields[\"tableNumberTextField\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        tablenumbertextfieldTextFi.tap()
        tablenumbertextfieldTextFi.typeText("5")
        app.buttons["Select table"].tap()
        
        collectionViewsQuery.staticTexts["Call a waiter"].tap()
        app.alerts["The waiter is on his way"].buttons["Bring a menu"].tap()
        sleep(1)
        app.alerts["Got it!"].buttons["OK"].tap()
    
    }
    
}
