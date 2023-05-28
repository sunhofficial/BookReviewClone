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
}
final class ReviewWritePresenter{
    private let vc : ReviewWriteProtocol
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
    func didTapRightBarButton(){
        vc.close()
    }
    func didTapbookTitleBtn(){
        vc.presentSearchBookController()
    }
}
