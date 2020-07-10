//
//  ErrorResult.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 09/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
