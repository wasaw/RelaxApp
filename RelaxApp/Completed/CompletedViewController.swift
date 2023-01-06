//
//  CompletedViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

import UIKit

protocol CompletedViewProtocol: AnyObject {
    var presenter: CompletedPresenterProtocol? { get set }
}

final class CompletedViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: CompletedPresenterProtocol?
    let configurator: CompletedConfiguratorProtocol = CompletedConfigurator()
    
    var tableView: UITableView?
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.config(with: self)
        configUI()
    }
    
//    MARK: - Helpers
    
    private func configUI() {
        tableView = UITableView(frame: .zero)
        guard let tableView = tableView else { return }
        tableView.register(CompletedCell.self, forCellReuseIdentifier: CompletedCell.identifire)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.anchor(left: view.leftAnchor, top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
        tableView.backgroundColor = .background
    }
    
}

//  MARK: - CompletedViewProtocol

extension CompletedViewController: CompletedViewProtocol {
    
}

//  MARK: - UITableViewDelegate

extension CompletedViewController: UITableViewDelegate {
    
}

//  MARK: - UITableViewDataSource

extension CompletedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CompletedCell.identifire) as? CompletedCell else { return UITableViewCell() }
        
        return cell
    }
}
