
//  BackFromOrders.swift
//  OrderMeUITests

//  Created by Liudmyla Lerman on 10/20/18.

//  OrderMEUITests.swift
//  OrderMEUITests

//  Created by Borys Gurtovyi on 10/15/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.

import XCTest

class BackFromOrders: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testBackFromOrders() {
        
    let loginLaterButton = app.buttons["loginLaterButton"]
    loginLaterButton.tap()
    
    app.tables.staticTexts["Hakkasan"].tap()
        
    app.collectionViews.cells["Menu"].otherElements.containing(.image, identifier:"list").element.tap()
        
    app.collectionViews.cells.staticTexts["Rolls"].tap()
   
    let backButton = app.buttons["Back 50"]
    backButton.tap()
    backButton.tap()
    backButton.tap()
      
    }
    
}    
