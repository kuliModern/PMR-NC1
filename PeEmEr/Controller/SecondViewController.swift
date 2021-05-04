//
//  SecondViewController.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 04/05/21.
//

import UIKit

class SecondViewController: UIViewController, changeVC {
    
 
    @IBOutlet var secondView: secondPageView!
    
    var delegate: changeVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        secondView.setup(delegate: self)
    }
    
    func gantiVC() {
        performSegue(withIdentifier: "secondToThird", sender: self)
    }
    
}
