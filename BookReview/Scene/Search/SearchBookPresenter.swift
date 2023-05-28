//
//  SearchBookPresenter.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import UIKit
protocol SearchBookProtocol{
    func setupViews()
    func dismiss()
    func reloadView()
}
protocol SearchBookDelegate {
    func selectBook(_ book : Book)
}
final class SearchBookPresenter : NSObject{
    private let viewcontroller : SearchBookProtocol
    private let bookSearchManager = BookSearchManager()
    private let delegate : SearchBookDelegate
    private var books : [Book] = []
    init(viewcontroller: SearchBookProtocol, delegate: SearchBookDelegate) {
        self.viewcontroller = viewcontroller
        self.delegate = delegate
    }
    func viewDidLoad(){
        viewcontroller.setupViews()
    }
}
extension SearchBookPresenter : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else{return}
        bookSearchManager.request(from: searchText){ [weak self] newbooks in
            self?.books = newbooks
            self?.viewcontroller.reloadView()
        }
    }
}
extension SearchBookPresenter : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        cell.textLabel?.text = "\(books[indexPath.row].title)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedbook = books[indexPath.row]
        delegate.selectBook(selectedbook)
        viewcontroller.dismiss()
        
    }
}
