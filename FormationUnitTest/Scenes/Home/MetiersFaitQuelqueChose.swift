//
//  MetiersFaitQuelqueChose.swift
//  FormationUnitTest
//
//  Created by Ilan Z on 05/10/2019.
//  Copyright © 2019 Ilan Z. All rights reserved.
//

import Foundation

final class MetiersFaitQuelqueChose {
    // MARK: - Properties

    private let network: NetworkProtocol
    private var users: [User] = []

    init(network: NetworkProtocol) {
        self.network = network
    }

    func getUsers() -> [User] {
        self.users = self.network.fetchUsers()

        //  Règle metiers...

        return users
    }

    func userExist(userId: Int) -> Bool {
        return self.network.fetchUser(by: userId) != nil
    }
}
