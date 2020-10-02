//
//  Note.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Note: Object {
    dynamic var text : String?  = ""
    convenience init(text: String?) {
        self.init()
        self.text = text
    }
}
