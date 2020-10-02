//
//  NotesViewController.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, NotesViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: NotesPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        createAddButtonToNavigationBar()
        tableView.register(UINib(nibName: String(describing: NoteCell.self), bundle: nil), forCellReuseIdentifier: "NoteCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "NoteGet MVP"
        self.tableView.reloadData()
    }

    @objc func addTapped() {
        presenter.tapOnTheNote(note: nil)
    }
}

//MARK: - Table View Data Source
extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: String(describing: NoteCell.self), for: indexPath) as! NoteCell
        noteCell.setupCellWith(note: presenter.notes[indexPath.row])
        return noteCell
    }
}

//MARK: - Table Delegate
extension NotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.tapOnTheNote(note: presenter.notes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self.presenter.deleteNote(note: self.presenter.notes[indexPath.row])
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            success(true)
        })
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

//MARK: - UI Setup
extension NotesViewController {
    func createAddButtonToNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
}
