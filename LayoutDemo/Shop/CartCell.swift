//
//  CartCell.swift
//  LayoutDemo
//
//  Created by Toju on 2/12/23.
//

import UIKit
import SwiftUI

class CartCell: BaseTableViewCell {
    
    static let identifier = "\(CartCell.self)"
    
    let image: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "basket")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let productInfo = ProductInfo()
    let counterLke = CounterLike()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(image)
        addSubview(productInfo)
        addSubview(counterLke)
        layoutManager.resizeView(image, size: .init(width: 80, height: 80))
        
        layoutManager.tileHorizontallyWithSpacer([image, productInfo, counterLke], spacerPlacement: .beforeView(3), height: 80, spacing: 15, padding: .init(top: 0, left: 10, bottom: 0, right: 10))
    }
}


class ProductInfo: BaseView {
    
    let productLabel: UILabel = {
       let label = UILabel()
        label.text = "Mango"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let countryLabel: UILabel = {
       let label = UILabel()
        label.text = "Canada"
        label.font = .systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    let amountLabel: UILabel = {
       let label = UILabel()
        label.text = "$5000"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let weightLabel: UILabel = {
       let label = UILabel()
        label.text = "12kg"
        label.font = .systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(productLabel)
        addSubview(countryLabel)
        let tile = layoutManager.tileVerticallyWithSpacer([productLabel, countryLabel], spacerPlacement: .afterView(2), height: 50)
    
        addSubview(weightLabel)
        addSubview(amountLabel)
        let tile2 = layoutManager.tileHorizontallyWithSpacer([weightLabel, amountLabel], spacerPlacement: .afterView(2), height: 50, spacing: 5)
        
        layoutManager.tileVertically([tile,tile2], height: 80)
    }
    

}



class CounterLike: BaseView {
    
    private var amount = 1
    private var liked = false
    
    let plus: UIButton = {
       let btn = UIButton()
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return btn
    }()
    
    let minus: UIButton = {
        let btn = UIButton()
         btn.setTitle("-", for: .normal)
        btn.setTitleColor(.black, for: .normal)
         btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
         return btn
     }()
    
    let value: UILabel = {
       let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let like: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
         return btn
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(plus)
        addSubview(value)
        addSubview(minus)
        let tile = layoutManager.tileHorizontally([minus, value, plus], height: 40)
        tile.layer.cornerRadius = 20
        tile.layer.borderColor = UIColor.gray.cgColor
        tile.layer.borderWidth = 1
        addSubview(like)
        layoutManager.tileVertically([like, tile], height: 80)
        
        like.addTarget(self, action: #selector(doLike), for: .touchUpInside)
        plus.addTarget(self, action: #selector(increase), for: .touchUpInside)
        minus.addTarget(self, action: #selector(decrease), for: .touchUpInside)
    }
    
    @objc private func doLike(){
        if liked {
            like.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            like.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        liked.toggle()
    }

    @objc private func increase(){
        amount += 1
        value.text = "\(amount)"
    }
    @objc private func decrease(){
        if amount > 0 {
            amount -= 1
            value.text = "\(amount)"
        }
    }
}


// MARK: - Canvas Previews with SwiftUI
struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    struct Container: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            CartCell()
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {}
        
        typealias UIViewType = UIView
        
    }
}
