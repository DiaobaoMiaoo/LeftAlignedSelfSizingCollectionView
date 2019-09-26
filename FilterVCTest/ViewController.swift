//
//  ViewController.swift
//  FilterVCTest
//
//  Created by KE MA on 2019-09-26.
//  Copyright © 2019 KE MA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = ["12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(container)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
            button.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        container.viewModel = viewModel
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc
    func tapped() {
        viewModel += ["12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323"]
        container.viewModel = viewModel
    }
    
    private let container: ChipContainerView = {
        let container = ChipContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Add more"
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

