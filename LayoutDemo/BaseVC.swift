//
//  BaseVC.swift
//  LayoutDemo
//
//  Created by Toju on 2/11/23.
//

import UIKit

class BaseVC: UIViewController {
    
    var layoutManger: ALManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutManger = ALManager()

        // Do any additional setup after loading the view.
    }
}



class BaseView: UIView {
    
    var layoutManager: ALManager!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutManager = ALManager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class BaseTableViewCell: UITableViewCell {
    
    var layoutManager: ALManager!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutManager = ALManager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
