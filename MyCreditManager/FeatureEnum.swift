//
//  FeatureEnum.swift
//  MyCreditManager
//
//  Created by miori Lee on 2022/11/16.
//

import Foundation

enum FeatureEnum: String, CaseIterable {
    case addStudent = "1: 학생 추가,"
    case deleteStudent = "2: 학생 삭제,"
    case addGrade = "3: 성적추가(변경),"
    case deleteGrade = "4: 성적 삭제,"
    case showGrade = "5: 평점보기,"
    case exit = "X: 종료"
}
