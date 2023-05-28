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
}
final class SearchBookPresenter : NSObject{
    private let viewcontroller : SearchBookProtocol
    init(viewcontroller: SearchBookProtocol) {
        self.viewcontroller = viewcontroller
    }
    func viewDidLoad(){
        viewcontroller.setupViews()
    }
}
extension SearchBookPresenter : UISearchBarDelegate{}
extension SearchBookPresenter : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewcontroller.dismiss()
    }
}
