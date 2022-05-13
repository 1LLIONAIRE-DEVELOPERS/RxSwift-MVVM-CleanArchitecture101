//
//  ViewController.swift
//  RxSwift-MVVM-CleanArchitecture101
//
//  Created by Lee Seung-Jae on 2022/05/13.
//

import UIKit
import RxSwift

class RepoListViewController: UIViewController {
    private var viewModel = RepoListViewModel()
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureController()
        self.configureSubviews()
        self.binding()
    }

    private func configureController() {

    }

    private func configureSubviews() {

    }

    private func binding() {

    }
}
