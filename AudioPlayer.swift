//
//  AudioPlayer.swift
//  Win95UI-DemoApp
//
//  A simple audio player using AVFoundation for playing .wav / .mp3 assets
//

import AVFoundation
import SwiftUI

class AudioPlayer {
    static let shared = AudioPlayer()
    private var player: AVAudioPlayer?

    func playSound(_ fileName: String, ext: String = "wav") {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: ext) else {
            print("Audio file not found:", fileName, ext)
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Audio Player Error:", error.localizedDescription)
        }
    }
}