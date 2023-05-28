//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import UIKit
import SnapKit
final class SearchBookViewController : UIViewController{
    private lazy var presenter = SearchBookPresenter(viewcontroller: self)
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = presenter
        tableview.dataSource = presenter
        return tableview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad() 
    }
}
extension SearchBookViewController : SearchBookProtocol{
    func setupViews() {
        view.backgroundColor = .systemBackground
        let searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = presenter
        navigationItem.searchController = searchController
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
