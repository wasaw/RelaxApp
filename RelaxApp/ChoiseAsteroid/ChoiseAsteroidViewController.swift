//
//  ChoiseAsteroidViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

import UIKit

protocol ChoiseAsteroidViewProtocol: AnyObject {
    var presenter: ChoiseAsteroidPresenterProtocol? { get set }
}

class ChoiseAsteroidViewController: UIViewController {
    
//    MARK: - Properties
    var presenter: ChoiseAsteroidPresenterProtocol?
    let configurator: ChoiseAsteroidConfiguratorProtocol = ChoiseAsteroidConfigurator()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
    }
}

//  MARK: - Extensions

extension ChoiseAsteroidViewController: ChoiseAsteroidViewProtocol {  
}
