//
//  ContentView.swift
//  Code History
//
//  Created by Andres Londono on 9/1/2023.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                GameColor.main.ignoresSafeArea()
                VStack {
                    Text(viewModel.questionProgressText)
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                        .padding()
                    QuestionView(question: viewModel.currentQuestion)
                }
                //.padding()
            }
            .foregroundColor(.white)
            .navigationBarHidden(true)
            .environmentObject(viewModel)
            .navigationDestination(isPresented: .constant(viewModel.gameIsOver),
                                   destination: { ScoreView(viewModel: ScoreViewModel(correctGuesses: viewModel.correctGuesses, incorrectGuesses: viewModel.incorrectGuesses)) }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
