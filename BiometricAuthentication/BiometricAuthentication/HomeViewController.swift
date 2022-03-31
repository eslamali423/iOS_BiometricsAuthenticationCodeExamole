//
//  HomeViewController.swift
//  BiometricAuthentication
//
//  Created by Eslam Ali  on 31/03/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = .systemBlue
        
        
        let label = UILabel (frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = "This is App Home Screen"
        label.center = view.center
        label.textColor = .label
        
        
        view.addSubview(label)
        
        
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
