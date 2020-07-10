//
//  TextViewModel.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 10/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import Foundation

struct TextViewModel {
    
    weak var dataSource : GenericDataSource<TextModel>?
    weak var service: DataServiceProtocol?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(dataSource:GenericDataSource<TextModel>) {
        self.dataSource = dataSource
    }
    
    init(service: DataServiceProtocol, dataSource : GenericDataSource<TextModel>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchDataValues() {
    
        DataService.shared.fetchData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let textData) :
                    self.dataSource?.data.value = textData.dataArray
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}
