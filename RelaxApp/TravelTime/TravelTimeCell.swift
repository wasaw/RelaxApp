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
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .textColor
        return label
    }()
    private let anotationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .textColor
        return label
    }()
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
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "Уровень прогресса"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .textColor
        return label
    }()
    private let progressView: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .bar)
        view.tintColor = .green
        view.trackTintColor = .red
        return view
    }()
    private let dividLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
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
        nicknameLabel.centerX(inView: self)
        nicknameLabel.anchor(top: topAnchor)
        
        addSubview(anotationLabel)
        anotationLabel.anchor(left: leftAnchor, top: nicknameLabel.bottomAnchor, right: rightAnchor, paddingLeft: 40, paddingTop: 10, paddingRight: -40)
        
        addSubview(timeView)
        timeView.anchor(left: leftAnchor, top: anotationLabel.bottomAnchor, right: rightAnchor, paddingLeft: 40, paddingTop: 10,  paddingRight: -40, height: 70)

        timeView.addSubview(timeLabel)
        timeLabel.centerX(inView: timeView)
        timeLabel.centerY(inView: timeView)
        
        addSubview(progressLabel)
        progressLabel.anchor(left: timeView.leftAnchor, top: timeView.bottomAnchor, right: timeView.rightAnchor, paddingTop: 10)
        
        addSubview(progressView)
        progressView.anchor(left: timeView.leftAnchor, top: progressLabel.bottomAnchor, right: timeView.rightAnchor, paddingTop: 15, height: 4)
        
        addSubview(dividLine)
        dividLine.anchor(left: leftAnchor, top: progressView.bottomAnchor, right: rightAnchor, paddingTop: 5, height: 0.7)
    }
    
    func setInformation(for user: Credentials, with travelTime: TravelTime) {
        nicknameLabel.text = user.nickname
        anotationLabel.text = "\(user.nickname) в пути уже:"
        progressView.setProgress(travelTime.progress, animated: true)
        timeLabel.text = travelTime.hour + ":" + travelTime.minute
    }
}
