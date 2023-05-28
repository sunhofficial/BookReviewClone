//
//  UserDefaultManager.swift
//  BookReview
//
//  Created by 235 on 2023/05/28.
//

import Foundation
protocol UserDefaultManagerProtocol{
    func getReviews() -> [BookReview]
    func setReviews(_ newvalue : BookReview)
}
struct UserDefaultManager : UserDefaultManagerProtocol{
    enum Key: String{
        case review
    }
    func getReviews() -> [BookReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else{return []}
        return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? []
    }
    
    func setReviews(_ newvalue: BookReview) {
        var currentReviews : [BookReview] = getReviews()
        currentReviews.insert(newvalue, at: 0)
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentReviews), forKey: Key.review.rawValue)
    }
    
    
}
