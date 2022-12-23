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
    
    private let asteroidImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "asteroid")
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        return label
    }()
    private let distanceLabel: UILabel = {
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
        addSubview(asteroidImageView)
        asteroidImageView.anchor(left: leftAnchor, top: topAnchor, right: rightAnchor, height: 110)
        
        addSubview(titleLabel)
        titleLabel.centerX(inView: self)
        titleLabel.anchor(top: asteroidImageView.bottomAnchor, paddingTop: 15)
        
        addSubview(distanceLabel)
        distanceLabel.centerX(inView: self)
        distanceLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 10)
        
        layer.cornerRadius = 15
        layer.borderWidth = 0.7
    }
    
    func setInformation(_ asteroid: Asteroid) {
        titleLabel.text = asteroid.name
        distanceLabel.text = String(asteroid.distance) + " км"
    }
}
