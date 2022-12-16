//
//  HomeViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

class HomeViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: HomePresenterProtocol?
    let configurator: HomeConfiguratorProtocol = HomeConfigurator()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
    }
}

//  MARK: - Extensions

extension HomeViewController: HomeViewProtocol {
    
}
