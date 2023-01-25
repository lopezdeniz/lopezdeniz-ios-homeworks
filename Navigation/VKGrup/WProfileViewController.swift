//
//  WProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 15.01.2023.
//

import UIKit

final class ProfileDetailsViewController: UIViewController, UITableViewDataSource {
    
    public var cellIndex = 0
    public var depth = true

    private let tableView = UITableView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(close))
        tableView.dataSource = self
    }

    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell()
        cell.config(cellIndex, depth)
        return cell
    }
}

