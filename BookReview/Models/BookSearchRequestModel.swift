//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import Foundation
struct BookSearchRequestModel : Codable{
    /// 검색할 책 키워드 슬래쉬3개면 사용할때 설명으로 뜸
    let query : String
    
}
