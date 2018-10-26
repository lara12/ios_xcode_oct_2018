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
    let republique = "Republique"

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testBringAMenu() {

        let loginScreen = LoginScreen()
        loginScreen.tapOnLoginLaterButton()

        let restaurantsListScreen = RestaurantsListScreen(name: republique)
        let restaurantScreen = restaurantsListScreen.tapOnRestaurant()

        let tableSelectionScreen = restaurantScreen.tapOnDetectTable()
        let restaurantScreen2 = tableSelectionScreen.enter(tableNumber: 5)
            .tapOnSelectButton()
        restaurantScreen2.tapOnCallAWaiter()
            .tapOnBringAMenu()

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
