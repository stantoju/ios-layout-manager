//
//  HomeVC.swift
//  LayoutDemo
//
//  Created by Toju on 1/11/23.
//

import Foundation
import UIKit
import SwiftUI


class PaymentVC: BaseVC {
    
    var containerView = UIView()
    
    var card: UIView = {
       let v = UIView()
        v.layer.cornerRadius = 20
        v.backgroundColor = .yellow
        return v
    }()
    
    var ctaButton: UIButton = {
       let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setTitle("Send Payment", for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    let plusIcon: UIImageView = {
        let imageView = UIImageView()
         imageView.image = UIImage(systemName: "plus.circle.fill")
         imageView.contentMode = .scaleAspectFit
         return imageView
    }()
    
    let addCardLabel: UILabel = {
       let label = UILabel()
        label.text = "Add new Card"
        return label
    }()
    
    let divider: UIView = {
       let v = UIView()
        v.backgroundColor = .gray
        return v
    }()
    
    var subCard1 = CustomCardInfoView(cardText: "QWERTYUIOP")
    var subCard2 = CustomCardInfoView(cardText: "ASDFGHJKL")
    var subCard3 = CustomCardInfoView(cardText: "ZXCVBNM")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
        setupView()
    }
    
    private func setupView(){
        view.addSubview(containerView)
        layoutManger.fillSuperView(containerView)
        containerView.addSubview(card)
        containerView.addSubview(ctaButton)
        card.addSubview(subCard1)
        card.addSubview(subCard2)
        card.addSubview(subCard3)
        subCard3.backgroundColor = .red
        card.addSubview(plusIcon)
        card.addSubview(addCardLabel)


        let addCardView = layoutManger.tileHorizontallyWithSpacer([plusIcon, addCardLabel], spacerPlacement: .afterView(2), height: 60, spacing: 20)
        
        layoutManger.tileVertically([subCard1,subCard2,subCard3, addCardView], padding: .init(top: 10, left: 10, bottom: 10, right: 10), height: 190, spacing: 5)
        layoutManger.placeAtTopOfSuperView(card, padding: .init(top: 10, left: 10, bottom: 10, right: 10), height: 200)
        layoutManger.placeAtBottomOfSuperView(ctaButton, padding: .init(top: 0, left: 20, bottom: 0, right: 20), height: 50)
    }
    
    private func setUpNavigationController(){
        navigationItem.title = "Payment"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Canvas Previews with SwiftUI
struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            PaymentVC()
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context)  {
        }
        typealias UIViewControllerType = UIViewController
    }
}



