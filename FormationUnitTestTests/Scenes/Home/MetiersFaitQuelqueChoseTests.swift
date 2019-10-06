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
    var fetchUsersCalledOnly: Bool {
        return objectDidNotCallAnyMethod(self, except: "fetchUsers")
    }
    var fetchUsersCalledOnlyAndOnce: Bool {
        return fetchUsersCalledOnly && fetchUsersCallsCount == 1
    }


    var fetchUsersReturnValue: [User]!

    var fetchUsersClosure: (() -> [User])?

    func fetchUsers() -> [User] {
        fetchUsersCallsCount += 1
        return fetchUsersClosure.map({ $0() }) ?? fetchUsersReturnValue
    }

    //MARK: - fetchUser

    var fetchUserByCallsCount = 0
    var fetchUserByCalled: Bool {
        return fetchUserByCallsCount > 0
    }
    var fetchUserByCalledOnly: Bool {
        return objectDidNotCallAnyMethod(self, except: "fetchUserBy")
    }
    var fetchUserByCalledOnlyAndOnce: Bool {
        return fetchUserByCalledOnly && fetchUserByCallsCount == 1
    }

    var fetchUserByReceivedId: Int?
    var fetchUserByReceivedInvocations: [Int] = []

    var fetchUserByReturnValue: User?

    var fetchUserByClosure: ((Int) -> User?)?

    func fetchUser(by id: Int) -> User? {
        fetchUserByCallsCount += 1
        fetchUserByReceivedId = id
        fetchUserByReceivedInvocations.append(id)
        return fetchUserByClosure.map({ $0(id) }) ?? fetchUserByReturnValue
    }


    // MARK: - noMethodCalled

    var noMethodCalled: Bool {
        return objectDidNotCallAnyMethod(self)
    }

    private func objectDidNotCallAnyMethod(_ object: Any, except methodName: String) -> Bool {
        let mirror = Mirror(reflecting: object)

        for case let (label?, value) in mirror.children where label.hasSuffix("CallsCount") {
            let methodCallsCountName = methodName + "CallsCount"
            if let count = value as? Int,
                (label == methodCallsCountName && count == 0)
                    || (label != methodCallsCountName && count > 0) {
                return false

            }
        }

        return true
    }

    private func objectDidNotCallAnyMethod(_ object: Any) -> Bool {
        let mirror = Mirror(reflecting: object)

        for case let (label?, value) in mirror.children where label.hasSuffix("CallsCount") {
            if let count = value as? Int, count > 0 {
                return false
            }
        }
        return true
    }
}
