//
//  TableSelectionScreen.swift
//  OrderMEUITests
//
//  Created by Borys Gurtovyi on 10/25/18.
//  Copyright © 2018 Boris Gurtovoy. All rights reserved.
//

import Foundation

class TableSelectionScreen: BaseScreen {

    private let numberTextField =  app.textFields["tableNumberTextField"]
    private let selectButton = app.buttons["Select table"]

    func enter(tableNumber: Int) {
        type(tableNumber.description, in: numberTextField)
    }

    func tapOnSelectButton() {
        tap(selectButton)
    }
}
