//
//  ReservationTest.swift
//  OrderMEUITests
//
//  Created by Sergei Litovchenko on 10/22/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import XCTest

class ReservationTest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testReservation () {
        app.buttons["loginLaterButton"].tap()
        app.tables.staticTexts["Republique"].tap()
        app.collectionViews.staticTexts["Reservation"].tap()
        app.buttons["Book"].tap()
        app.alerts["We need your phone number"].buttons["OK"].tap()
        
    }
}
