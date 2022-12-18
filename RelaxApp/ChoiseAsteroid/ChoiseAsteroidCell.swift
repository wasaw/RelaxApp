//
//  ChoiseAsteroidCell.swift
//  RelaxApp
//
//  Created by Александр Меренков on 17.12.2022.
//

import UIKit

final class ChoiseAsteroidCell: UICollectionViewCell {
    static let identifire = "choiceAsteroidCell"
    
//    MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        return label
    }()
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        addSubview(titleLabel)
        titleLabel.centerX(inView: self)
        titleLabel.anchor(top: topAnchor, paddingTop: 5)
    }
    
    func setInformation(_ asteroid: Asteroid) {
        titleLabel.text = asteroid.name
    }
}
