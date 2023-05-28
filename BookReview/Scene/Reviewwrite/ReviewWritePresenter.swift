//
//  RevieWritePresenter.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import Foundation
protocol ReviewWriteProtocol{
    func setupNavigationBar()
    func showCloseAlertSheet()
    func close()
    func setupViews()
    func presentSearchBookController()
    func updateViews(title : String, imageUrl : URL)
}
final class ReviewWritePresenter{
    private let vc : ReviewWriteProtocol
    private let userDefaultManager = UserDefaultManager()
    private var book : Book?
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요"
    init(vc: ReviewWriteProtocol) {
        self.vc = vc
    }
    func viewDidLoad(){
        vc.setupNavigationBar()
        vc.setupViews()
    }
   
    func didTapLeftBarButton(){
        vc.showCloseAlertSheet()
    }
    func didTapRightBarButton(contentsText : String){
        guard let book = book, contentsText != contentsTextViewPlaceHolderText else { return}
        let bookreview = BookReview(title: book.title, contents: contentsText , imgURL: book.imageURL)
        userDefaultManager.setReviews(bookreview)
        vc.close()
    }
    func didTapbookTitleBtn(){
        vc.presentSearchBookController()
    }
}
extension ReviewWritePresenter : SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        vc.updateViews(title: book.title, imageUrl: book.imageURL!)
    }
}
