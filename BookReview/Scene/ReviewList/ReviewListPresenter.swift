//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 235 on 2023/05/23.
//

import UIKit
protocol ReviewListProtocol{
    func setupNavigationBar()
    func presentToReviewWriteViewController()
    func setupVIews()
    func reloadTableView()
}
final class ReviewListPresenter : NSObject{
    private let viewController : ReviewListProtocol
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    func viewDidLoad(){
        viewController.setupNavigationBar()
        viewController.setupVIews()
    }
    func viewWillAppear(){
        viewController.reloadTableView()
    }
    func didTaprightBarbuttonItem(){
        viewController.presentToReviewWriteViewController()
    }
}
extension ReviewListPresenter: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.row)"
        cell.contentConfiguration = content
        
        return cell
    }
}

