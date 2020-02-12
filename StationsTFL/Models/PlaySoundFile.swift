//
//  PlaySoundFile.swift
//  StationsTFL
//
//  Created by Ufuoma Okoro on 12/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Create Sound File
import Foundation
import AVFoundation




//Function to play sound file
func playGameSoundFile(sound: String, type: String) {
    
    var audioPlayer: AVAudioPlayer?
    
    //Set sound file path
    if let soundPath = Bundle.main.path(forResource: sound, ofType: type) {
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath))
        
        audioPlayer?.play()
        
    
        
    } catch {
        
        print("Unable to play file")
        
    }
    
}
    
}

//Play sound Synthersized sound
func readSelectedLines(line: String) {
    
    let utterance = AVSpeechUtterance(string: line)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    utterance.rate = 0.5

    
    let synthersizer = AVSpeechSynthesizer()
    synthersizer.speak(utterance)
    
}
