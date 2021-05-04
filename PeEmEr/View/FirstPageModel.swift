//
//  FirstPageModel.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 03/05/21.
//

import UIKit

class FirstPageModel: UIView{
    
    @IBOutlet weak var tapToStart: UIButton!
    @IBOutlet weak var circleView: UIImageView!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var pmrLabel: UILabel!
    @IBOutlet weak var pmrDesc: UILabel!
   
    
    var seconds = 2.0
    
    
    func setup(){
        pmrDesc.alpha = 0
        pmrLabel.alpha = 0
        fadeIn(pmrLabel: pmrLabel, pmrDesc: pmrDesc)
        gradientLayer(shinyTextLabel: shimmers())
        
    }
    
    
    func fadeIn(pmrLabel: UILabel,pmrDesc: UILabel){
        UIView.animate(withDuration: 2) {
            pmrLabel.alpha = 1
            DispatchQueue.main.asyncAfter(deadline: .now() + self.seconds){
                UIView.animate(withDuration: 2) {
                    pmrDesc.alpha = 1
                }
                
            }
            
        }
    }
    
    func transitionOut(){
        UIView.animate(withDuration: 2, animations: {
            self.circleView.frame = CGRect(x: -218, y: -103, width: 824, height: 823)
        }, completion: nil)
    }
    
    func shimmers() -> UILabel{
        
        let darkLabel = UILabel()
        darkLabel.text = "Tap to Start"
        darkLabel.textColor = UIColor(white: 1, alpha: 0.3)
        darkLabel.font = UIFont.systemFont(ofSize: 28.0, weight: .thin)
        darkLabel.frame = CGRect(x: 130, y: 695, width: 130, height: 34)
        
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "Tap to Start"
        shinyTextLabel.textColor = .white
        shinyTextLabel.font = UIFont.systemFont(ofSize: 28.0, weight: .thin)
        shinyTextLabel.frame = CGRect(x: 130, y: 695, width: 130, height: 34)
        
        return shinyTextLabel
        
    }
    
    func gradientLayer(shinyTextLabel: UILabel) -> UIView{
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.white.cgColor,
                                UIColor.clear.cgColor]
        gradientLayer.locations = [0,0.5,1]
        
        gradientLayer.frame = CGRect(x: 130, y: 689, width: 130, height: 100)
        gradientLayer.transform = CATransform3DMakeRotation(45, 0, 0, 1)
        
        
        let uiViewBaru = UIView()


        uiViewBaru.frame = CGRect(x: 0, y: 0, width: 130, height: 100)
        uiViewBaru.layer.addSublayer(gradientLayer)


        uiViewBaru.mask = shinyTextLabel
        
        let animate = CABasicAnimation(keyPath: "transform.translation.x")
        
        animate.fromValue = -shinyTextLabel.frame.width
        animate.duration = 2
        animate.toValue = shinyTextLabel.frame.width
        animate.repeatCount = Float.infinity
        
        gradientLayer.add(animate, forKey: "somekey")
        return uiViewBaru
    }
    
        
        
    }
    
   
    
    

