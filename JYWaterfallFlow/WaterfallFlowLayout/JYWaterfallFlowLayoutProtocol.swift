//
//  JYWaterfallFlowLayoutProtocol.swift
//  JYWaterfallFlow
//
//  Created by anan on 2018/7/10.
//  Copyright © 2018年 anshao. All rights reserved.
//

import Foundation
import UIKit

@objc protocol JYWaterfallFlowLayoutDelegate: NSObjectProtocol {
    // item 的 size (宽高转换：WaterfallFlowVertical根据宽算高，WaterfallFlowHorizontal根据高算宽)
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, sizeForItemAt idnexPath: IndexPath) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, heightForItemAt indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, heightForItemAt indexPath: IndexPath, itemHeight: CGFloat) -> CGFloat
    
    // header/footer 的 size（仅限竖向滑动时使用）
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, referenceSizeForFooterInSection section:Int) -> CGSize
    
    // 每个 section 的内边距
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    // 每个 section 下显示的 item 有多少列，返回每个 section 下的 item 的列数
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, columnNumberAt section:Int) -> Int
    // 每个 section 下显示的 item 的最小行间距
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    // 每个 section 下显示的 item 的最小列间距
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    // 本 section 的头部和上个 section 的尾部的间距
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: JYWaterfallFlowLayout, spacingWithPreviousSectionForSectionAt section: Int) -> CGFloat
}
