//
//  DataService.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 09/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import Foundation

protocol DataServiceProtocol : class {
    func fetchData(_ completion: @escaping ((Result<DataTextModel, ErrorResult>) -> Void))
}

final class DataService: RequestHandler, DataServiceProtocol {
    
    static let shared = DataService()
    
    let endpoint = "https://gist.githubusercontent.com/anishbajpai014/d482191cb4fff429333c5ec64b38c197/raw/b11f56c3177a9ddc6649288c80a004e7df41e3b9/HiringTask.json"
    var task : URLSessionTask?
    
    func fetchData(_ completion: @escaping ((Result<DataTextModel, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchDataService()
        
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
        
    }
    
    func cancelFetchDataService() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

