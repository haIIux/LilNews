//
//  States.swift
//  NewsAPI
//
//  Created by Rob Maltese on 10/5/21.
//

import Foundation


enum  ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
    
}
