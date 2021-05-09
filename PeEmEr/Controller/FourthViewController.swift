//
//  FourthViewController.swift
//  PeEmEr
//
//  Created by Azka Kusuma on 05/05/21.
//

import UIKit

class FourthViewController: UIViewController, fourthViewDelegate {

    @IBOutlet var fourthView: FourthPageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fourthView.setup(delegate: self)
       
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fourthView.animateIn()
    }
    
    
    func backToHome(){
        performSegue(withIdentifier: "backToMain", sender: self)
       
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
