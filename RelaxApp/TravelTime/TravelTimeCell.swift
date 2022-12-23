//
//  TravelTimeCell.swift
//  RelaxApp
//
//  Created by Александр Меренков on 22.12.2022.
//

import UIKit

final class TravelTimeCell: UICollectionViewCell {
    static let identifire = "travelCell"
    
//    MARK: - Properties
    
    private let timeView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.7
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    private let progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.tintColor = .green
        view.trackTintColor = .red
        return view
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
        addSubview(timeView)
        timeView.anchor(left: leftAnchor, top: topAnchor, right: rightAnchor, paddingLeft: 40, paddingTop: 10,  paddingRight: -40, height: 70)

        
        timeView.addSubview(timeLabel)
        timeLabel.centerX(inView: timeView)
        timeLabel.centerY(inView: timeView)
        
        addSubview(progressView)
        progressView.anchor(left: timeView.leftAnchor, top: timeView.bottomAnchor, right: timeView.rightAnchor, paddingTop: 15, height: 4)
    }
    
    func setInformation(_ travelTime: TravelTime) {
        progressView.setProgress(travelTime.progress, animated: true)
        timeLabel.text = travelTime.hour + ":" + travelTime.minute
    }
}
