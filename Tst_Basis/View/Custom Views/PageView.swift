//
//  PageView.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 10/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import UIKit

class PageView: UIView {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDisplayText: UILabel!
    
    var totalCount:Int? {
        willSet{
            
        }
    }
    var textModel:TextModel? {
        didSet{
            guard let textModel = textModel else {
                return
            }
            lblTitle.text = "\(textModel.id) is out of \(totalCount ?? 0)"
            lblDisplayText.text = "\(textModel.textData)"
        }
    }
    
    
    
}
