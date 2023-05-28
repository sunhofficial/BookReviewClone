//
//  Book.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import Foundation
struct Book : Decodable{
    let title : String
    private let image : String?
    var imageURL : URL? {
        URL(string: image ?? "")
    }
}
