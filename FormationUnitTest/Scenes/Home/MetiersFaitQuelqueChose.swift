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

    private let network: Network
    private let calculator: Calculator

    init(network: Network, calculator: Calculator) {
        self.network = network
        self.calculator = calculator
    }

    func getUsers() -> [User] {
        let users = self.network.fetchUsers()

        //  Règle metiers...

        return users
    }
}
