//
//  UserModel.swift
//  75Hrd Trainer
//
//  Created by Tanishq Patidar on 25/09/23.
//

import Firebase

class User {
    var uid: String?
    var email: String?
    
    init(uid: String?, email: String?) {
        self.uid = uid
        self.email = email
    }
}
