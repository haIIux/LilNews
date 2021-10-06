//
//  HomeView.swift
//  NewsAPI
//
//  Created by Rob Maltese on 10/5/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(content: let content):
                NavigationView {
                    List(content) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            case .failed(error: let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            }
        }.onAppear {
            viewModel.getArticles()
        }
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        openURL(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
