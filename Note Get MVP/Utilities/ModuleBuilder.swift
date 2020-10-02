//
//  ModuleBuilder.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import UIKit



protocol BuilderProtocol {
    func createNotesModule(realmManager: RealmManager, router: RouterProtocol) -> UIViewController
    func createDetailModule(note: Note?, router: RouterProtocol) -> UIViewController
}


class ModuleBuilder: BuilderProtocol {

    
    func createNotesModule(realmManager: RealmManager, router: RouterProtocol) -> UIViewController {
        let view = NotesViewController()
        let presenter = NotesPresenter(view: view, realmManager: realmManager, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(note: Note?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, note: note, router: router)
        view.presenter = presenter
        return view
    }

}
