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

    func setDataToView(textModel:TextModel,totalCount:Int) {
        lblTitle.text = "\(textModel.id) is out of \(totalCount)"
        lblDisplayText.text = "\(textModel.textData)"
    }
    
    
}
