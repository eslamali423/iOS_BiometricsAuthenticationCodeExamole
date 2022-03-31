//
//  ViewController.swift
//  BiometricAuthentication
//
//  Created by Eslam Ali  on 31/03/2022.
//


import LocalAuthentication
import UIKit


// Don't Forget to add Face ID usege Description in Info.plist
class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        
        
        
    }
    // Setup Button
    func  configureButton()  {
        let AuthButton = UIButton (frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        AuthButton.setTitle("Authorize", for: .normal)
        AuthButton.center = view.center
        AuthButton.backgroundColor = .systemBlue
        AuthButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(AuthButton)
    }
    
    
    
    @objc func didTapButton() {
      // LA for LocalAuthentication
        let context = LAContext()
        
        // check if the device has the Biometrics Authentication or not (touch id, face id)
        // older devices don't have face id and authenticat with pass cede
       
        // &error -> because this method still written in objective c
        var error  :  NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // evaluate policy
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please Authorize with Face ID ") {  [ weak self ] success, error in
                //put it in the main thread
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        return
                        
                    }
                   
                    // success to match Face ID
                    // show app home screen
                    let vc = HomeViewController()
                    self?.present(vc, animated: true, completion: nil)
                }
            }
           
            
            
            
            
        } else {
            // can't use
            // if the face id doesn't Enrolled
            
            let alert = UIAlertController(title: "Unavailable", message: "you cant use this feature", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            
        }
        
        
        
    }
    
    
}

