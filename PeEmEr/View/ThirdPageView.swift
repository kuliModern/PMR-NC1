//
//  ThirdPageView.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 04/05/21.
//

import UIKit

protocol closeButtonDelegate {
    func closeButton()
    func buttonPressed()
}

class ThirdPageView: UIView{
    
  
    @IBOutlet weak var buttonStop: UIButton!
    @IBOutlet weak var biruMudaAtas: UIImageView!
    @IBOutlet weak var biruTengah: UIImageView!
    @IBOutlet weak var biruTuaPalingBawah: UIImageView!
    
    var delegate: closeButtonDelegate?
    
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
    
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        
        delegate?.closeButton()
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.buttonPressed()
        
    }
    
}
