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
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.text = "RelaxApp"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textColor = .textColor
        return label
    }()
    private let descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.text = """
Медитативное приложение.
Данное приложение, позволяет отвлечься от терзающих мыслый,
отправив их в дальнее странствие.

Выкинуть из головы, перенеся в приложение.
"""
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .textColor
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private let dismissButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Готово", for: .normal)
        btn.setTitleColor(.textColor, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 27)
        btn.layer.borderWidth = 0.7
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .buttonBackground
        btn.addTarget(self, action: #selector(handleDismissButton), for: .touchUpInside)
        return btn
    }()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        configureUI()
        view.backgroundColor = .background
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        view.addSubview(titleLable)
        titleLable.centerX(inView: view)
        titleLable.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 15)
        
        view.addSubview(descriptionTextLabel)
        descriptionTextLabel.anchor(left: view.leftAnchor, top: titleLable.bottomAnchor, right: view.rightAnchor, paddingLeft: 15, paddingTop: 45, paddingRight: -15)
        
        view.addSubview(dismissButton)
        dismissButton.centerX(inView: view)
        dismissButton.anchor(top: descriptionTextLabel.bottomAnchor, paddingTop: 40, width: 220, height: 60)
    }
    
//    MARK: - Selectors
    
    @objc private func handleDismissButton() {
        presenter?.show()
    }
}

//  MARK: - FirstLauchViewProtocol

extension FirstLauchViewController: FirstLauchViewProtocol {

}
