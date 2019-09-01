//
//  CalculatorTests.swift
//  FormationUnitTestTests
//
//  Created by Ilan Z on 01/09/2019.
//  Copyright © 2019 Ilan Z. All rights reserved.
//

import XCTest

@testable import FormationUnitTest

class CalculatorTests: XCTestCase {

    func test_sum() {
        XCTAssertEqual(4, Calculator().sum(a: 2, b: 2))
    }
}
