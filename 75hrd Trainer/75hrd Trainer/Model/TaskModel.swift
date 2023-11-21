//
//  TaskModel.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 23/10/23.
//

import Foundation

struct Task {
    var name: String
    var description: String
    var isCompleted: Bool = false
}

struct Challenge {
    var tasks: [Task]
}
