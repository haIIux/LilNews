//
//  NewsEndpoint.swift
//  NewsAPI
//
//  Created by Rob Maltese on 10/5/21.
//

import Foundation


///  Protocol used because if there was another API to use, we could simply reuse this protocol to call it.

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

/// Utilizing an enumerator as if we had multiple endpoints, we could simply reuse thise enum.
enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    
    /// This takes combines our base URL with our endpoint for resuability.
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    /// Base URL is the pre-endpoint portion of our API URL.
    var baseUrl: URL {
        switch self {
        case .getNews :
            return URL(string: "https://api.lil.software")!
        }
    }
    
    /// Path is just that, our path or actual endpoint we're using.
    var path: String {
        return "/news"
    }
}
