//
//  SearchBookViewController.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import UIKit
import SnapKit
final class SearchBookViewController : UIViewController{
    private lazy var presenter = SearchBookPresenter(viewcontroller: self, delegate: Searchbookdelegate)
    private let Searchbookdelegate : SearchBookDelegate
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = presenter
        tableview.dataSource = presenter
        return tableview
    }()
    init(searchBookDelegate : SearchBookDelegate){
        self.Searchbookdelegate = searchBookDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad() 
    }
}
extension SearchBookViewController : SearchBookProtocol{
    func dismiss() {
        navigationItem.searchController?.dismiss(animated: true)
        dismiss(animated: true)
    }
    func reloadView(){
        tableView.reloadData()
    }
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
