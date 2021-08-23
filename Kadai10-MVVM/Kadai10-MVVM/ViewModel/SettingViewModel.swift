//
//  SettingViewModel.swift
//  Kadai10-MVVM
//
//  Created by 今村京平 on 2021/08/23.
//

import Foundation
import RxSwift
import RxRelay
import RxDataSources

protocol ViewModelInput {
    func setup()
}

protocol ViewModelOutput {
    var items: Observable<[SettingSectionModel]> { get }
}

protocol ViewModelType {
    var inputs: ViewModelInput { get }
    var outputs: ViewModelOutput { get }
}

final class SettingViewModel: ViewModelInput, ViewModelOutput {

    private let itemsRelay = PublishRelay<[SettingSectionModel]>()

    var items: Observable<[SettingSectionModel]> {
        itemsRelay.asObservable()
    }

    func setup() {
        update()
    }

    private func update() {
        let sections: [SettingSectionModel] = [
            prefecturSection()
        ]
        itemsRelay.accept(sections)
    }

    private func prefecturSection() -> SettingSectionModel {
        let items: [PrefectureItems] = PrefectureItems.allCases
        return SettingSectionModel(model: .prefecture, items: items)
    }
}

extension SettingViewModel: ViewModelType {
    var inputs: ViewModelInput {
        return self
    }

    var outputs: ViewModelOutput {
        return self
    }
}
