//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 235 on 2023/05/23.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol{
    func setupNavigationBar()
    func presentToReviewWriteViewController()
    func setupVIews()
    func reloadTableView()
}
final class ReviewListPresenter : NSObject{
    private let viewController : ReviewListProtocol
    private let userdDefaultManager = UserDefaultManager()
    private var review : [BookReview] = []
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    func viewDidLoad(){
        viewController.setupNavigationBar()
        viewController.setupVIews()
    }
    func viewWillAppear(){
        review = userdDefaultManager.getReviews()
        viewController.reloadTableView()
    }
    func didTaprightBarbuttonItem(){
        viewController.presentToReviewWriteViewController()
    }
}
extension ReviewListPresenter: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        review.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let reveiw = review[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = reveiw.title
        content.secondaryText = reveiw.contents
        let imageView = UIImageView()
        imageView.kf.setImage(with: reveiw.imgURL) { result in
            switch result {
            case .success(let value):
                content.image = value.image
                content.imageProperties.maximumSize = CGSize(width: 70, height: 70)
                cell.contentConfiguration = content
            case .failure(let error):
                print("Error loading image: \(error)")
            }
        }
        cell.selectionStyle  = .none
       
        
        return cell
    }
}

