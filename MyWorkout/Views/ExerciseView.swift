//
//  ExerciseView.swift
//  MyWorkout
//
//  Created by Tham Thearawiboon on 19/9/2564 BE.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State var showHistory = false
    @State private var showSuccess =  false
    
    let index: Int
    @State private var timeDone = false
    @State private var showTimer = false
    
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab:$selectedTab, titleText: Exercise.exercises[index].exerciseName)
                
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text(NSLocalizedString("Couldn't find \(Exercise.exercises[index].videoName).mp4", comment: ""))
                        .foregroundColor(.red)
                }
                
                
                HStack(spacing: 150){
                    Button(NSLocalizedString("Start", comment: "begin exercise")){ showTimer.toggle()}
                    Button(NSLocalizedString("Done", comment: "mark as finished")){
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        timeDone = false
                        showTimer.toggle()
                        if history.getCountExercise() == 7 {
                            showSuccess.toggle()
                        }
                        else{
                            if history.currentPage == selectedTab {
                                selectedTab = selectedTab + 1
                                history.currentPage = history.currentPage + 1
                            }
                            else{
                                selectedTab = history.currentPage
                            }
                        }
                    }
                    .disabled(!timeDone)
                    .sheet(isPresented: $showSuccess){
                        SuccessView(selectedTab: $selectedTab)
                    }
                }
                .font(.title3)
                .padding()
                if showTimer{
                    TimerView(timerDone: $timeDone)
                }
                Spacer()
                RatingView(exerciseIndex: index)
                    .padding()
                Button(NSLocalizedString("History", comment: "view user activity")){ showHistory.toggle() }
                    .padding(.bottom)
                    .sheet(isPresented: $showHistory){
                        HistoryView(showHistory:  $showHistory)
                    }
            }
        }
    }
    var lastExercise: Bool{  //ไปหน้า high five
        index + 1 == Exercise.exercises.count
    }
  
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // เริ่มหน้า 1
            ExerciseView(selectedTab: .constant(1), index: 1)
                .environmentObject(HistoryStore())
        }
    }
}
