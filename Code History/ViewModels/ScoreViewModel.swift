//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Andres Londono on 19/2/2023.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
