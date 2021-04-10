//
//  UIViewContoller+Ext.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

extension UIViewController {
    
    func presentCTAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = CTAlertVC(alertTitle: title, alertMessage: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
