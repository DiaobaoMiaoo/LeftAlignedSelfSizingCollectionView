//
//  ViewController.swift
//  FilterVCTest
//
//  Created by KE MA on 2019-09-26.
//  Copyright © 2019 KE MA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
            button.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        container.viewModel = viewModel
        container.onHeightChanged = { [weak self] height in
            self?.containerHeightConstraint.constant = height
        }
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc
    func tapped() {
        viewModel.append(contentsOf: ["12fesfsefse312312312311223311231231231212312312312132332312fesfsefse3"])
        container.viewModel = viewModel
    }
    

    @IBOutlet weak var container: ChipContainerView!
    @IBOutlet weak var containerHeightConstraint: NSLayoutConstraint!
    
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Add more"
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

