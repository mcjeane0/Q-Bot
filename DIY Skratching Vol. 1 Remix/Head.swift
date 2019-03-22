//
//  Head.swift
//  DIY Skratching Vol. 1 Remix
//
//  Created by Arjun Iyer on 3/18/19.
//  Copyright © 2019 Jeane Limited Liability Corporation. All rights reserved.
//

import Foundation
import UIKit
import Repeat
typealias Head = QBot

extension Head : FaceDelegate {
    
    func playPause(){
        if queuePlayer.rate > 0.0 {
            queuePlayer.pause()
            infinitePeriodicTimer.pause()
            face.playPause.setTitle("Play", for: UIControl.State.normal)
        }
        else {
            queuePlayer.play()
            infinitePeriodicTimer.reset(nil)
            infinitePeriodicTimer.start()
            achieveDesiredTempo()
            face.playPause.setTitle("Pause", for: UIControl.State.normal)
        }
    }
    
    func handlePlayPauseButtonTapped() {
        playPause()
    }
    
    func handleTempoButtonTapped(bpm: Float, period:Int) {
        desiredTempo = bpm
        achieveDesiredTempo()
        infinitePeriodicTimer.reset(Repeater.Interval.nanoseconds(4*period))
        
    }
    
    func handlePhraseButtonTapped(count: Int) {
        desiredPhrase = count
    }
    
    
}
