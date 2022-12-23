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
    
    private var asteroids: [Asteroid] = []
    private var travelTime: [TravelTime] = []
    private var collectionView: UICollectionView?
    
//    MARK: - Lifecycle
    
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
        collectionView.anchor(left: view.leftAnchor, top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
        collectionView.backgroundColor = .background
    }
}

//  MARK: - TravelTimeProtocol

extension TravelTimeViewController: TravelTimeViewProtocol {
    func presentLocalInformation(asteroids: [Asteroid], travelTime: [TravelTime]) {
        self.asteroids = asteroids
        self.travelTime = travelTime
        collectionView?.reloadData()
    }
}

//  MARK: - UICollectionViewDelegate

extension TravelTimeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}

//  MARK: - UICollectionViewDataSource

extension TravelTimeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asteroids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TravelTimeCell.identifire, for: indexPath) as? TravelTimeCell else { return UICollectionViewCell() }
        cell.setInformation(travelTime[indexPath.row])
        return cell
    }
}

//  MARK: - UICollectionViewFlowLayout

extension TravelTimeViewController: UICollectionViewDelegateFlowLayout {

}
