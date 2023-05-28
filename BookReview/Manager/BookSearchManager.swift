//
//  BookSearchManager.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import Alamofire
import Foundation
struct BookSearchManager{
    func request(from keyword : String, completionHandelr : @escaping (([Book])->Void)){
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return}
        let param = BookSearchRequestModel(query: keyword)

        let headers : HTTPHeaders = [
            "X-Naver-Client-Id" : "BHQcJy3Pv49qtBgmG1jr",
            "X-Naver-Client-Secret" : "suCikMnfYU"
        ]
        AF.request(url, method: .get, parameters: param, headers: headers).responseDecodable(of: BookSearchResponseModel.self){
            respone in
            switch respone.result {
            case .success(let result):
                completionHandelr(result.items)
            case .failure(let err):
                print(err.errorDescription)
            }
        }.resume()
    }
}
