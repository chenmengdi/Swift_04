//
//  ViewController.swift
//  Swift_04
//
//  Created by 陈孟迪 on 2017/11/24.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit

var WIDTH = UIScreen.main.bounds.width
var HEIGHT = UIScreen.main.bounds.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    func createUI()  {
      
        self.view.backgroundColor = UIColor.purple
        let scrollView = MyCollectionView.init(frame: CGRect.init(x: 0, y: 100, width: WIDTH, height: HEIGHT*2/3))
        self.view.addSubview(scrollView)
        
    }

    
    
}

