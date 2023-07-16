//
//  FirstPresenter.swift
//  MVPWithRouterDemo
//
//  Created by Sergey on 16.07.2023.
//

import Foundation

protocol FirstPresenterProtocol {
    func loadView(controller: FirstViewController, view: FirstViewProtocol)
}

final class FirstPresenter {
    private let model: FirstModelProtocol
    private let router: Router
    private weak var controller: FirstViewController?
    private weak var view: FirstViewProtocol?

    struct Dependencies {
        let model: FirstModelProtocol
        let router: Router
    }

    init(dependencies: Dependencies) {
        self.model = dependencies.model
        self.router = dependencies.router
    }
}


private extension FirstPresenter {
    private func onTouched() {
        guard let view = view else { return }

        let modelData = view.getTextFieldData()
        self.model.setData(data: modelData)

        let viewModel = "The data: " + self.model.getData()
        self.view?.update(data: viewModel)
    }
    
    private func onTouchedGoToSecondVC() {
        self.router.next()
    }

    private func setHandlers() {
        self.view?.onTouchedHandler = { [weak self] in
            self?.onTouched()
        }
        self.view?.goToSecondHandler = { [weak self] in
            self?.onTouchedGoToSecondVC()
        }
    }
}

extension FirstPresenter: FirstPresenterProtocol {
    func loadView(controller: FirstViewController, view: FirstViewProtocol) {
        self.controller = controller
        self.view = view

        self.setHandlers()
    }
}
