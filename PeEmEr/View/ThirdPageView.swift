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
    func moveVC()
}

class ThirdPageView: UIView, AVAudioPlayerDelegate{
    
    
    @IBOutlet weak var buttonStop: UIButton!
    @IBOutlet weak var biruMudaAtas: UIImageView!
    @IBOutlet weak var biruTengah: UIImageView!
    @IBOutlet weak var biruTuaPalingBawah: UIImageView!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var progressAudio: UIProgressView!
    @IBOutlet weak var textDuration: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var biruBawahVCBaru: UIImageView!
    @IBOutlet weak var pmrLabel: UILabel!
    
    
    var delegate: closeButtonDelegate?
    var player: AVAudioPlayer?
    var timer: Timer?
    
    func setup(delegate: closeButtonDelegate){
        
        self.delegate = delegate
        player?.delegate = self
        
        buttonStop.layer.cornerRadius = 0.5 * buttonStop.bounds.size.width
        backgroundImage.alpha = 0
        
       
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
            
            if let progress = player?.currentTime{
                progressAudio.progress = Float(progress)
            }
            
            player?.play()
            buttonStop.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            
        }
    }
    
    
    func audioController(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
        
        
        
        guard let soundPath = Bundle.main.url(forResource: "VoiceOver", withExtension: "m4a")
        else {return print("File gak ketemu")}
        
        do {
            // Configure and activate the AVAudioSession
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            player = try AVAudioPlayer(contentsOf: soundPath, fileTypeHint: AVFileType.m4a.rawValue)
            // Play a sound
            
            player?.play()
            endLabel(fromPlayer: player!)
            
            
            var updater = CADisplayLink(target: self, selector: #selector(self.updateProgress))
            updater.preferredFramesPerSecond = 30
            updater.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
            
            
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func animateOut(completion: @escaping(_ success: Bool ) -> Void){
        UIView.animate(withDuration: 3, animations: {
            self.biruTuaPalingBawah.frame = CGRect(x: -114, y: -590, width: 619, height: 619)
            self.biruTengah.frame = CGRect(x: -114, y: -590, width: 619, height: 619)
            self.biruMudaAtas.frame = CGRect(x: -114, y: -590, width: 619, height: 619)
            self.biruBawahVCBaru.frame = CGRect(x: -183, y: 248, width: 756, height: 756)
            
            self.backgroundImage.alpha = 1
            self.pmrLabel.alpha = 0
            
        }, completion: completion)
       
        
        
        
    }
    
    func endLabel(fromPlayer player: AVAudioPlayer){
        
        let duration = player.duration
        let secondsText = Int(duration) % Int(60)
        let minutesText = Int(duration / 60)
        
        endLabel.text = "\(minutesText):\(secondsText)"
        
        
    }
    
    @objc func updateCounting(){
        
        let currentTime1 = Int((player?.currentTime)!)
        let minutes = currentTime1/60
        let seconds = currentTime1 - minutes * 60
        textDuration.text = NSString(format: "%02d:%02d", minutes,seconds) as String
        
    }
    
    
    @objc func updateProgress(){
        
        let normalizedTime = Float(self.player?.currentTime as! Double / (self.player?.duration as! Double) )
        progressAudio.progress = normalizedTime
        
        
    }
    

    
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        
        delegate?.closeButton()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.buttonPressed()
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        print("KELAR BOSSS")
        animateOut { (success) in
            self.delegate?.moveVC()
        }
        
        buttonStop.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
}

