//
//  ChallengeView.swift
//  75hrd Trainer
//
//  Created by Tanishq Patidar on 23/10/23.
//

import SwiftUI

struct ChallengeView: View {
    @State var challenge: Challenge
    
    var body: some View {
        List(challenge.tasks.indices, id: \.self) { index in
            HStack {
                VStack(alignment: .leading) {
                    Text(challenge.tasks[index].name).font(.headline)
                    Text(challenge.tasks[index].description).font(.subheadline)
                }
                
                Spacer()
                
                if challenge.tasks[index].isCompleted {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                } else {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.red)
                }
            }
            .onTapGesture {
                challenge.tasks[index].isCompleted.toggle()
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView(challenge: Challenge(tasks: sampleTasks))
    }
    
    static var sampleTasks: [Task] = [
        Task(name: "Workout", description: "Complete a 45-minute workout", isCompleted: false),
        Task(name: "Reading", description: "Read 10 pages of a book", isCompleted: false)
    ]
}
