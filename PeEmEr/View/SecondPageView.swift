//
//  SecondPageView.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 04/05/21.
//

import UIKit
protocol changeVC {
    func gantiVC()
}

class secondPageView: UIView{
    
    @IBOutlet weak var pmrLabel: UILabel!
    @IBOutlet weak var pmrDesc: UILabel!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var circleBackground: UIImageView!
    
    var seconds = 2.0
    var delegate: changeVC?
    
    func setup(delegate: changeVC){
        pmrDesc.alpha = 0
        pmrLabel.alpha = 0
        buttonPlay.alpha = 0
        transitionIn()
        self.delegate = delegate
    }
    
    
    func transitionIn(){
        
        UIView.animate(withDuration: 2) {
            self.pmrDesc.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + self.seconds){
                UIView.animate(withDuration: 2) {
                    self.pmrLabel.alpha = 1
                    self.buttonPlay.alpha = 1
                    self.buttonPlay.layer.cornerRadius = 0.5 * self.buttonPlay.bounds.size.width
                }
                
            }
            
        }
        
    }
    
    
    @IBAction func playbuttonPressed(_ sender: UIButton) {
        
        delegate?.gantiVC()
        
    }
    
}
