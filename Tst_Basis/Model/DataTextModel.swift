//
//  DataTextModel.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 10/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import Foundation

struct DataTextModel {
    var dataArray:[TextModel]

    init(dataArray:[TextModel]) {
        self.dataArray = dataArray
    }
}

extension DataTextModel : Parcelable {
    
    static func parseObject(dictionary: [String : AnyObject]) -> Result<DataTextModel, ErrorResult> {
        if let responseArray = dictionary["data"] as? [[String:String]] {
            
            var finalTextModelArray:[TextModel] = []
            
            for textDictionary in responseArray {
                finalTextModelArray.append(TextModel(id: Int(textDictionary["id"]!)!, textData: textDictionary["text"]!))
            }
            
            let conversion = DataTextModel(dataArray:finalTextModelArray)
            return Result.success(conversion)
            
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
}
