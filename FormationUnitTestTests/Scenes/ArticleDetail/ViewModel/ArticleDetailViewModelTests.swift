//
//  ArticleDetailViewModel.swift
//  FormationUnitTestTests
//
//  Created by Ilan Z on 14/11/2019.
//  Copyright © 2019 Ilan Z. All rights reserved.
//

import XCTest

@testable import FormationUnitTest

class ArticleDetailViewModelTests: XCTestCase {

    // MARK: - Properties

    private var sut: ArticleDetailViewModel!
    private var articleDetailRepository: ArticleDetailRepositoryStub!

    override func setUp() {
        super.setUp()

        self.articleDetailRepository = ArticleDetailRepositoryStub()
        self.sut = ArticleDetailViewModel(articleDetailRepository: self.articleDetailRepository)
    }

    override func tearDown() {
        self.articleDetailRepository = nil
        self.sut = nil

        super.tearDown()
    }

    func test_givenArticleDetailRepositoryReturnErreur1_whenRetrieveArticleDetail_thenArticleDetailReturnError1Message() {
        // Given
        self.articleDetailRepository.error = .erreur1
        let expectation = XCTestExpectation(description: "ArticleDetailRepositoryStub expectation")

        // When

        sut.retrieveArticleDetail(success: { _ in
            expectation.fulfill()
        }, failure: { error in
            XCTAssert(error == .error1)
            expectation.fulfill()
        })

        // Then

        wait(for: [expectation], timeout: 0.1)
    }

    func test_givenArticleDetailRepositoryReturnErreur2_whenRetrieveArticleDetail_thenArticleDetailReturnError2Message() {
        // Given
        self.articleDetailRepository.error = .erreur2
        let expectation = XCTestExpectation(description: "ArticleDetailRepositoryStub expectation")

        // When

        sut.retrieveArticleDetail(success: { _ in
            expectation.fulfill()
        }, failure: { error in
            XCTAssert(error == .error2)
            expectation.fulfill()
        })

        // Then

        wait(for: [expectation], timeout: 0.1)
    }

}

enum ArticleDetailViewModelError: Error {
    case error1
    case error2
}

class ArticleDetailViewModel {
    // MARK: - Properties

    private let articleDetailRepository: ArticleDetailRepositoryProtocol

    // MARK: - Init

    init(articleDetailRepository: ArticleDetailRepositoryProtocol) {
        self.articleDetailRepository = articleDetailRepository
    }

    func retrieveArticleDetail(success: @escaping (ArticleProtocol) -> Void,
                               failure: @escaping (ArticleDetailViewModelError) -> Void) {
        self.articleDetailRepository.retrieveArticle(success: { _ in
            //@TODO
        }, failure: { error in
            switch error {
            case .erreur1:
                failure(.error1)
            case .erreur2:
                failure(.error2)
            default:
                break
            }
        })

    }
}

// MARK: - ArticleDetailRepositoryProtocol

private class ArticleDetailRepositoryStub: ArticleDetailRepositoryProtocol {
    var error: ArticleDetailRepositoryError!

    func retrieveArticle(success: @escaping ArticleDetailRepositoryStub.retrieveArticleSuccess,
                         failure: @escaping ArticleDetailRepositoryStub.retrieveArticleError) {
        failure(error)
    }


}
