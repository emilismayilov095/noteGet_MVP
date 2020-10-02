//
//  DetailPresenter.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: class {
    func setNote(note: Note?)
}


protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol, note: Note?, router: RouterProtocol)
    func setNote()
    func updateNote(text: String)
    func dissmiss(text: String)
}


class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    var note: Note?
    var router: RouterProtocol
    let realmManager: RealmManager
    
    required init(view: DetailViewProtocol, note: Note?, router: RouterProtocol) {
        self.view = view
        self.note = note
        self.realmManager = RealmManager.shared
        self.router = router
    }
    
    func updateNote(text: String) {
        let dict: [String:Any?] = ["text": text]
        realmManager.update(self.note!, with: dict)
    }
    
    func setNote() {
        self.view?.setNote(note: note)
    }
    
    func dissmiss(text: String) {
        if note?.text != nil {
            self.updateNote(text: text)
            print("NOTE NOT NIL")
        } else {
            print("NOTE IS NIL")
            realmManager.create(Note(text: text))
        }
    }
}
