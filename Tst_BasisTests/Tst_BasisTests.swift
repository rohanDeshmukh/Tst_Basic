//
//  Tst_BasisTests.swift
//  Tst_BasisTests
//
//  Created by Rohan Deshmukh on 09/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import XCTest
@testable import Tst_Basis

class Tst_BasisTests: XCTestCase {
    
    var viewModel : TextViewModel!
    var dataSource : GenericDataSource<TextModel>!
    fileprivate var service : MockTextDataService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.service = MockTextDataService()
        self.dataSource = GenericDataSource<TextModel>()
        self.viewModel = TextViewModel(service: service, dataSource: dataSource)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService(){
        let expectation = XCTestExpectation(description: "No service data")
        
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not be able to fetch currencies
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchDataValues()
        wait(for: [expectation], timeout: 5.0)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MockTextDataService : DataServiceProtocol {
    
    var textData : TextModel?
    
    func fetchData(_ completion: @escaping ((Result<TextModel, ErrorResult>) -> Void)) {
        if let textData = textData {
            completion(Result.success(textData))
        }else {
            completion(Result.failure(ErrorResult.custom(string:"No text data")))
        }
    }
}

