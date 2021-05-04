//
//  FirstPageViewController.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 03/05/21.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    @IBOutlet var firstPage: FirstPageModel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstPage.setup()
        view.addSubview(firstPage.gradientLayer(shinyTextLabel: firstPage.shimmers()))
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapToStart(_ sender: UIButton) {
        firstPage.transitionOut()
       // performSegue(withIdentifier: "secondVC", sender: self)
        
    }
    
}
