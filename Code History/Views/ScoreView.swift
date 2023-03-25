//
//  ScoreView.swift
//  Code History
//
//  Created by Andres Londono on 19/2/2023.
//

import SwiftUI

struct ScoreView: View {
    let viewModel: ScoreViewModel
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Final Score:")
                    .font(.body)
                Text("\(viewModel.percentage)%")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                VStack {
                    Text("\(viewModel.correctGuesses) ✅")
                    Text("\(viewModel.incorrectGuesses) ❌")
                }.font(.system(size: 30))
                Spacer()
                NavigationLink(
                    destination: GameView(),
                    label: {
                        BottomTextView(str: "Re-take Quiz")
                })
            }
            .foregroundColor(.white)
            // `.navigationBarHidden(true)` will be deprecated, use `.toolbar(.hidden)` instead.
            .toolbar(.hidden)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(viewModel: ScoreViewModel(correctGuesses: 8, incorrectGuesses: 2))
    }
}
