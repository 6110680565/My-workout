//
//  SuccessView.swift
//  MyWorkout
//
//  Created by Tham Thearawiboon on 19/9/2564 BE.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text(NSLocalizedString("High Five!", comment: "success All exercise"))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text(NSLocalizedString("Good job completing all seven exercises!", comment: "success"))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Text(NSLocalizedString("Remember tomorrow's another day.", comment: "success"))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Text(NSLocalizedString("So eat well and get some rest", comment: "success"))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
                VStack{
                    Spacer()
                    Button(NSLocalizedString("Continue", comment: "Start Again")){
                        presentationMode.wrappedValue.dismiss()
                        selectedTab = 9
                    }
                        .padding()
                }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
