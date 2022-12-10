//
//  InfoViewController.swift
//  Navigation
//
//  Created by MacBook Air on 10.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        title = "Info"
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 0.1 * button.bounds.size.width
        button.setTitle("See alert", for: .normal)
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func press() {
        
        let alert = UIAlertController(title: "Atantion Alert!",  message: "Please clouse modal window!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default   ) { _ in print("Ok"); self.dismiss(animated: true)})
        
        alert.addAction(UIAlertAction(title: "No", style: .destructive) { _ in NSLog("The \"No\" alert occured.") })
        
        present(alert, animated: true, completion: nil)
        
    }
}

   
