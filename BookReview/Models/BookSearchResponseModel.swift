//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import Foundation
struct BookSearchResponseModel : Decodable{
    var items : [Book] = []
}
