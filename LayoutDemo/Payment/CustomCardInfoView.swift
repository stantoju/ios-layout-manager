//
//  CustomCardInfoView.swift
//  LayoutDemo
//
//  Created by Toju on 2/12/23.
//

import UIKit
import SwiftUI

class CustomCardInfoView: BaseView {
    
    let creditCard: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "creditcard")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let checkBox: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark.square")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let cardLabel: UILabel = {
       let label = UILabel()
        label.text = "1234567890"
        return label
    }()
    
    let divider: UIView = {
       let v = UIView()
        v.backgroundColor = .gray
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    convenience init(cardText: String) {
        self.init()
        cardLabel.text = cardText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(creditCard)
        addSubview(cardLabel)
        addSubview(checkBox)
        addSubview(divider)
        layoutManager.resizeView(creditCard, size: .init(width: 20, height: 20))
        layoutManager.resizeView(checkBox, size: .init(width: 20, height: 20))
        let tile = layoutManager.tileHorizontallyWithSpacer([creditCard,cardLabel, checkBox], spacerPlacement: .afterView(2), height: 30, spacing: 15)
        layoutManager.placeBelowAnother(divider, otherView: tile, height: 0.2)
    }
}


// MARK: - Canvas Previews with SwiftUI
struct CustomCardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            CustomCardInfoView()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
