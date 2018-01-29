//
//  MyCollectionViewCell.swift
//  Swift_04
//
//  Created by 陈孟迪 on 2017/11/24.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    var myImageView : UIImageView!
    var titleLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI()  {
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        myImageView = UIImageView()
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        self.addSubview(myImageView)
        self.addSubview(titleLabel)
        self.backgroundColor = UIColor.white
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.myImageView.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height-30)
        
        self.titleLabel.frame = CGRect.init(x: 0, y: self.myImageView.frame.size.height, width: self.frame.size.width, height: 30)
        
    }
}
