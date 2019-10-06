//
//  Network.swift
//  FormationUnitTest
//
//  Created by Ilan Z on 05/10/2019.
//  Copyright © 2019 Ilan Z. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func fetchUsers() -> [User]
    func fetchUser(by id: Int) -> User?
}

class Network: NetworkProtocol {
    func fetchUsers() -> [User] {
        return []
    }

    func fetchUser(by id: Int) -> User? {
        // execute a query in a Database ...

        return nil
    }
}
