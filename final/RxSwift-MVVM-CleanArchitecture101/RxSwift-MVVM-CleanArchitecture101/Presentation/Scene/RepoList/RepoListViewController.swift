//
//  ViewController.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Lee Seung-Jae on 2022/05/13.
//

import UIKit
import RxSwift

class RepoListViewController: UIViewController {
    var viewModel: RepoListViewModel?
    private let disposeBag = DisposeBag()
    private lazy var searchController:  UISearchController = {
        let controller = UISearchController()
        controller.hidesNavigationBarDuringPresentation = true
        controller.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search GitHub"
        )

        return controller
    }()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureController()
        self.configureSubviews()
        self.binding()
    }

    private func configureController() {
        self.navigationController?.navigationBar.topItem?.title = "Repositories"
        self.navigationItem.searchController = self.searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureSubviews() {

    }

    private func configureSearchController() {

    }

    private func binding() {
        //TODO: Binding 
    }
}
