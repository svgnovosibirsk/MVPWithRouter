//
//  FirstView.swift
//  MVPWithRouterDemo
//
//  Created by Sergey on 16.07.2023.
//

import UIKit

//MARK: Protocol definition

protocol FirstViewProtocol: UIView {
    var onTouchedHandler: (() -> Void)? { get set }
    var goToSecondHandler: (() -> Void)? { get set }

    func update(data: String)
    func getTextFieldData() -> String
}

//MARK: Class definition

final class FirstView: UIView {
    var onTouchedHandler: (() -> Void)?
    var goToSecondHandler: (() -> Void)?

    private lazy var button: UIButton = {
        let obj = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        obj.backgroundColor = .white
        obj.setTitleColor(.darkGray, for: .normal)
        obj.layer.cornerRadius = 10
        obj.layer.borderWidth = 5
        obj.layer.borderColor = UIColor.orange.cgColor
        obj.setTitle("Push me", for: .normal)
        obj.addTarget(self, action: #selector(self.touchedDown), for: .touchDown)
        return obj
    }()
    
    private lazy var button2: UIButton = {
        let obj = UIButton(frame: CGRect(x: 100, y: 400, width: 200, height: 50))
        obj.backgroundColor = .white
        obj.setTitleColor(.darkGray, for: .normal)
        obj.layer.cornerRadius = 10
        obj.layer.borderWidth = 5
        obj.layer.borderColor = UIColor.orange.cgColor
        obj.setTitle("Go to second", for: .normal)
        obj.addTarget(self, action: #selector(self.touchedDownGoToSecond), for: .touchDown)
        return obj
    }()

    private lazy var textField: UITextField = {
        let obj = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        obj.backgroundColor = .systemGray6
        obj.placeholder = "Type something cool"
        return obj
    }()

    private lazy var label: UILabel = {
        let obj = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        obj.backgroundColor = .systemGray6
        return obj
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configView()
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private extension

private extension FirstView {
    
    private func configView() {
        self.addSubview(self.button)
        self.addSubview(self.button2)
        self.addSubview(self.label)
        self.addSubview(self.textField)
    }

    @objc private func touchedDown() {
        self.onTouchedHandler?()
    }
    
    @objc private func touchedDownGoToSecond() {
        self.goToSecondHandler?()
    }
}

// MARK: IMyCustomView

extension FirstView: FirstViewProtocol {
    
    func getTextFieldData() -> String {
        guard let text = self.textField.text else { return  "" }
        return text
    }

    func update(data: String) {
        self.label.text = data
    }
}
