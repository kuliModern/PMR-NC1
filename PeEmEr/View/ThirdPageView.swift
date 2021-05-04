//
//  ThirdPageView.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 04/05/21.
//

import UIKit
import AVFoundation

protocol closeButtonDelegate {
    func closeButton()
    func buttonPressed()
}

class ThirdPageView: UIView{
    
    
    @IBOutlet weak var buttonStop: UIButton!
    @IBOutlet weak var biruMudaAtas: UIImageView!
    @IBOutlet weak var biruTengah: UIImageView!
    @IBOutlet weak var biruTuaPalingBawah: UIImageView!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var progressAudio: UIProgressView!
    
    var delegate: closeButtonDelegate?
    var player: AVAudioPlayer?
    var timer: Timer?
    
    func setup(delegate: closeButtonDelegate){
        buttonStop.layer.cornerRadius = 0.5 * buttonStop.bounds.size.width
        
        self.delegate = delegate
    }
    
    func animateWave(){
        
        let options: UIView.AnimationOptions = [
            .curveEaseInOut,
            .repeat,
            .autoreverse
        ]
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: options) {
            self.biruTuaPalingBawah.frame = CGRect(x: -114, y: 400, width: 619, height: 619)
            self.biruTengah.frame = CGRect(x: -114, y: 220, width: 619, height: 619)
            self.biruMudaAtas.frame = CGRect(x: -114, y: 20, width: 619, height: 619)
        }
        
    }
    
    func voiceOver(){
        
        //Set Up Playernya, trus di play
        if let player = player, player.isPlaying{
            player.pause()
            buttonStop.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else{
            buttonStop.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            guard let soundPath = Bundle.main.url(forResource: "VoiceOver", withExtension: "m4a")
            else {return print("File gak ketemu")}
            
            do {
                // Configure and activate the AVAudioSession
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                
                player = try AVAudioPlayer(contentsOf: soundPath, fileTypeHint: AVFileType.m4a.rawValue)
                // Play a sound
                guard let player = player else {return}
                
                player.play()
                
                var updater = CADisplayLink(target: self, selector: #selector(self.updateProgress))
                updater.preferredFramesPerSecond = 1
                updater.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
                
                
                endLabel(fromPlayer: player)
                
                
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func updateProgress(){
        
        let normalizedTime = Float(self.player?.currentTime as! Double / (self.player?.duration as! Double) )
        progressAudio.progress = normalizedTime
        
    }
    
    func endLabel(fromPlayer player: AVAudioPlayer){
        
        let duration = player.duration
        let secondsText = Int(duration) % Int(60)
        let minutesText = Int(duration / 60)
        
        endLabel.text = "\(minutesText):\(secondsText)"
        
        
    }
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        
        delegate?.closeButton()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.buttonPressed()
        
    }
}
