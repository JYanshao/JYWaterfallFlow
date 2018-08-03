//
//  WaterfallFlowCell.swift
//  JYWaterfallFlow
//
//  Created by anan on 2018/7/7.
//  Copyright © 2018年 anshao. All rights reserved.
//

import UIKit

class WaterfallFlowCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = 5
        self.contentView.layer.masksToBounds = true
        
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 50, width: self.frame.size.width - 20, height: 30)
        label.text = "sdflafkd"
        label.textColor = UIColor.red
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
