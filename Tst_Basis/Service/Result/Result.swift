//
//  Result.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 09/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
