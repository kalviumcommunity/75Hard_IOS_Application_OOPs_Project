//
//  AuthenticationManager.swift
//  75Hrd Trainer
//
//  Created by Tanishq Patidar on 25/09/23.
//

//import Firebase

class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    private init() {}
    
    deinit {
            print("Used authentication manager")
        }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                let newUser = User(uid: user.uid, email: user.email)
                completion(.success(newUser))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                let currentUser = User(uid: user.uid, email: user.email)
                completion(.success(currentUser))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
