//
//  UserModel.swift
//  75Hrd Trainer
//
//  Created by Tanishq Patidar on 25/09/23.
//

//import Firebase

// Base class for user profiles
class Profile {
    var uid: String

    init(uid: String) {
        self.uid = uid
    }
}

// User class representing a user of the app, inheriting from Profile
class User: Profile {
    var username: String

    init(uid: String, username: String) {
        self.username = username
        super.init(uid: uid)
    }

    func displayProfile() {
        print("Username: \(username), UID: \(uid)")
    }
}

// UserDetail class representing additional details about a user, inheriting from Profile
class UserDetail: Profile {
    var gender: String
    var age: Int
    var weight: Double
    var fitnessGoals: String

    init(uid: String, gender: String, age: Int, weight: Double, fitnessGoals: String) {
        self.gender = gender
        self.age = age
        self.weight = weight
        self.fitnessGoals = fitnessGoals
        super.init(uid: uid)
    }

    var dictionary: [String: Any] {
        return [
            "userId": uid,
            "gender": gender,
            "age": age,
            "weight": weight,
            "fitnessGoals": fitnessGoals
        ]
    }
}
