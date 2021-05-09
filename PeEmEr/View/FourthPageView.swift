//
//  FourthPageView.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 05/05/21.
//

import UIKit

protocol fourthViewDelegate {
    func backToHome()
}

class FourthPageView: UIView{
    
    @IBOutlet weak var circleView: UIImageView!
    @IBOutlet weak var pmrLabel: UILabel!
    @IBOutlet weak var pmrDesc: UILabel!
    @IBOutlet weak var tapToHome: UIButton!
    @IBOutlet weak var cirlceBawahHome: UIImageView!
    
    var delegate: fourthViewDelegate?
    
    
    func setup(delegate: fourthViewDelegate){
        
        self.delegate = delegate
        pmrLabel.alpha = 0
        pmrDesc.alpha = 0
        tapToHome.alpha = 0
        
    }
    
    func animateIn(){
        UIView.animate(withDuration: 2) {
            self.pmrLabel.alpha = 1
            self.pmrDesc.alpha = 1
            self.tapToHome.alpha = 1
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 1){
            self.pmrLabel.alpha = 0
            self.pmrDesc.alpha = 0
            self.tapToHome.alpha = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                UIView.animate(withDuration: 3) {
                    self.circleView.frame = CGRect(x: -183, y: -700, width: 756, height: 756)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
                        UIView.animate(withDuration: 3) {
                            self.cirlceBawahHome.frame = CGRect(x: -183, y: 248, width: 756, height: 756)
                        } completion: { (success) in
                            self.delegate?.backToHome()
                        }

                        
                    }
                }
                
                
                
                
            }
        }
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        animateOut()
        
    }
    
}
