//
//  TravelTimeViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 18.12.2022.
//

import UIKit

protocol TravelTimeViewProtocol: AnyObject {
    var presenter: TravelTimePresenterProtocol? { get set }
    func presentLocalInformation(asteroids: [Asteroid], travelTime: [TravelTime])
}

final class TravelTimeViewController: UIViewController {
    
//    MARK: - Properties
    var presenter: TravelTimePresenterProtocol?
    let configurator: TravelTimeConfiguratorProtocol = TravelTimeConfigurator()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        return spinner
    }()
    
    private var users: [Credentials] = []
    private var travelTime: [TravelTime] = []
    private var collectionView: UICollectionView?
    
//    MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.updateInformation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.config(with: self)
        configureUI()

        view.backgroundColor = .background
    }
    
//    MARK: - Helpers
    
    private func configureUI () {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(TravelTimeCell.self, forCellWithReuseIdentifier: TravelTimeCell.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.anchor(left: view.leftAnchor, top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, paddingBottom: -110)
        collectionView.backgroundColor = .background
        
        view.addSubview(spinner)
        spinner.centerX(inView: view)
        spinner.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 120)
        spinner.startAnimating()
    }
}

//  MARK: - TravelTimeProtocol

extension TravelTimeViewController: TravelTimeViewProtocol {
    func presentLocalInformation(asteroids: [Asteroid], travelTime: [TravelTime]) {
        users = []
        for item in asteroids {
            guard let user = item.user else { return }
            users.append(user)
        }
        self.travelTime = travelTime
        spinner.stopAnimating()
        collectionView?.reloadData()
    }
}

//  MARK: - UICollectionViewDelegate

extension TravelTimeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 220)
    }
}

//  MARK: - UICollectionViewDataSource

extension TravelTimeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelTimeCell.identifire, for: indexPath) as? TravelTimeCell else { return UICollectionViewCell() }
        cell.setInformation(for: users[indexPath.row], with: travelTime[indexPath.row])
        return cell
    }
}

//  MARK: - UICollectionViewFlowLayout

extension TravelTimeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}
