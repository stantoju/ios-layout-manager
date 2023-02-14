//
//  ShopVC.swift
//  LayoutDemo
//
//  Created by Toju on 2/12/23.
//

import UIKit
import SwiftUI

class ShopVC: BaseVC {
    
    let button1 = ShopButton(title: "fruits")
    let button2 = ShopButton(title: "vegetables")
    let button3 = ShopButton(title: "berries")
    let button4 = ShopButton(title: "nuts")
    let foodTable: UITableView = {
        let tv = UITableView()
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationController()
        setupView()
        foodTable.delegate = self
        foodTable.dataSource = self
        foodTable.register(CartCell.self, forCellReuseIdentifier: CartCell.identifier)
    }
    
    private func setUpNavigationController(){
        navigationItem.title = "Shop"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(systemItem: .search),
            UIBarButtonItem(systemItem: .camera),
            UIBarButtonItem(systemItem: .bookmarks)
        ]
    }
    
    func setupView() {
        let container = UIView()
        container.backgroundColor = .orange
        view.addSubview(container)
        layoutManger.placeAtTopOfSuperView(container, height: 50)
        container.addSubview(button1)
        container.addSubview(button2)
        container.addSubview(button3)
        container.addSubview(button4)
        layoutManger.tileHorizontally([button1, button2, button3, button4], padding: .init(top: 10, left: 5, bottom: 5, right: 5), height: 70, spacing: 5)
        
        view.addSubview(foodTable)
        layoutManger.fillVerticalSpaceBelowAnother(foodTable, otherView: container, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        
    }
}

// MARK: UITableViewDelegate
extension ShopVC:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: UITableViewDataSource
extension ShopVC:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as! CartCell
        return cell
    }
    
}

// MARK: - Canvas Previews with SwiftUI
struct ShopVC_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            ShopVC()
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context)  {
        }
        typealias UIViewControllerType = UIViewController
    }
}
