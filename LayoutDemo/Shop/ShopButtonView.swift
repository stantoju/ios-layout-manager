//
//  ShopButtonView.swift
//  LayoutDemo
//
//  Created by Toju on 2/12/23.
//

import UIKit
import SwiftUI

class ShopButton: BaseView {
    
    var isActive = false
    
    var button: UIButton = {
       let btn = UIButton()
        btn.setTitle("Title", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 0.5
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    convenience init(title: String) {
        self.init()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(button)
        layoutManager.placeAtTopOfSuperView(button, height: 30)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        if isActive {
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = .zero
        } else {
            button.setTitleColor(.white, for: .normal)
            button.layer.borderColor = UIColor.white.cgColor
            button.backgroundColor = .clear
            button.layer.borderWidth = 2
        }
        isActive.toggle()
    }
    

}

// MARK: - Canvas Previews with SwiftUI
struct ShopButton_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            ShopButton()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
