//
//  NetworkConstant.swift
//  Test
//
//  Created by Hussain.Chhatriwala on 10/18/18.
//  Copyright © 2018 Hussain.Chhatriwala. All rights reserved.
//

import Foundation

let apiKey = "45f624bd592d452f857498685ec780ad"

// MARK: - Base URL -

struct APIBaseURLs {
    static let baseURL = "http://api.nytimes.com/svc/mostpopular/v2/"
}

/// Authorize Web Services
struct MostViewedService {
    static let allSection = "mostviewed/all-sections/7.json"
}

/// Web Services Closures
typealias SuccessClosure = (Data) -> ()
typealias FailureClosure = (Error) -> ()
