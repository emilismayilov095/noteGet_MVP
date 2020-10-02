//
//  NotesPresenter.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import Foundation
import RealmSwift

protocol NotesViewProtocol: class {
}


protocol NotesViewPresenterProtocol: class {
    init(view: NotesViewProtocol, realmManager: RealmManager, router: RouterProtocol)
    func tapOnTheNote(note: Note?)
    func deleteNote(note: Note?)
}


class NotesPresenter: NotesViewPresenterProtocol {
    
    weak var view: NotesViewProtocol?
    let realmManager: RealmManager
    var notes: Results<Note>!
    var router: RouterProtocol
    
    required init(view: NotesViewProtocol, realmManager: RealmManager, router: RouterProtocol) {
        self.view = view
        self.realmManager = realmManager
        self.router = router
        self.getNotes()
    }
    
    func getNotes() {
        let realm = realmManager.realm
        notes = realm.objects(Note.self)
    }
    
    func tapOnTheNote(note: Note?) {
        router.showDetail(note: note)
    }
    
    func deleteNote(note: Note?) {
        guard let note = note else {return}
        realmManager.delete(note)
    }
}
