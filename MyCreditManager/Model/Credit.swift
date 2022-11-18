//
//  Credit.swift
//  MyCreditManager
//
//  Created by miori Lee on 2022/11/16.
//

import Foundation

struct Credit {
    var student: Student
    var grades: [Grade]
}

struct Credits {
    var info: [Student: [Grade]]
}
