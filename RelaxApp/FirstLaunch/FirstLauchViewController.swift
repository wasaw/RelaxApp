//
//  FirstLauchController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 24.12.2022.
//

import UIKit

protocol FirstLauchViewProtocol: AnyObject {
    var presenter: FirstLaunchPresenterProtocol? { get set }
}

final class FirstLauchViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: FirstLaunchPresenterProtocol?
    var configurator: FirstLauchConfiguratorProtocol = FirstLauchConfigurator()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        view.backgroundColor = .yellow
    }
}

//  MARK: - FirstLauchViewProtocol

extension FirstLauchViewController: FirstLauchViewProtocol {

}
