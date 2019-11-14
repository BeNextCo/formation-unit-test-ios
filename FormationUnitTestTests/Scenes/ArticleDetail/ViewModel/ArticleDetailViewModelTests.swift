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

    override func setUp() {

    }

    override func tearDown() {

    }

    func test_givenArticleDetailRepositoryReturnErreur1_whenRetrieveArticleDetail_thenArticleDetailReturnError1Message() {
        // Given
        let sut = ArticleDetailViewModel(articleDetailRepository: ArticleDetailRepositoryStub())

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

}

enum ArticleDetailViewModelError: Error {
    case error1
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
        failure(.error1)

    }
}

// MARK: - ArticleDetailRepositoryProtocol

private class ArticleDetailRepositoryStub: ArticleDetailRepositoryProtocol {
    func retrieveArticle(success: @escaping ArticleDetailRepositoryStub.retrieveArticleSuccess,
                         failure: @escaping ArticleDetailRepositoryStub.retrieveArticleError) {
        //@TODO:
    }


}
