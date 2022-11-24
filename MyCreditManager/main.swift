//
//  main.swift
//  MyCreditManager
//
//  Created by miori Lee on 2022/11/16.
//

import Foundation

var students:[String: [[String: String]]] = [:]

//메인 실행동작
while true {
    print(MainStream.startInfo)
    
    let input = readLine()!
    if input == "X" {
        print(MainStream.off)
        break
    } else {
        switch input {
        case "1":
            addStudent()
        case "2":
            deleteStudent()
        case "3":
            addScore()
        case "4":
            deleteScore()
        case "5":
            showAverage()
        default:
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
    }
}

//1. 학생 추가
private func addStudent() {
    
    print(AddStudent.notice)
    
    if let name = readLine() {
        //입력이 잘못되었을때
        if name.isEmpty {
            print(MainStream.inputErr)
        } else if students[name] != nil {
            print("\(name)" + AddStudent.existErr)
        } else {
            students[name] = [[:]]
        }
    }
    
}
//2. 학생 삭제
private func deleteStudent() {
    print(DeleteStudent.notice)
    if let name = readLine() {
        //삭제하려고 하는 학생이 있을 경우
        if students[name] != nil {
            students[name] = nil
            
        } else {
            print("\(name)" + DeleteStudent.existErr)
        }
    }
}
// 3. 성적 추가
private func addScore() {
    print(AddScore.notice)
    if let studentScore = readLine() {
        let scoreInfo = studentScore.split(separator: " ").map{$0}
        
        if scoreInfo.count == 3 {
            let name = String(scoreInfo[0])
            let subject = String(scoreInfo[1])
            let score = String(scoreInfo[2])
            
            // 성적을 추가하려는 학생이 존재하지 않을때
            if students[name] == nil {
                print("\(name)" + AddScore.findErr)
            } else {
                if students[name]!.filter({$0.keys.contains(subject)}).isEmpty {
                    students[name]?.append([subject:score])
                } else {
                    if let index = students[name]?.firstIndex(where: {$0.keys.contains(name)}) {
                        students[name]?[index] = [subject: score]
                    }
                }
                print("\(name) 학생의 \(subject) 과목이 \(score) 로 추가(변경)되었습니다.")
            }
        } else {
            print(MainStream.inputErr)
        }
    }
}

// 4. 성적 삭제
private func deleteScore() {
    print(DeleteScore.notice)
    if let studentScore = readLine() {
        let scroeInfo = studentScore.split(separator: " ")
        
        if scroeInfo.count == 2 {
            let name = String(scroeInfo[0])
            let subject = String(scroeInfo[1])
            //성적을 삭제하려는 학생이 존재하지 않을때
            if students[name] == nil {
                print("\(name) 학생을 찾지 못했습니다.")
            } else {
                if let index = students[name]?.firstIndex(where: {$0.keys.contains(subject)}) {
                    students[name]?.remove(at: index)
                }
            }
        } else {
            print(MainStream.inputErr)
        }
    }
}

private func showAverage() {
    print(ShowAverage.notice)
    if let name = readLine() {
        if students[name] != nil {
            var average = 0.0
            students[name]?.forEach({$0.forEach { subject, score in
                print("\(subject): \(score)")
                average += changeGradePoint(grade: score)
            }})
            print("평점: \(String(format: "%.2f", average / Double(students[name]!.count - 1)))")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    } else {
        print(MainStream.inputErr)
    }
}

private func changeGradePoint(grade: String) -> Double {
    switch grade {
    case "A+":
        return 4.5
    case "A":
        return 4.0
    case "B+":
        return 3.5
    case "B":
        return 3.0
    case "C+":
        return 2.5
    case "C":
        return 2.0
    case "D+":
        return 1.5
    case "D":
        return 1.0
    case "F":
        return 0.0
    default:
        return 0.0
    }
}
