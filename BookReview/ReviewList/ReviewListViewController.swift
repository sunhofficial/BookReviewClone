//
//  ViewController.swift
//  BookReview
//
//  Created by 235 on 2023/05/23.
//

import UIKit

class ReviewListViewController: UIViewController {
    private lazy var presenter = ReviewListPresenter(viewController: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }   


}

extension ReviewListViewController : ReviewListProtocol {}
