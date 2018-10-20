//
//  TabbarAccessRestriction.swift
//  OrderMEUITests
//
//  Created by Olga on 10/20/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import XCTest

class TabbarTests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testTabbarAccessRestriction() {
        
        let loginLaterButton = app.buttons["loginLaterButton"]
        loginLaterButton.tap()
        
        app.tabBars.buttons["My reservations"].tap()
        
        app.alerts["You did not login"].buttons["Login"].tap()
    }

}
