//
//  PostViewController.swift
//  Navigation
//
//  Created by MacBook Air on 10.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Posts"
        
        
        view.backgroundColor = UIColor.cyan
        
        title = post?.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(press))
    }
    
    @objc func press() { present(InfoViewController(), animated: true) }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
