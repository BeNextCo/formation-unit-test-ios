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
    /// MARK: - Properties

    private var network: NetworkProtocolMock!
    private var sut: MetiersFaitQuelqueChose!

    override func setUp() {
        super.setUp()

        self.network = NetworkProtocolMock()

        self.sut = MetiersFaitQuelqueChose(network: self.network)
    }

    override func tearDown() {
        super.tearDown()

        self.network = nil
        self.sut = nil
    }

    func test_givenIFetchUser_whenICallUserExist_thenUserExist() {
        // GIVEN

        self.network.fetchUserByReturnValue = User(identifier: 1, username: "Pepito")

        // WHEN

        let userExist = sut.userExist(userId: 1)

        // THEN

        XCTAssertTrue(userExist)
        XCTAssertEqual(1, self.network.fetchUserByCallsCount)
        XCTAssertEqual(1, self.network.fetchUserByReceivedId)
        XCTAssertFalse(self.network.fetchUsersCalled)
    }
}

private class NetworkProtocolMock: NetworkProtocol {

    //MARK: - fetchUsers

    var fetchUsersCallsCount = 0
    var fetchUsersCalled: Bool {
        return fetchUsersCallsCount > 0
    }

    var fetchUsersReturnValue: [User]!

    func fetchUsers() -> [User] {
        return fetchUsersReturnValue
    }

    //MARK: - fetchUser

    var fetchUserByCallsCount = 0
    var fetchUserByCalled: Bool {
        return fetchUserByCallsCount > 0
    }

    var fetchUserByReceivedId: Int?

    var fetchUserByReturnValue: User?

    func fetchUser(by id: Int) -> User? {
        fetchUserByCallsCount += 1
        fetchUserByReceivedId = id

        return fetchUserByReturnValue
    }
}
