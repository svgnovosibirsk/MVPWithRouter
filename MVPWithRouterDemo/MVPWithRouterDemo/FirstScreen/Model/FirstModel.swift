//
//  FirstModel.swift
//  MVPWithRouterDemo
//
//  Created by Sergey on 16.07.2023.
//

import Foundation

protocol FirstModelProtocol {
    func getData() -> String
    func setData(data: String)
}

final class FirstModel {
    private var someData: String?
}

extension FirstModel: FirstModelProtocol {
    func getData() -> String {
        guard let someData = self.someData else { return "" }
        return someData
    }
    
    func setData(data: String) {
        self.someData = data
    }
}
