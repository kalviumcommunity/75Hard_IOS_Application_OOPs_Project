//
//  UserManager.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 07/11/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserManager {
    private var currentUser: User?
    
    var userDetail: UserDetail?
    
    func getCurrentUser() -> User? {
            return currentUser
        }
    
    private func saveUserDetailsToFirestore(gender: String, age: Int, weight: Double, fitnessGoals: String) {
            guard let userId = currentUser?.uid else { return }
            
            let userDetail = UserDetail(userId: userId, gender: gender, age: age, weight: weight, fitnessGoals: fitnessGoals)
            
            let db = Firestore.firestore()
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

struct UserDetail {
    let userId: String
    let gender: String
    let age: Int
    let weight: Double
    let fitnessGoals: String
    
    var dictionary: [String: Any] {
        return [
            "userId": userId,
            "gender": gender,
            "age": age,
            "weight": weight,
            "fitnessGoals": fitnessGoals
        ]
    }
}
