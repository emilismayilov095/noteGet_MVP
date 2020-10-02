//
//  DetailViewController.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import UIKit

class DetailViewController: BaseVC {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var notesTextView: UITextView!
    
    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseScrollView = self.scrollView
        baseTextView = self.notesTextView
        
        createDoneButtonToNavigationBar()
        presenter.setNote()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if !notesTextView.text.isEmpty {
            presenter.dissmiss(text: notesTextView.text)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    @objc func doneTapped() {
        self.view.endEditing(true)
    }
}


extension DetailViewController: DetailViewProtocol {
    func setNote(note: Note?) {
        if note != nil {
            notesTextView.text = note?.text
        } else {
            notesTextView.becomeFirstResponder()
        }
    }
}


//MARK: - UI Setup
extension DetailViewController {
    func createDoneButtonToNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        self.navigationController?.navigationBar.topItem?.title = " "
    }
}
