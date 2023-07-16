//
//  FirstScreenAssembley.swift
//  MVPWithRouterDemo
//
//  Created by Sergey on 16.07.2023.
//

import UIKit

final class FirstScreenAssembley {
    static func build() -> UIViewController {
        let model = FirstModel()
        let router = Router()

        let presenter = FirstPresenter(
            dependencies: .init(model: model, router: router)
        )
        
        let controller = FirstViewController(
            dependencies: .init(presenter: presenter)
        )
        
        let targetController = SecondScreenAssembley.build()

        router.setRootController(controller: controller)
        router.setTargerController(controller: targetController)

        return controller
    }
    
}
