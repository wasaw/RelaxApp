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
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.config(with: self)
    }
    
}

//  MARK: - CompletedViewProtocol

extension CompletedViewController: CompletedViewProtocol {
    
}
