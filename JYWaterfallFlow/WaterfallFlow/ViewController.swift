//
//  ViewController.swift
//  JYWaterfallFlow
//
//  Created by anan on 2018/7/6.
//  Copyright © 2018年 anshao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let cellIdentifier = "JYWaterfallFlowCell"
    fileprivate let sectionHeaderIdentifier = "JYWaterfallFlowHeader"
    fileprivate let sectionFooterIdentifier = "JYWaterfallFlowFooter"
    
    fileprivate lazy var dataSource: [String] = [""]
    fileprivate lazy var recordIdentifierDict: [String: String] = [:]
    
    public var NavigationBarHeight: CGFloat {
        get {
            if UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) {
//                return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height).equalTo((UIScreen.main.currentMode?.size)!) ? CGFloat(88) : CGFloat(64)
                return (UIScreen.main.bounds.size.height == 812 ? CGFloat(88) : CGFloat(64))
            } else {
                return 64
            }
        }
    }
    public var iPhoneXBottomHeight: CGFloat {
        get {
            if UIScreen.instancesRespond(to: #selector(getter: RunLoop.currentMode)) {
//                return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height).equalTo((UIScreen.main.currentMode?.size)!) ? CGFloat(34) : CGFloat(0)
                return (UIScreen.main.bounds.size.height == 812 ? CGFloat(34) : CGFloat(0))
            } else {
                return 0
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
        
        setupUI()
    }
    
    func setupUI() {
        let layout = JYWaterfallFlowLayout()
        layout.NavigationHeight = NavigationBarHeight
        layout.iPhoneXBottomHeight = iPhoneXBottomHeight
//        layout.delegate = self
//        layout.scrollDirection = .horizontal
//        layout.isShowHeader = true
//        layout.isShowFooter = true
        // 创建 collectionView
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: NavigationBarHeight, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-NavigationBarHeight), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceVertical = false
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.register(WaterfallFlowCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(WaterfallFlowHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionHeaderIdentifier)
        collectionView.register(WaterfallFlowHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: sectionFooterIdentifier)
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 如果你的瀑布流需要变化不断高度则需要，对其cell进行标识一下，以免因为复用产生计算问题
        // 从缓存中取出对应的标识符，不存在则注册
        var identifier = recordIdentifierDict[String(format: "%@", indexPath as CVarArg)]
        if identifier == nil {
            identifier = String(format: "%@%@", cellIdentifier, String(format: "%@", indexPath as CVarArg as CVarArg))
            recordIdentifierDict.updateValue(identifier!, forKey: String(format: "%@", indexPath as CVarArg))
            
            collectionView.register(WaterfallFlowCell.classForCoder(), forCellWithReuseIdentifier: identifier!)
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? WaterfallFlowCell
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView: WaterfallFlowHeader? = nil
        if kind == UICollectionElementKindSectionHeader {
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionHeaderIdentifier, for: indexPath) as? WaterfallFlowHeader
            reusableView?.backgroundColor = UIColor.darkGray
            reusableView?.title.text = "header"
        } else if kind == UICollectionElementKindSectionFooter {
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: sectionFooterIdentifier, for: indexPath)  as? WaterfallFlowHeader
            reusableView?.backgroundColor = UIColor.white
            reusableView?.title.text = "footer"
        }
        return reusableView!
    }
}

extension ViewController: JYWaterfallFlowLayoutDelegate {
    
    // 竖向
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, heightForItemAt indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return CGFloat(100 + (arc4random() % 100))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 44)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: UIScreen.main.bounds.size.width, height: 44 + iPhoneXBottomHeight)
        }
        return CGSize(width: UIScreen.main.bounds.size.width, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    /// 横向（横向没有header、footer以及多个section）
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, heightForItemAt indexPath: IndexPath, itemHeight: CGFloat) -> CGFloat {
        return CGFloat(100 + (arc4random() % 200))
    }
}

