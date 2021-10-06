//
//  ArticleView.swift
//  NewsAPI
//
//  Created by Rob Maltese on 10/5/21.
//

import SwiftUI
import URLImage
import URLImageStore

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let imageURL = article.image,
               let url = URL(string: imageURL) {
                URLImage(url) {
                    // This view is displayed before download starts
                    EmptyView()
                } inProgress: { progress in
                    // Display progress
                    Text("Loading...")
                } failure: { error, _ in
                    // Display error and retry button
                    PlaceholderImageView()
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 100, height: 100)
                }
            } else {
                PlaceholderImageView()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .semibold))
                Text(article.source)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        VStack {
            Image(systemName: "photo.fill")
                .foregroundColor(.white)
                .background(Color.gray)
                .frame(width: 100, height: 100)
        }
    }
}
