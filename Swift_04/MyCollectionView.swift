//
//  MyCollectionView.swift
//  Swift_04
//
//  Created by 陈孟迪 on 2017/11/24.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit

class MyCollectionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var collectionView : UICollectionView!
    var layout : UICollectionViewFlowLayout!
    var pageControl : UIPageControl!
    
    //懒加载
    lazy var dataSourceArray: NSMutableArray = {
        
        let array = NSMutableArray.init()
        
        return array
    }()
    
    //显示的每个cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MyCollectionViewCell
        cell.myImageView.image = UIImage.init(named:(self.dataSourceArray[indexPath.row] as? String)!)
        cell.titleLabel.text = self.dataSourceArray[indexPath.row] as? String
        cell.tag = indexPath.item
        return cell
    }
    
    //一组有多少个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    //定义每一个cell的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.frame.size.width-40, height: self.frame.size.height-20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let array:NSArray = ["第一张","第二张","第三张","第四张","第五张","第六张"]
        self.dataSourceArray = (array.mutableCopy() as? NSMutableArray)!
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI()  {
        layout = UICollectionViewFlowLayout.init()
        
        //设置每个item的大小
        layout.itemSize = CGSize.init(width: self.frame.size.width-40, height: self.frame.size.height-20)
        
        //设置行与行之间的间距的最小距离
        layout.minimumLineSpacing = 20
        
        //设置列与列之间的最小距离
        layout.minimumInteritemSpacing = 20
        
        //设置布局方向
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height),collectionViewLayout: self.layout)
        self.addSubview(collectionView)
        collectionView.isPagingEnabled = true
        collectionView.contentSize = CGSize.init(width: self.frame.size.width-20, height: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.purple
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        pageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: self.frame.size.height-30, width: WIDTH/2, height: 30))
        pageControl.center = CGPoint.init(x: WIDTH/2, y: HEIGHT/2)
        pageControl.numberOfPages = self.dataSourceArray.count
        self.addSubview(pageControl)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let page = (Int(scrollView.contentOffset.x) / Int(WIDTH)) % self.dataSourceArray.count
        pageControl.currentPage = page
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        
    }

}
