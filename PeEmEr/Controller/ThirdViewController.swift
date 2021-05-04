//
//  ThirdViewController.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 04/05/21.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController, closeButtonDelegate {
    
    @IBOutlet var thirdModel: ThirdPageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        thirdModel.setup(delegate: self)
       
        thirdModel.voiceOver()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        thirdModel.animateWave()
    }
    
    func closeButton() {
        dismiss(animated: true, completion: nil)
        
    }
    
    func buttonPressed() {
        thirdModel.voiceOver()
        
        

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
