//
//  UserManager.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 07/11/23.
//

import Foundation
import Firebase
import FirebaseAuth

// UserManager using the Profile base class
class UserManager {
    private var currentUser: Profile?

    var userDetail: UserDetail?

    func getCurrentUser() -> Profile? {
        return currentUser
    }

    private func saveUserDetailsToFirestore(gender: String, age: Int, weight: Double, fitnessGoals: String) {
        guard let userId = currentUser?.uid else { return }

        let userDetail = UserDetail(uid: userId, gender: gender, age: age, weight: weight, fitnessGoals: fitnessGoals)

        let db = FirebaseFirestore.firestore()
        let userDetailRef = db.collection("userDetails").document(userId)

        userDetailRef.setData(userDetail.dictionary) { error in
            if let error = error {
                print("Error saving user details: \(error.localizedDescription)")
            } else {
                self.userDetail = userDetail
                print("User details saved successfully.")
            }
        }
    }
}
