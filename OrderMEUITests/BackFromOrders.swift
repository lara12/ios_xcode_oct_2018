//
<<<<<<< Updated upstream
//  BackFromOrders.swift
//  OrderMeUITests
//
//  Created by Liudmyla Lerman on 10/20/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.

=======
//  OrderMEUITests.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/15/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//
>>>>>>> Stashed changes

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
    
    app.tables/*@START_MENU_TOKEN@*/.staticTexts["Hakkasan"]/*[[".cells.staticTexts[\"Hakkasan\"]",".staticTexts[\"Hakkasan\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    app.collectionViews.cells["Menu"].otherElements.containing(.image, identifier:"list").element.tap()
        
    app.collectionViews/*@START_MENU_TOKEN@*/.cells.staticTexts["Rolls"]/*[[".cells.staticTexts[\"Rolls\"]",".staticTexts[\"Rolls\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
    
    let back50Button = app.buttons["Back 50"]
    back50Button.tap()
    back50Button.tap()
    back50Button.tap()
      
        _ = app.tables.staticTexts["Home"]
        
    addUIInterruptionMonitor(withDescription: "Home") { (text) -> Bool in
            self.app.tables.staticTexts["Home"].tap()
            return true
    }
        
  }

}
