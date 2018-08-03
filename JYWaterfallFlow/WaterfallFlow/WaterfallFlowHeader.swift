//
//  WaterfallFlowHeader.swift
//  JYWaterfallFlow
//
//  Created by anan on 2018/7/7.
//  Copyright © 2018年 anshao. All rights reserved.
//

import UIKit

class WaterfallFlowHeader: UICollectionReusableView {

    let title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.green
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(title)
        title.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
