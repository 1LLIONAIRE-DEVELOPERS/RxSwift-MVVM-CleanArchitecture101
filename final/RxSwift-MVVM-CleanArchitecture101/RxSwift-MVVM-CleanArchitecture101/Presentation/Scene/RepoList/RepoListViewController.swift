//
//  ViewController.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Lee Seung-Jae on 2022/05/13.
//

import UIKit
import RxSwift
import RxRelay

class RepoListViewController: UIViewController {
    var viewModel = RepoListViewModel(useCase: RepoListUseCase(repoItemRepository: DefaultRepoItemRepository(service: URLSessionService())))
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
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(nibName, forCellReuseIdentifier: String(describing: TableViewCell.self))
    }

    private func configureSubviews() {

    }

    private func configureSearchController() {

    }

    private func binding() {
        let searchQuery = BehaviorRelay<String>(value: "")
        self.searchController.searchBar.rx.text.orEmpty
            .subscribe(onNext: { str in
                if str != "" {
                    searchQuery.accept(str)
                }
            }).disposed(by: self.disposeBag)
        
        let input = RepoListViewModel.Input(
            viewWillAppear: self.rx.methodInvoked(#selector(UIViewController.viewWillAppear(_:)))
                .map { _ in },
            searchQuery: searchQuery,
            cellDidTap: self.tableView.rx.modelSelected(RepoItem.self).asObservable()
        )
        let output = self.viewModel.transform(input: input)
        
        output.repoItems.asDriver(onErrorJustReturn: [])
            .drive(self.tableView.rx.items(cellIdentifier: String(describing: TableViewCell.self), cellType: TableViewCell.self)) {
                index, item, cell in
                cell.configureContent(for: item)
            }.disposed(by: self.disposeBag)
    }
}
