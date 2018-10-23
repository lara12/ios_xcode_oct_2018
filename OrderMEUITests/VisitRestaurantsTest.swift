//
//  VisitRestaurantsTest.swift
//  OrderMEUITests
//
//  Created by Shanoj on 23/10/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import XCTest

class VisitRestaurantsTest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testVisitTwoRestaurants() {
        
        let loginLaterButton = app.buttons["loginLaterButton"]
        let detectTable = app.collectionViews.cells["Detect table"]
        let tableNumberField = app.textFields["tableNumberTextField"]
        let backButton = app.buttons["Back 50"]
        let searchField = app.textFields["SearchField"]
        
        tapOn(element: loginLaterButton)
        sleep(4)
        selectRestaurant(restaurantName: "Beauty & Essex")
        tapOn(element: backButton)
        
        sleep(1)
        //Asserting search field to verify that user is on restaurant list screen,on tapping back button
        XCTAssert(searchField.exists, "Not on restaurant list screen")
        
        selectRestaurant(restaurantName: "Hakkasan")
        tapOn(element: detectTable)
        tapOn(element: tableNumberField)
        typeValueInto(element: tableNumberField, value: "5")
        
    }

    func selectRestaurant(restaurantName: String) {
        
        app.tables.staticTexts[restaurantName].tap()
    }
    
    func tapOn(element: XCUIElement) {
        
        element.tap()
    }
    
    func typeValueInto(element: XCUIElement, value: String) {
        
        element.typeText(value)
    }
    
}
