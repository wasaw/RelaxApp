//
//  CompletedViewController.swift
//  RelaxApp
//
//  Created by Александр Меренков on 06.01.2023.
//

import UIKit

protocol CompletedViewProtocol: AnyObject {
    var presenter: CompletedPresenterProtocol? { get set }
    func setInformation(_ information: [Delivered])
    func visibleTitle()
    func presentAlert(title: String, message: String)
}

final class CompletedViewController: UIViewController {
    
//    MARK: - Properties
    
    var presenter: CompletedPresenterProtocol?
    let configurator: CompletedConfiguratorProtocol = CompletedConfigurator()
    
    private var tableView: UITableView?
    private weak var lastCell: CompletedCell?
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "У вас пока нет завершенных заданий"
        label.font = UIFont.systemFont(ofSize: 19)
        label.textColor = .white
        return label
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        return spinner
    }()
    
    private var selectedCellId: Int?
    var information: [Delivered] = []
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.config(with: self)
        configureUI()
        presenter?.checkInformation()
    }
    
//    MARK: - Helpers
    
    private func configureUI() {
        tableView = UITableView(frame: .zero)
        guard let tableView = tableView else { return }
        tableView.register(CompletedCell.self, forCellReuseIdentifier: CompletedCell.identifire)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.anchor(left: view.leftAnchor, top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .background
        tableView.isHidden = true
        
        view.addSubview(titleLabel)
        titleLabel.centerX(inView: view)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 25)
        view.backgroundColor = .background
        
        view.addSubview(spinner)
        spinner.centerX(inView: view)
        spinner.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 120)
        spinner.startAnimating()
    }
}

//  MARK: - CompletedViewProtocol

extension CompletedViewController: CompletedViewProtocol {
    func setInformation(_ information: [Delivered]) {
        self.information = information
        if !information.isEmpty {
            tableView?.isHidden = false
            titleLabel.isHidden = true
        }
        spinner.stopAnimating()
        tableView?.reloadData()
    }
    
    func visibleTitle() {
        titleLabel.isHidden = false
    }
    
    func presentAlert(title: String, message: String) {
        alert(with: title, and: message)
    }
}

//  MARK: - UITableViewDelegate

extension CompletedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CompletedCell
        lastCell?.hide()
        let view = UIView()
        view.backgroundColor = .selectedCompletedCell
        cell?.selectedBackgroundView = view
        selectedCellId = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
        cell?.show()
        lastCell = cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCellId == indexPath.row {
            return 170.0
        }
        return 52.0
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          presenter?.deleteSelectedItem(nickname: information[indexPath.row].nickname)
          information.remove(at: indexPath.row)
          lastCell = nil
          presenter?.isEmpty(information)
          tableView.deleteRows(at: [indexPath], with: .fade)
      }
    }
}

//  MARK: - UITableViewDataSource

extension CompletedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CompletedCell.identifire) as? CompletedCell else { return UITableViewCell() }
        cell.setInformation(value: information[indexPath.row])
        return cell
    }
}
