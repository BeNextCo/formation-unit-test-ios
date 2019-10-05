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

    private var network: Network

    init() {
        self.network = Network()
    }

    func getUsers() -> [User] {
        let users = self.network.fetchUsers()

        //  Règle metiers...

        return users
    }
}
