//
//  TextDataSource.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 10/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import Foundation
import UIKit
import iCarousel

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class TextDataSource : GenericDataSource<TextModel>, iCarouselDataSource {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return data.value.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
    
        let pageView = Bundle.main.loadNibNamed("PageView", owner: self, options: nil)![0] as! PageView
        pageView.frame.size.height = 400.0
        pageView.frame.size.width = 300.0
        pageView.textModel = self.data.value[index]
        pageView.totalCount = self.data.value.count
        return pageView
    }
}

