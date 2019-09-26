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
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        container.viewModel = ["12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323", "12fesfsefse3", "123123123", "112233", "112312312312123123123121323323"]
    }
    
    private let container: ChipContainerView = {
        let container = ChipContainerView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        return container
    }()
}

