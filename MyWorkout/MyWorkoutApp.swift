//
//  MyWorkoutApp.swift
//  MyWorkout
//
//  Created by Tham Thearawiboon on 19/9/2564 BE.
//

import SwiftUI

@main
struct MyWorkoutApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
                }
                .environmentObject(HistoryStore())
        }
    }
}
