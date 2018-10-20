//
//  NetworkManager.swift
//  Test
//  Created by Hussain.Chhatriwala on 10/18/18.
//  Copyright © 2018 Hussain.Chhatriwala. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    class func sendRequest(requestUrl: String, success_handler: SuccessClosure?, failure_handler: FailureClosure?) {
        let urlString = URL(string: requestUrl)
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error, let failureHandler = failure_handler {
                    failureHandler(error)
                    print(error)
                } else {
                    if let usableData = data, let successHandler = success_handler {
                        successHandler(usableData)
                    }
                }
            }
            task.resume()
        }
    }
}
