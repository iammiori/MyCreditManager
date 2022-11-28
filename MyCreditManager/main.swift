//
//  main.swift
//  MyCreditManager
//
//  Created by miori Lee on 2022/11/16.
//

import Foundation

main()
func main() {
    
    var endBoolean : Bool = true
    var feature: Feature = Feature()
    
    while endBoolean {

        print(MainStream.startInfo)

        let input = readLine()
        let selectedNum : String = String(input!)
        
        switch selectedNum {
        case "1":
            print(AddStudent.notice)
        case "2":
            print(DeleteStudent.notice)
        case "3":
            print(AddScore.notice)
        case "4":
            print(DeleteScore.notice)
        case "5":
            print(ShowAverage.notice)
        case "X":
            print(MainStream.off)
            endBoolean = false
        default:
            print(MainStream.wrongErr)
        }
        feature.readLineService(selected: selectedNum)
    }
}
