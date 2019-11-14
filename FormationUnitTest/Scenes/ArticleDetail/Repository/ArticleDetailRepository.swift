//
//  ArticleDetailRepository.swift
//  FormationUnitTest
//
//  Created by Ilan Z on 14/11/2019.
//  Copyright © 2019 Ilan Z. All rights reserved.
//

import Foundation

protocol ArticleProtocol {
    var id: String? { get }
    var title: String? { get }
}

enum ArticleDetailRepositoryError: Error {
    case erreur1
    case erreur2
    case networkErreur
    case unknown
}

protocol ArticleDetailRepositoryProtocol {
    typealias retrieveArticleSuccess = (ArticleProtocol) -> Void
    typealias retrieveArticleError = (ArticleDetailRepositoryError) -> Void

    func retrieveArticle(success: @escaping retrieveArticleSuccess, failure: @escaping retrieveArticleError)
}

class ArticleDetailRepository {

}

// MARK: - ArticleDetailRepositoryProtocol
extension ArticleDetailRepository: ArticleDetailRepositoryProtocol {
    func retrieveArticle(success: @escaping retrieveArticleSuccess, failure: @escaping retrieveArticleError) {

    }
}
