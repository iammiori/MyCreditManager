//
//  Feature.swift
//  MyCreditManager
//
//  Created by miori Lee on 2022/11/25.
//

import Foundation

class Feature {
    var students : [GradeManage] = []
    
    func readLineService(selected:String) {
        switch selected {
        case "1":
            addStudent()
        case "2":
            removeStudent()
        case "3":
            addGrade()
        case "4":
            removeCredit()
        case "5":
            showAverageGrade()
        default: break
        }
    }
    
    //학생추가
    private func addStudent() {
        let input = readLine()
        let studentInput = String(input ?? "")
        
        if students.filter({ $0.name == studentInput }).count == 0 {
            let student = GradeManage(name: studentInput, credit: [])
            students.append(student)
            print("\(studentInput) 학생을 추가했습니다.")
        } else {
            print("\(studentInput)은 이미 있는 학생입니다. 추가하지 않습니다.")
        }
    }
    
    //학생삭제
    private func removeStudent() {
        let input = readLine()
        let studentInput = String(input ?? "")
        
        if students.filter({ $0.name == studentInput}).count > 0 {
            guard let removeIndex = students.firstIndex(where: {$0.name == studentInput}) else { return }
            students.remove(at: removeIndex)
            print("\(studentInput) 학생을 삭제하였습니다.")
        } else {
            print("\(studentInput) 삭제할 학생의 이름을 찾지 못했습니다.")
        }
    }
    
    //성적추가(변경)
    private func addGrade() {
        let input = readLine()
        
        let componentInput = input?.components(separatedBy: " ")
        let studentName = String(componentInput?[0] ?? "")
        let subjectName = String(componentInput?[1] ?? "")
        let gradeName = String(componentInput?[2] ?? "")
        
        // 다 값이 있을때
        guard studentName != "" && subjectName != "" && gradeName != "" else {
            print(MainStream.inputErr)
            return
        }
        
        let input3ToDouble = changeGradeToInt(gradeName)
        guard input3ToDouble != -100 else {
            print(MainStream.inputErr)
            return
        }
        
        let grade = Grade(subject: subjectName, grade: input3ToDouble)
        
        if students.filter({$0.name == studentName}).count == 0 {
            print("해당학생 존재하지 않습니다.")
        } else {
            guard let findIdx = students.firstIndex(where: {$0.name == studentName}) else { return }
            let foundStudent = students[findIdx]
            
            if foundStudent.credit.filter({$0?.subject == subjectName}).count > 0 {
                let findIdx2 = foundStudent.credit.firstIndex(where: {$0?.subject == subjectName})
                students[findIdx].credit[findIdx2 ?? 0] = grade
            } else {
                students[findIdx].credit.append(grade)
            }
            print("추가(변경)완료")
        }
    }
    

    //성적삭제
    private func removeCredit() {
        let input = readLine()
        
        let componetInput = input?.components(separatedBy: " ")
        let studentName = String(componetInput?[0] ?? "")
        let subjectName = String(componetInput?[1] ?? "")
        
        guard studentName != "" && subjectName != "" else {
            print(MainStream.inputErr)
            return
        }
        
        if students.filter({$0.name == studentName}).count > 0 {
            guard let studentIdx = students.firstIndex(where: {$0.name == studentName}) else { return }
            
            if students[studentIdx].credit.filter({$0?.subject == subjectName}).count > 0 {
                
                guard let creditIndex = students[studentIdx].credit.firstIndex(where: {$0?.subject == subjectName}) else {
                    return
                }
                
                students[studentIdx].credit.remove(at: creditIndex)
                
                print("\(studentName) 학생의 \(subjectName) 성적을 삭제했습니다.")
                
            } else {
                print("\(subjectName) 과목이 존재하지 않습니다. ")
            }
        } else {
            print("\(studentName) 학생을 찾지 못했습니다.")
            
        }
    }
    
    //평점보기
    private func showAverageGrade() {
        let input = readLine()
        let studentInput = String(input ?? "")
        
        if students.filter({ $0.name == studentInput }).count > 0 {
            guard let findIndex = students.firstIndex(where: {$0.name == studentInput}) else { return }
            
            if students[findIndex].credit.isEmpty {
                print("성적이 존재하지않습니다.")
            }else {
                let studentCredit = students[findIndex].credit
                var allGrade : Double = 0
                for grade in studentCredit {
                    
                    if let existGrade = grade {
                        print("\(existGrade.subject): \(existGrade.grade)")
                        allGrade += existGrade.grade
                    }
                }
                print("평점: \(allGrade / Double(studentCredit.count))")
            }
        } else {
            print("\(studentInput) 학생을 찾지못했습니다.")
        }
    }
    
    
    
    private func changeGradeToInt(_ grade:String) -> Double {
        switch grade {
        case "A+":
            return 4.5
        case "A":
            return 4
        case "B+":
            return 3.5
        case "B":
            return 3
        case "C+":
            return 2.5
        case "C":
            return 2
        case "D+":
            return 1.5
        case "D":
            return 1
        case "F":
            return 0
        default:
            return -100
        }
    }
}
