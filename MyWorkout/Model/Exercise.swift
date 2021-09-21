//
//  Exercise.swift
//  MyWorkout
//
//  Created by Tham Thearawiboon on 19/9/2564 BE.
//

import Foundation

struct Exercise {
    let exerciseName: String
    let videoName: String
    
    enum ExerciseEnum: String {
        case squat = "Squat"
        case stepUp = "Step Up"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
        case sitUp = "Sit-up"
        case crunches = "Crunches"
        case lunge = "Lunge"
        
        var description: String{
            switch self {
            case .squat:
                return NSLocalizedString("Squat", comment: "exercise")
                
            case .stepUp:
                return NSLocalizedString("Step Up", comment: "exercise")
                
            case .burpee:
                return NSLocalizedString("Burpee", comment: "exercise")
                
            case .sunSalute:
                return NSLocalizedString("Sun Salute", comment: "exercise")
                
            case .sitUp:
                return NSLocalizedString("Sit-up", comment: "exercise")
                
            case .crunches:
                return NSLocalizedString("Crunches", comment: "exercise")
                
            case .lunge:
                return NSLocalizedString("Lunge", comment: "exercise")
            }
        }
        
    }
}

extension Exercise {
    static let exercises = [
        Exercise(exerciseName: ExerciseEnum.squat.rawValue, videoName: "squat"),
        Exercise(exerciseName: ExerciseEnum.stepUp.rawValue, videoName: "step-up"),
        Exercise(exerciseName: ExerciseEnum.burpee.rawValue, videoName: "burpee"),
        Exercise(exerciseName: ExerciseEnum.sunSalute.rawValue, videoName: "sun-salute"),
        Exercise(exerciseName: ExerciseEnum.sitUp.rawValue, videoName: "sit-up"),
        Exercise(exerciseName: ExerciseEnum.crunches.rawValue, videoName: "crunches"),
        Exercise(exerciseName: ExerciseEnum.lunge.rawValue, videoName: "lunge"),
    ]
}
