//
//  HistoryView.swift
//  MyWorkout
//
//  Created by Tham Thearawiboon on 19/9/2564 BE.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    let history = HistoryStore()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section(header: Text(day.date.formatted(as: "MMM d"))) {
                            ForEach(day.exercises, id: \.self) {
                                exercise in
                                Text(exercise)
                            }
                        }
                    }
                }
            }
            
            Button(action: { showHistory.toggle() }) {
                Image(systemName: "xmark.circle")
                    .font(.title2)
                    .padding(.trailing)
            }
        }
        
    }
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
                        .environmentObject(HistoryStore())
    }
}
