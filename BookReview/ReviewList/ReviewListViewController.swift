//
//  ViewController.swift
//  BookReview
//
//  Created by 235 on 2023/05/23.
//

import UIKit
import SnapKit
class ReviewListViewController: UIViewController {
    private lazy var presenter = ReviewListPresenter(viewController: self)
    private lazy var tableView : UITableView = {
        let tableView  = UITableView()
        tableView.dataSource = presenter
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }   


}

extension ReviewListViewController : ReviewListProtocol {
    func setupNavigationBar(){
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    func setupVIews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
