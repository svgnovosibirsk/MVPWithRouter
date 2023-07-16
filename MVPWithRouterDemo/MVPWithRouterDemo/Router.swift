//
//  Router.swift
//  MVPWithRouterDemo
//
//  Created by Sergey on 16.07.2023.
//

import UIKit

final class Router {
    private var controller: UIViewController?
    private var targertController: UIViewController?
    
    func setRootController(controller: UIViewController) {
        self.controller = controller
    }
    
    func setTargerController(controller: UIViewController) {
        self.targertController = controller
    }
    
    func next() {
        guard let targertController = self.targertController else {
            return
        }
        
        self.controller?.navigationController?.pushViewController(targertController, animated: true)
    }

}
