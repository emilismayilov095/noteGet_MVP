//
//  NotesPresenterTests.swift
//  Note Get MVPTests
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import XCTest
@testable import Note_Get_MVP
import RealmSwift

class MockView: NotesViewProtocol {
    
}


class NotesPresenterTests: XCTestCase {

    var view: MockView!
    var presenter: NotesPresenter!
    var realmManager: RealmManager!
    var router: RouterProtocol!
    var note: Note!
    var notes: Results<Note>!

    override func setUpWithError() throws {
        
        view = MockView()
        
        note = Note(text: "Foo")
        
        realmManager = RealmManager.shared
        notes = realmManager.realm.objects(Note.self)
        
        let navVC = UINavigationController()
        let builder = ModuleBuilder()
        router = Router(navigationController: navVC, moduleBuilder: builder)
        
        presenter = NotesPresenter(view: view, realmManager: realmManager, router: router)
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        realmManager = nil
        router = nil
        notes = nil
    }
    
    func testGetNotes() {
        presenter.getNotes()
        XCTAssert(!self.notes.isEmpty)
    }
    
    func testTapOnTheNote() {
        presenter.tapOnTheNote(note: note)
        XCTAssert(note != nil)
    }

}
