//
//  FirstPageViewController.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 03/05/21.
//

import UIKit

class FirstPageViewController: UIViewController {

    
    let shimmer = FirstPageModel()
    
    @IBOutlet weak var pmrLabel: UILabel!
    @IBOutlet weak var pmrDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pmrLabel.alpha = 0.2
        pmrDesc.alpha = 0
        shimmers()
        fadeIn()
        // Do any additional setup after loading the view.
    }
    
    func fadeIn(){
        UIView.animate(withDuration: 2) {
            self.pmrLabel.alpha = 1
            self.pmrDesc.alpha = 1
        }
    }
    
    func animate(gradient: CAGradientLayer, textName: UILabel){
        
        gradient.transform = CATransform3DMakeRotation(45, 0, 0, 1)
        
        
        let animate = CABasicAnimation(keyPath: "transform.translation.x")
        
        animate.fromValue = -view.frame.width
        animate.toValue = view.frame.width
        animate.repeatCount = Float.infinity
        
        gradient.add(animate, forKey: "somekey")
        
    }
    
    func shimmers(){
        
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
        
        view.addSubview(shinyTextLabel)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor,
                                UIColor.white.cgColor,
                                UIColor.black.cgColor]
        gradientLayer.locations = [0,0.5,1]
        
        gradientLayer.frame = CGRect(x: 130, y: 689, width: 130, height: 100)
        //gradientLayer.transform = CATransform3DMakeRotation(45, 0, 0, 1)
        
       
        view.layer.addSublayer(gradientLayer)
        view.bringSubviewToFront(shinyTextLabel)
        
        
        shinyTextLabel.layer.mask = gradientLayer
        
        
        
        let animate = CABasicAnimation(keyPath: "transform.translation.x")
        
        animate.fromValue = -shinyTextLabel.frame.width
        animate.duration = 2
        animate.toValue = shinyTextLabel.frame.width
        animate.repeatCount = Float.infinity
        
        gradientLayer.add(animate, forKey: "somekey")
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
