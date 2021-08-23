//
//  ViewController.swift
//  Kadai10-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import UIKit
import RxSwift
import RxDataSources

class ViewController: UIViewController {

    @IBOutlet private weak var prefectureTableView: UITableView!

    private let disposeBag = DisposeBag()
    private let viewModel: ViewModelType = SettingViewModel()

    private lazy var dataSource =
        RxTableViewSectionedReloadDataSource<SettingSectionModel>(
            configureCell: configureCell)

    private lazy var configureCell:
        RxTableViewSectionedReloadDataSource<SettingSectionModel>.ConfigureCell =
        { [weak self] (dataSource, tableView, indexPath, _) in
            let item = dataSource[indexPath]
            let cellColor: [UIColor] = [.red, .green, .blue]
            switch item {
            default:
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: PrefectureTableViewCell.identifier,
                    for: indexPath
                ) as! PrefectureTableViewCell
                let title = item.title
                let detail = "\(indexPath.row + 1)番目の都道府県です。"
                cell.configure(title: title, detail: detail)
                cell.backgroundColor = cellColor[indexPath.row % 3]
                return cell
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBinding()
    }

    private func setupTableView() {
        prefectureTableView.register(
            PrefectureTableViewCell.nib,
            forCellReuseIdentifier: PrefectureTableViewCell.identifier
        )
        prefectureTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }

    private func setupBinding() {
        viewModel.outputs.items
            .bind(to: prefectureTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        viewModel.inputs.setup()
    }
}

extension ViewController: UITableViewDelegate {

}

