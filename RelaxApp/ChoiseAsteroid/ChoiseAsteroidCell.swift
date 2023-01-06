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
        label.font = UIFont(name: "Josefin Sans", size: 19)
        label.textColor = .textColor
        return label
    }()
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
        
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        addSubview(titleLabel)
        titleLabel.centerX(inView: self)
        titleLabel.anchor(top: topAnchor, paddingTop: 5)
        
        addSubview(asteroidImageView)
        asteroidImageView.anchor(top: titleLabel.bottomAnchor, paddingTop: 15, width: 60, height: 60)
        
        addSubview(distanceLabel)
        distanceLabel.centerX(inView: self)
        distanceLabel.anchor(top: asteroidImageView.bottomAnchor, paddingTop: 25)
        
        layer.cornerRadius = 15
        layer.borderWidth = 0.7
        layer.borderColor = UIColor.white.cgColor
    }
    
    private func setBackgroud(_ distanse: Double) -> UIColor {
        if distanse > 55000000 {
            return UIColor.asteroidCellThird
        }
        if distanse > 15000000 {
            return UIColor.asteroidCellSecond
        }
        return UIColor.asteroidCellFirst
    }
    
    func setInformation(_ asteroid: Asteroid) {
        titleLabel.text = asteroid.name
        distanceLabel.text = String(format: "%.0f", asteroid.distance) + " км"
        backgroundColor = setBackgroud(asteroid.distance)
    }
}
