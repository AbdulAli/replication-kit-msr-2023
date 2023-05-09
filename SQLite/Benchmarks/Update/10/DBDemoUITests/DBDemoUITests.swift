//
//  DBDemoUITests.swift
//  DBDemoUITests
//
//  Created by Abdul Ali Bangash on 2021-09-11.
//  Copyright © 2021 Bilal Hassan. All rights reserved.
//

import XCTest

class DBDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        NSLog("Teared Down.");
    }

    func testExample() throws {
        // UI tests must launch the application that they test.

        let app = XCUIApplication()
        app.launch()

        var flag = true
        while(flag){
          flag = !app.wait(for: XCUIApplication.State.runningBackground, timeout: 1)
          if(flag){
              flag = !app.wait(for: XCUIApplication.State.runningBackgroundSuspended, timeout: 1)
          }
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
