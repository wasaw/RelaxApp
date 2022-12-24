//
//  HomeViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 15.12.2022.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func launchView(_ isFirst: Bool)
}

final class HomeViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: HomePresenterProtocol?
    let configurator: HomeConfiguratorProtocol = HomeConfigurator()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Придумайте ник персонажа"
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private let nicknameTextField = UITextField().homeTextField(withPlaceholder: "Любой никнейм")
    private let nicknameLine: UIView = {
        let view = UIView()
        view.anchor(height: 0.7)
        view.backgroundColor = .gray
        return view
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание, почему возникло такое желание"
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    private let descriptionTextField = UITextField().homeTextField(withPlaceholder: "Внесите описание")
    private let descriptionLine: UIView = {
        let view = UIView()
        view.anchor(height: 0.7)
        view.backgroundColor = .gray
        return view
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отправить в полет", for: .normal)
        button.setTitleColor(.textColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        button.layer.cornerRadius = 5
        button.backgroundColor = .buttonBackground
        button.addTarget(self, action: #selector(handleSubmitButton), for: .touchUpInside)
        return button
    }()
        
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter?.isFirstLaunch()
        view.backgroundColor = .background
    }
    
//    MARK: - Helpers
    
    func launchView(_ isFirst: Bool) {
//        if isFirst {
//
//        } else {
//            configureUI()
//        }
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(nicknameLabel)
        nicknameLabel.anchor(left: view.leftAnchor, top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingLeft: 10, paddingTop: 40, paddingRight: -10)
        view.addSubview(nicknameTextField)
        nicknameTextField.anchor(left: view.leftAnchor, top: nicknameLabel.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingTop: 15, paddingRight: -10)
        view.addSubview(nicknameLine)
        nicknameLine.anchor(left: view.leftAnchor, top: nicknameTextField.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingTop: 5, paddingRight: -10)
        
        view.addSubview(descriptionLabel)
        descriptionLabel.anchor(left: view.leftAnchor, top: nicknameLine.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingTop: 45, paddingRight: -10)
        view.addSubview(descriptionTextField)
        descriptionTextField.anchor(left: view.leftAnchor, top: descriptionLabel.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingTop: 15, paddingRight: -10)
        view.addSubview(descriptionLine)
        descriptionLine.anchor(left: view.leftAnchor, top: descriptionTextField.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingTop: 5, paddingRight: -10)
        
        view.addSubview(submitButton)
        submitButton.anchor(left: view.leftAnchor, top: descriptionLine.bottomAnchor, right: view.rightAnchor, paddingLeft: 10, paddingTop: 55, paddingRight: -10, height: 60)
    }
    
//    MARK: - Selectors
    
    @objc private func handleSubmitButton() {
        guard let nickname = nicknameTextField.text else { return }
        guard let describe = descriptionTextField.text else { return }
        presenter?.sendToFlight(nickname: nickname, describe: describe)
    }
}

//  MARK: - Extensions

extension HomeViewController: HomeViewProtocol {
    
}
