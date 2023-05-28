//
//  BookReviewTests.swift
//  BookReviewTests
//
//  Created by 235 on 2023/05/23.
//

import XCTest
@testable import BookReview

final class ReviewListPresenterTests: XCTestCase {
    var sut: ReviewListPresenter!
    var viewcontroller : MockReivewListViewController!
    var userDefaultManager : MockUserdefaultManager!
    override func setUp() {
        super.setUp()
        viewcontroller = MockReivewListViewController()
        userDefaultManager = MockUserdefaultManager()
        sut = ReviewListPresenter(viewController: viewcontroller, userdDefaultManager: userDefaultManager)
    }
    override func tearDown() {
        sut = nil
        viewcontroller = nil
        super.tearDown()
    }
    func test_viewDidLoad가_호출될때(){
        sut.viewDidLoad()
        XCTAssertTrue(viewcontroller.isCalledSetupNavigationBar)
        XCTAssertTrue(viewcontroller.isCalledSetupVIews)
    }
    func test_viewWillAppear가_호출될때(){
        sut.viewWillAppear()
        XCTAssertTrue(userDefaultManager.isCalledgetReviews)
        XCTAssertTrue(viewcontroller.isCalledreloadTableView)
    }
    func test_didTapRightBarButtonItem이_호출될_때(){
        sut.didTaprightBarbuttonItem()
        XCTAssertTrue(viewcontroller.isCalledPresenttoreviewWriteViewController)
    }

}
final class MockUserdefaultManager : UserDefaultManagerProtocol {
    var isCalledgetReviews = false
    var isCalledsetReviews = false
    func getReviews() -> [BookReview] {
        isCalledgetReviews = true
        return []
    }
    
    func setReviews(_ newvalue: BookReview) {
        isCalledsetReviews = true
    }
    
    
}
final class MockReivewListViewController : ReviewListProtocol{
    var isCalledSetupNavigationBar = false
    var isCalledSetupVIews = false
    var isCalledPresenttoreviewWriteViewController = false
    var isCalledreloadTableView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar  = true
    }
    
    func presentToReviewWriteViewController() {
        isCalledPresenttoreviewWriteViewController = true
    }
    
    func setupVIews() {
        isCalledSetupVIews = true
    }
    
    func reloadTableView() {
        isCalledreloadTableView = true
    }
}
