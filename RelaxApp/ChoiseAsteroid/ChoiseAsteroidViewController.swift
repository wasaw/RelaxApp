//
//  ChoiseAsteroidViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 16.12.2022.
//

import UIKit

protocol ChoiseAsteroidViewProtocol: AnyObject {
    var presenter: ChoiseAsteroidPresenterProtocol? { get set }
    func setAsteroidInformation(asteroid: [Asteroid])
    func setDate(_ days: [Days])
}

final class ChoiseAsteroidViewController: UIViewController {
    
//    MARK: - Properties
    var presenter: ChoiseAsteroidPresenterProtocol?
    let configurator: ChoiseAsteroidConfiguratorProtocol = ChoiseAsteroidConfigurator()
    
    private var daysCollectionView: UICollectionView?
    private var asteroidsCollectionView: UICollectionView?
    private var asteroid: [Asteroid] = []
    private var days: [Days] = []
    private let user: Credentials
    private var directSort = true
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        return spinner
    }()
    private let sortImage = UIImage(named: "swap")
    private let sortButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(handleSortButton), for: .touchUpInside)
        return btn
    }()
        
//    MARK: - Lifecycle
    
    init(presenter: ChoiseAsteroidPresenterProtocol? = nil, collectionView: UICollectionView? = nil, user: Credentials) {
        self.presenter = presenter
        self.asteroidsCollectionView = collectionView
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        configureUI()
        presenter?.getDate()
        view.backgroundColor = .background
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        configureDaysCollection()
        configureSortView()
        configureAsteroidsCollection()
        configureSpinner()
//        configureGuesture()
    }
    
    private func configureDaysCollection() {
        let dayLayout = UICollectionViewFlowLayout()
        dayLayout.scrollDirection = .horizontal
        daysCollectionView = UICollectionView(frame: .zero, collectionViewLayout: dayLayout)
        guard let collectionView = daysCollectionView else { return }
        collectionView.register(ChoiseAsteroidDayCell.self, forCellWithReuseIdentifier: ChoiseAsteroidDayCell.identifire)
        collectionView.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView)
        collectionView.anchor(left: view.leftAnchor, top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 5, height: 80)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .background
    }
    
    private func configureSortView() {
        view.addSubview(sortButton)
        sortButton.anchor(top: daysCollectionView?.bottomAnchor, right: view.rightAnchor, paddingTop: 5, paddingRight: -15, width: 35, height: 25)
        sortButton.setImage(sortImage, for: .normal)
    }
    
    private func configureAsteroidsCollection() {
        let asreoidLayout = UICollectionViewFlowLayout()
        asteroidsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: asreoidLayout)
        guard let collectionView = asteroidsCollectionView else { return }
        collectionView.register(ChoiseAsteroidCell.self, forCellWithReuseIdentifier: ChoiseAsteroidCell.identifire)
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        collectionView.anchor(left: view.leftAnchor, top: sortButton.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, paddingTop: 5)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .background
    }
    
    private func configureSpinner() {
        view.addSubview(spinner)
        spinner.centerX(inView: view)
        spinner.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 120)
        spinner.startAnimating()
    }
    
    private func configureGuesture() {
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        view.addGestureRecognizer(right)
    }
    
//    MARK: - Selectors
    
    @objc private func swipeRight(sender: UIPanGestureRecognizer) {
        presenter?.swipeBack()
    }
    
    @objc private func handleSortButton() {
        presenter?.sort(asteroid, direct: directSort)
        directSort = !directSort
    }
}

//  MARK: - ChoiseAsteroidViewProtocol

extension ChoiseAsteroidViewController: ChoiseAsteroidViewProtocol {
    func setAsteroidInformation(asteroid: [Asteroid]) {
        self.asteroid = []
        self.asteroid = asteroid
        spinner.stopAnimating()
        asteroidsCollectionView?.isHidden = false
        asteroidsCollectionView?.reloadData()
    }
    
    func setDate(_ days: [Days]) {
        self.days = days
        daysCollectionView?.reloadData()
    }
}

//  MARK: - UICollectionViewDelegate

extension ChoiseAsteroidViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == daysCollectionView {
            for i in 0..<days.count {
                days[i].selected = i == indexPath.item ? true : false
            }
            asteroidsCollectionView?.isHidden = true
            spinner.startAnimating()
            daysCollectionView?.reloadData()
            presenter?.loadInformation(date: days[indexPath.item].fullDate)
        } else {
            presenter?.setTravelTime(user: user, asteroid: asteroid[indexPath.item])
        }
    }
}

//  MARK: - UICollectionViewDataSource

extension ChoiseAsteroidViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == daysCollectionView {
            return 5
        }
        return asteroid.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == daysCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoiseAsteroidDayCell.identifire, for: indexPath) as? ChoiseAsteroidDayCell else { return UICollectionViewCell() }
            cell.setInformation(day: days[indexPath.row])
            return cell
        }
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
        if collectionView == daysCollectionView {
            return CGSize(width: 70, height: 80)
        }
        let width: CGFloat = view.bounds.width / 2 - 20
        return CGSize(width: width, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
