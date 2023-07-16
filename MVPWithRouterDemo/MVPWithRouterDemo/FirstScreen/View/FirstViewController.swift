//
//  FirstViewController.swift
//  MVPWithRouterDemo
//
//  Created by Sergey on 16.07.2023.
//

import UIKit

protocol FirstViewControllerProtocol: AnyObject {
    
}

class FirstViewController: UIViewController {
    
    private var firstView: FirstViewProtocol!
    private var firstPresenter: FirstPresenterProtocol!

    struct Dependencies {
        let presenter: FirstPresenterProtocol
    }

    init(dependencies: Dependencies) {
        self.firstView = FirstView(frame: UIScreen.main.bounds)
        self.firstPresenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        super.loadView()
        self.firstPresenter.loadView(controller: self, view: self.firstView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.view.addSubview(firstView)
    }

}

extension FirstViewController: FirstViewControllerProtocol {

}


