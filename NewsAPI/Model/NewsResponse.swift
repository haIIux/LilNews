//
//  NewsResponse.swift
//  NewsAPI
//
//  Created by Rob Maltese on 10/5/21.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(
            author: "Joseph Choi",
            url: "https://thehill.com/policy/healthcare/575417-fourth-person-dies-from-rare-blood-clotting-syndrome-after-receiving-jj",
            source: "The Hill",
            title: "Fourth person dies from rare blood-clotting syndrome after receiving J&J vaccine | TheHill - The Hill",
            articleDescription: "A county in Washington on Tuesday confirmed that a woman died from blood-clotting complications a...",
            image: "https://thehill.com/sites/default/files/johnsonandjohnson_082719getty.jpg",
            date: Date())
    }
}
