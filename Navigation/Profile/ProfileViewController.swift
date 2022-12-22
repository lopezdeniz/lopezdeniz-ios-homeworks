//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 15.12.2022.
//


import UIKit

final class ProfileViewController: UIViewController {

    let postIdentifier = "post"

    private lazy var tableView: UITableView = {
        $0.backgroundColor = .systemGray5
        $0.dataSource = self
        $0.delegate = self
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: postIdentifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView(frame: .zero, style: .grouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: postIdentifier, for: indexPath) as? PostTableViewCell else { fatalError() }
        cell.config(post: posts[indexPath.row])
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        ProfileHeaderView()
    }
}
