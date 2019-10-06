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

        let stub = StubNetwork()
        stub.forcedUsers = [User(identifier: 1, username: "Ben Arfa")]

        let sut = MetiersFaitQuelqueChose(network: stub)

        // When

        let users = sut.getUsers()

        // Then

        XCTAssertFalse(users.isEmpty)
    }
}

private class StubNetwork: NetworkProtocol {
    var forcedUsers: [User]!

    func fetchUsers() -> [User] {
        return forcedUsers
    }
}
