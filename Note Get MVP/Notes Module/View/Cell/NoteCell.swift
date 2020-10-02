//
//  NoteCell.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    @IBOutlet weak var noteTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCellWith(note: Note) {
        self.noteTextLabel.text = note.text
    }
}
