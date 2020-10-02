//
//  BaseVC.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    var baseScrollView: UIScrollView?
    var baseTextView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(BaseVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}



extension BaseVC {
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        baseScrollView?.contentInset.bottom = keyboardFrame.height + 55
        baseTextView?.contentInset.bottom = keyboardFrame.height + 55
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        baseScrollView?.contentInset = contentInsets
        baseScrollView?.scrollIndicatorInsets = contentInsets
        baseTextView?.contentInset = contentInsets
        baseTextView?.scrollIndicatorInsets = contentInsets
    }
}
