//
//  ChoiseDayCell.swift
//  RelaxApp
//
//  Created by Александр Меренков on 25.12.2022.
//

import UIKit

final class ChoiseAsteroidDayCell: UICollectionViewCell {
    static let identifire = "choiseDayIdentifire"
    
//    MARK: - Properties
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
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
        addSubview(dateLabel)
        dateLabel.centerX(inView: self)
        dateLabel.centerY(inView: self)
        layer.cornerRadius = 15
    }
    
    func setInformation(day: Days) {
        backgroundColor = .darkBlue
        dateLabel.text = String(day.day)
        if day.selected {
            backgroundColor = .selectedCell
        }
    }
}
