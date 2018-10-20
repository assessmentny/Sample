//
//  UIViewController+Extension.swift
//  Test
//
//  Created by Hussain Chhatriwala on 18/10/18.
//  Copyright © 2018 Hussain.Chhatriwala. All rights reserved.
//

import UIKit
extension UIViewController {
    func displaySpinner() -> UIView {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let rootViewFrame = appDelegate.window?.rootViewController?.view.frame {
            let spinnerView = UIView.init(frame: rootViewFrame )
            spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            let ai = UIActivityIndicatorView(style: .whiteLarge)
            ai.startAnimating()
            ai.center = spinnerView.center
            DispatchQueue.main.async {
                spinnerView.addSubview(ai)
                self.view.addSubview(spinnerView)
            }
            return spinnerView
        }
        return UIView()
    }
    
    func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
