//
//  RestaurantsListScreen.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/25/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import Foundation

class RestaurantsListScreen: BaseScreen {

    private let republiqueRest = app.tables.staticTexts["Republique"]

    func tapOnRepublique() {
        tap(republiqueRest)
    }

}
