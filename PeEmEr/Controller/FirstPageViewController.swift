//
//  FirstPageViewController.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 03/05/21.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    @IBOutlet var firstPage: FirstPageModel!
    
    var uiViewBaru: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        firstPage.setup()
        uiViewBaru = firstPage.gradientLayer(shinyTextLabel: firstPage.shimmers())
        view.addSubview(uiViewBaru!)
    }
    
   
    
    @IBAction func tapToStart(_ sender: UIButton) {
        
        uiViewBaru?.removeFromSuperview()
        
        firstPage.transitionOut { (success) -> Void in
            self.performSegue(withIdentifier: "secondVC", sender: self)
        }
    }
}



