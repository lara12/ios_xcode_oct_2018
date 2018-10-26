//
//  RestaurantsListScreen.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/25/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import XCTest

class RestaurantsListScreen: BaseScreen {

    let restaurant: XCUIElement

    init(name: String) {
        restaurant = BaseScreen.app.tables.staticTexts[name]
        super.init()
        visible()
    }

    func tapOnRestaurant() -> RestaurantScreen {
        tap(restaurant)
        return RestaurantScreen()
    }
}

// MARK: - Visibility

extension RestaurantsListScreen {
    private func visible() {
        XCTAssertTrue(restaurant.waitForExistence(timeout: timeout), "RestaurantsListScreen is not visible")
    }
}
