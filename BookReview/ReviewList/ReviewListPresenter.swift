//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 235 on 2023/05/23.
//

import Foundation
protocol ReviewListProtocol{}
final class ReviewListPresenter{
    private let viewController : ReviewListProtocol
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
}
