//
//  MetiersFaitQuelqueChoseTests.swift
//  FormationUnitTestTests
//
//  Created by Ilan Z on 05/10/2019.
//  Copyright © 2019 Ilan Z. All rights reserved.
//

import XCTest

@testable import FormationUnitTest

class MetiersFaitQuelqueChoseTests: XCTestCase {
    // MARK: - Properties

    func test_givenInitializeMetiers_whenICallGetUsers_thenIReturnAArrayOfUser() {
        // Given


        let metier = MetiersFaitQuelqueChose(network: NetworkTest(), calculator: CalculatorDummy())

        // When

        let users = metier.getUsers()

        // Then

        XCTAssertFalse(users.isEmpty)
    }
}

private class NetworkTest: Network {

    override func fetchUsers() -> [User] {
        return [User(identifier: 1, username: "Ben Arfa")]
    }
}

private class CalculatorDummy: Calculator {

}
