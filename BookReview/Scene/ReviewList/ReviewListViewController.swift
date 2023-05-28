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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }


}

extension ReviewListViewController : ReviewListProtocol {
    func setupNavigationBar(){
        navigationItem.title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(didTaprightBarbuttonItem))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    func setupVIews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    func presentToReviewWriteViewController(){
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    func reloadTableView(){
        tableView.reloadData()
    }
}
private extension ReviewListViewController{
    @objc func didTaprightBarbuttonItem(){
        presenter.didTaprightBarbuttonItem()
    }
}
