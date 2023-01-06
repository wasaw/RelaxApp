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
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .textColor
        return label
    }()
    private let contentBlockView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .travelCellBackground
        return view
    }()
    private let distanceImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "location")
        iv.anchor(width: 30, height: 30)
        return iv
    }()
    private let distanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = .textColor
        return label
    }()
    private let distanceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Километров"
        label.textColor = .lightGray
        return label
    }()
    private let timeImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "clock")
        iv.anchor(width: 30, height: 30)
        return iv
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = .textColor
        return label
    }()
    private let timeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Часов"
        label.textColor = .lightGray
        return label
    }()
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    private let progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.tintColor = .darkBlue
        view.trackTintColor = .gray
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
       
        addSubview(nicknameLabel)
        nicknameLabel.anchor(left: leftAnchor, top: topAnchor, paddingLeft: 40, paddingTop: 10)
        
        addSubview(contentBlockView)
        contentBlockView.anchor(left: leftAnchor, top: nicknameLabel.bottomAnchor, right: rightAnchor,  paddingLeft: 40, paddingTop: 15, paddingRight: -40, height: 140)
                
        let distanceStack = UIStackView(arrangedSubviews: [distanceImage, distanceLabel, distanceDescriptionLabel])
        distanceStack.axis = .vertical
        distanceStack.alignment = .leading
        distanceStack.anchor(width: 100)
        
        let timeStack = UIStackView(arrangedSubviews: [timeImage, timeLabel, timeDescriptionLabel])
        timeStack.axis = .vertical
        timeStack.alignment = .leading
        timeStack.anchor(width: 100)
        
        let contentStack = UIStackView(arrangedSubviews: [distanceStack, timeStack])
        contentStack.axis = .horizontal
        contentStack.distribution = .equalSpacing
        contentBlockView.addSubview(contentStack)
        contentStack.anchor(left: contentBlockView.leftAnchor, top: contentBlockView.topAnchor, right: contentBlockView.rightAnchor, paddingLeft: 20, paddingTop: 20, paddingRight: -10, height: 100)
        
        addSubview(progressLabel)
        progressLabel.anchor(left: contentBlockView.leftAnchor, top: contentBlockView.bottomAnchor, paddingLeft: 20, paddingTop: 10)
        addSubview(progressView)
        progressView.anchor(left: contentBlockView.leftAnchor, top: progressLabel.bottomAnchor, right: contentBlockView.rightAnchor, paddingTop: 5, height: 4)
    }
    
    func setInformation(for user: Credentials, with travelTime: TravelTime) {
        nicknameLabel.text = user.nickname
        progressView.setProgress(travelTime.progress, animated: true)
        timeLabel.text = travelTime.hour + ":" + travelTime.minute
        distanceLabel.text = travelTime.distance
        progressLabel.text = travelTime.progressString + " % завершено"
    }
}
