//
//  ChoiseAsteroidViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

import UIKit

protocol ChoiseAsteroidViewProtocol: AnyObject {
    var presenter: ChoiseAsteroidPresenterProtocol? { get set }
    func getAsteroidInformation(asteroid: [Asteroid])
}

final class ChoiseAsteroidViewController: UIViewController {
    
//    MARK: - Properties
    var presenter: ChoiseAsteroidPresenterProtocol?
    let configurator: ChoiseAsteroidConfiguratorProtocol = ChoiseAsteroidConfigurator()
    
    private var collectionView: UICollectionView?
    private var asteroid: [Asteroid] = []
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        configureUI()
        view.backgroundColor = .background
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(ChoiseAsteroidCell.self, forCellWithReuseIdentifier: ChoiseAsteroidCell.identifire)
        view.addSubview(collectionView)
        collectionView.anchor(left: view.leftAnchor, top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .background
    }
}

//  MARK: - ChoiseAsteroidViewProtocol

extension ChoiseAsteroidViewController: ChoiseAsteroidViewProtocol {
    func getAsteroidInformation(asteroid: [Asteroid]) {
        self.asteroid = asteroid
        collectionView?.reloadData()
    }
}

//  MARK: - UICollectionViewDelegate

extension ChoiseAsteroidViewController: UICollectionViewDelegate {
    
}

//  MARK: - UICollectionViewDataSource

extension ChoiseAsteroidViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asteroid.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoiseAsteroidCell.identifire, for: indexPath) as? ChoiseAsteroidCell else { return UICollectionViewCell() }
        if !asteroid.isEmpty {
            cell.setInformation(asteroid[indexPath.item])
        }
        return cell
    }
}

//  MARK: - UICollectionViewFlowLayout

extension ChoiseAsteroidViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
