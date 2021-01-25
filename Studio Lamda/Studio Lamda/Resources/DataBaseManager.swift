//
//  DataBaseManager.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/19/21.
//

import Foundation
//import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
//    private let database = Database.database().reference()
    
    
}

extension DatabaseManager {
    
//    public func isUserExists(with email:String, completion: @escaping((Bool) -> Void)) {
//        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
//        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
//
//        database.child(safeEmail).observeSingleEvent(of: .value) { (snapshot) in
//            guard snapshot.value as? String != nil else {
//                completion(false)
//                return
//            }
//            completion(true)
//        }
//    }
//
//    public func insertUser(user: ChatAppUser){
//        database.child(user.safeEmail).setValue([
//                                                    "full_Name":user.fullName,
//                                                    "progressBar_Updater": user.progressBarUpdater,
//        ])
//    }
}


struct  ChatAppUser {
    let fullName: String
    let emailAddress: String
    let progressBarUpdater: Int
    var safeEmail : String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}
