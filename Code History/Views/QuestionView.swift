//
//  QuestionView.swift
//  Code History
//
//  Created by Andres Londono on 17/2/2023.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    let question: Question
    
    var body: some View {
        VStack {
            Text(question.questionText)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
                .padding()
            Spacer()
//            VStack {
//                // The reason for the `id` argument is explained here:
//                // https://stackoverflow.com/questions/69527614/swiftui-why-does-foreach-need-an-id
//                ForEach(0..<question.possibleAnswers.count, id: \.self) { answerIndex in
//                    // Define the view that will be returned for each index
//                    Button(action: {
//                        print("Tapped on option with text: \(question.possibleAnswers[answerIndex])")
//                        viewModel.makeGuess(atIndex: answerIndex)
//                    }, label: {
//                        ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
//                            .background(viewModel.color(forOptionIndex: answerIndex))
//                    })
//                    .disabled(viewModel.guessWasMade)
//                }
//            }.padding()
            HStack {
                // The reason for the `id` argument is explained here:
                // https://stackoverflow.com/questions/69527614/swiftui-why-does-foreach-need-an-id
                ForEach(0...1, id: \.self) { answerIndex in
                    // Define the view that will be returned for each index
                    Button(action: {
                        print("Tapped on option with text: \(question.possibleAnswers[answerIndex])")
                        viewModel.makeGuess(atIndex: answerIndex)
                    }, label: {
                        ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                            .background(viewModel.color(forOptionIndex: answerIndex))
                    })
                    .disabled(viewModel.guessWasMade)
                }
            }
            HStack {
                // The reason for the `id` argument is explained here:
                // https://stackoverflow.com/questions/69527614/swiftui-why-does-foreach-need-an-id
                ForEach(2..<question.possibleAnswers.count, id: \.self) { answerIndex in
                    // Define the view that will be returned for each index
                    Button(action: {
                        print("Tapped on option with text: \(question.possibleAnswers[answerIndex])")
                        viewModel.makeGuess(atIndex: answerIndex)
                    }, label: {
                        ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                            .background(viewModel.color(forOptionIndex: answerIndex))
                    })
                    .disabled(viewModel.guessWasMade)
                }
            }
            if viewModel.guessWasMade {
                Button(action: {
                    viewModel.displayNextScreen()
                }, label: {
                    BottomTextView(str: "Next")
                })
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Game().currentQuestion)
    }
}
