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

        let loginScreen = LoginScreen()
        loginScreen.tapOnLoginLaterButton()

        let restaurantsListScreen = RestaurantsListScreen()
        restaurantsListScreen.tapOnRepublique()

        let restaurantScreen = RestaurantScreen()
        restaurantScreen.tapOnDetectTable()

        let tableSelectionScreen = TableSelectionScreen()
        tableSelectionScreen.enter(tableNumber: 5)
        tableSelectionScreen.tapOnSelectButton()

        let restaurantScreen2 = RestaurantScreen()
        restaurantScreen2.tapOnCallAWaiter()
        restaurantScreen2.tapOnBringAMenu()

        sleep(1)
        XCTAssertTrue(restaurantScreen2.gotItAlertExists, "Got it alert does not exist")
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
