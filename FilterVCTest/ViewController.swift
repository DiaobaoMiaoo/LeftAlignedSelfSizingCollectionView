//
//  ViewController.swift
//  FilterVCTest
//
//  Created by KE MA on 2019-09-26.
//  Copyright © 2019 KE MA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(container)
        view.addSubview(label)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20.0),
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
        container.viewModel = ["12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323"]
    }
    
    private let container: ChipContainerView = {
        let container = ChipContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return container
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "123123123"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

