//
//  ReviewWritePresenterTests.swift
//  BookReviewTests
//
//  Created by 235 on 2023/05/28.
//

import XCTest
@testable import BookReview
class ReviewWritePresenterTests : XCTestCase {
    var sut : ReviewWritePresenter!
    var viewController : MockReviewWriteViewController!
    var userDefaultsManger : MockUserdefaultManager!
    override func setUp() {
        super.setUp()
        viewController = MockReviewWriteViewController()
        userDefaultsManger = MockUserdefaultManager()
        sut = ReviewWritePresenter(vc: viewController, userDefaultsManager: userDefaultsManger)
    }
    override func tearDown() {
        sut = nil
        viewController = nil
        userDefaultsManger = nil
        super.tearDown()
    }
    func test_viewDidLoad가_호출될때(){
        sut.viewDidLoad()
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledsetupViews)
    }
    func test_didTapleft호출될때(){
        sut.didTapLeftBarButton()
        XCTAssertTrue(viewController.isCalledshowCloseAlertSheet)
    }
    func test_didtapright호출될때_book존재_contentstext가placholder같음(){
        sut.book = Book(title: "swift", imageURL: "")
        sut.didTapRightBarButton(contentsText: sut.contentsTextViewPlaceHolderText)
        XCTAssertFalse(userDefaultsManger.isCalledsetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    func test_didtapright호출될때_book존재하지않는경우(){
        sut.book = nil
        sut.didTapRightBarButton(contentsText: "공부하실")
        XCTAssertFalse(userDefaultsManger.isCalledsetReviews)
        XCTAssertFalse(viewController.isCalledClose)
    }
    func test_didTapRight호출될때_book존재_contentstext가placeholder와다른경우(){
        sut.book = Book(title: "Swift", imageURL: "")
        sut.didTapRightBarButton(contentsText: "아주 훌륭한책")
        XCTAssertTrue(userDefaultsManger.isCalledsetReviews)
        XCTAssertTrue(viewController.isCalledClose)
    }
    func test_didTapBookTitle호출(){
        sut.didTapbookTitleBtn()
        XCTAssertTrue(viewController.isCalledpresentSearchBookController)
    }
}
final class MockReviewWriteViewController : ReviewWriteProtocol{
    var isCalledSetupNavigationBar = false
    var isCalledshowCloseAlertSheet = false
    var isCalledClose = false
    var isCalledsetupViews = false
    var isCalledpresentSearchBookController = false
    var isCalledupdateViews = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func showCloseAlertSheet() {
        isCalledshowCloseAlertSheet = true
    }
    
    func close() {
        isCalledClose = true
    }
    
    func setupViews() {
        isCalledsetupViews = true
    }
    
    func presentSearchBookController() {
        isCalledpresentSearchBookController  = true
    }
    
    func updateViews(title: String, imageUrl: URL) {
        isCalledupdateViews = true
    }
    
    
}
