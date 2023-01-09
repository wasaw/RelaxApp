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
        label.textColor = .white
        return label
    }()
    private let asteroidNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
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
        
        addSubview(asteroidNameLabel)
        asteroidNameLabel.centerX(inView: self)
        asteroidNameLabel.anchor(bottom: bottomAnchor, paddingBottom: -15)
        asteroidNameLabel.isHidden = true

        layer.borderWidth = 0.3
        backgroundColor = .background
    }
    
    func show() {
        asteroidNameLabel.isHidden = false
    }
    
    func hide() {
        asteroidNameLabel.isHidden = true
    }
    
    func setInformation(value: Delivered) {
        asteroidNameLabel.text = value.name
        nicknameLabel.text = value.nickname
    }
}
