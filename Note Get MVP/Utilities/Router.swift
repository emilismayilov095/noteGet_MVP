//
//  Router.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import Foundation
import UIKit



protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var moduleBuilder: BuilderProtocol? {get set}
}


protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(note: Note?)
    func popToRoot()
}


class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: BuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: BuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let navVC = navigationController, let notesVC = moduleBuilder?.createNotesModule(realmManager: RealmManager.shared, router: self) {
            navVC.viewControllers = [notesVC]
        }
    }
    
    func showDetail(note: Note?) {
        if let navVC = navigationController, let detailVC = moduleBuilder?.createDetailModule(note: note, router: self) {
            navVC.pushViewController(detailVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navVC = navigationController{
            navVC.popToRootViewController(animated: true)
        }
    }
    
}
