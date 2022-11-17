//
//  AddStudent.swift
//  MyCreditManager
//
//  Created by miori Lee on 2022/11/16.
//

import Foundation

protocol AddStudentProtocol {
    func addStudent()
}
class AddStudent : AddStudentProtocol {
    func addStudent() {
        guard let input = readLine() else { return }
        if input == "" {
            print("입력안함")
        } else {
            //입력함
        }
    }
}
