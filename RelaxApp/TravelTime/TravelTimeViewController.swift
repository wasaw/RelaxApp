//
//  TravelTimeViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

import UIKit

protocol TravelTimeViewProtocol: AnyObject {
    var presenter: TravelTimePresenterProtocol? { get set }
}

final class TravelTimeViewController: UIViewController {
    
//    MARK: - Properties
    var presenter: TravelTimePresenterProtocol?
    let configurator: TravelTimeConfiguratorProtocol = TravelTimeConfigurator()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.config(with: self)
    }
}

//  MARK: - TravelTimeProtocol

extension TravelTimeViewController: TravelTimeViewProtocol {
    
}
