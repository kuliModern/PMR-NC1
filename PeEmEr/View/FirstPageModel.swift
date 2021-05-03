//
//  FirstPageModel.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 03/05/21.
//

import UIKit

class FirstPageModel: UIView{
    
    @IBOutlet weak var tapToStart: UIButton!
    
    
    func shimmerEffect() -> UILabel{
        
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "Tap to Start"
        shinyTextLabel.textColor = .white
        shinyTextLabel.font = UIFont.systemFont(ofSize: 28.0, weight: .thin)
        shinyTextLabel.frame = CGRect(x: 130, y: 695, width: 130, height: 34)
        
        
        
        return shinyTextLabel
        
    }
    
    func gradient() -> CAGradientLayer{
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor,
                                UIColor.white.cgColor,
                                UIColor.black.cgColor]
        gradientLayer.locations = [0,0.5,1]
        
        gradientLayer.frame = CGRect(x: 130, y: 695, width: 100, height: 100)
        
        
        return gradientLayer
        
        
    }

    
}
