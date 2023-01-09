//
//  CompletedCell.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

import UIKit

final class CompletedCell: UITableViewCell {
    static let identifire = "tableCell"
    
//    MARK: - Properties
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .textColor
        return label
    }()
    private let asteroidNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .textColor
        return label
    }()
    private let optionalView: UIView = {
        let view = UIView()
        return view
    }()
    private let describeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Причина"
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .textColor
        return label
    }()
    private let describeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .textColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
//    MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        addSubview(nicknameLabel)
        nicknameLabel.anchor(left: leftAnchor, top: topAnchor, paddingLeft: 20, paddingTop: 15)
        
        addSubview(optionalView)
        optionalView.anchor(left: leftAnchor, top: nicknameLabel.bottomAnchor, right: rightAnchor, paddingTop: 10, height: 120)
        
        optionalView.addSubview(asteroidNameLabel)
        asteroidNameLabel.centerX(inView: optionalView)
        asteroidNameLabel.anchor(top: optionalView.topAnchor)
        
        optionalView.addSubview(describeTitleLabel)
        describeTitleLabel.anchor(left: optionalView.leftAnchor, top: asteroidNameLabel.topAnchor, paddingLeft: 20, paddingTop: 25)
        
        optionalView.addSubview(describeLabel)
        describeLabel.centerX(inView: optionalView)
        describeLabel.anchor(left: optionalView.leftAnchor, top: describeTitleLabel.bottomAnchor, right: optionalView.rightAnchor, paddingLeft: 40, paddingTop: 10, paddingRight: -40)
        
        optionalView.isHidden = true

        layer.borderWidth = 0.3
        backgroundColor = .background
    }
    
    func show() {
        optionalView.isHidden = false
    }
    
    func hide() {
        optionalView.isHidden = true
    }
    
    func setInformation(value: Delivered) {
        asteroidNameLabel.text = "Астероид " + value.name
        nicknameLabel.text = value.nickname
        describeLabel.text = value.describe
    }
}
