# MyCreditManager
원티드 프리온보딩 챌린지 iOS과정 사전과제입니다.

### 🛠 사용언어 / 환경
```
해당 과제에서 사용한 언어와 환경입니다.
```
- Swift
- macOS - Command Line Tool

### 🛠 프로그램의 메뉴 
```
해당 과제에서 제공하는 메뉴(기능) 입니다.
```
- 학생추가
- 학생삭제
- 성적추가(변경)
- 성적삭제
- 평점보기
- 종료

### 🛠 유지보수를 위한 노력 
```
해당 과제에서 코드의 유지보수 향상을 위해 노력한 부분입니다.
```
- Strings 파일을 따로 만들어, 출력될 문구를 따로 관리 하였습니다.



### ♻🪄 refactoring 과정
```
스스로 refactoring을 진행하여, 더 나은 코드에 대해 고민한 부분에 대한 정리입니다.
```
1. 데이터 구조
`var students:[String: [[String: String]]] = [:]` 
위와 같은 String 딕셔너리 형태에서, struct를 따로 설계하여 유지보수에 유리하게 리팩토링하였습니다.
```swift
struct Grade {
    var subject : String
    var grade : Double
}

struct GradeManage {
    let name: String
    var credit : [Grade?]
}
```
모델을 다음과 같이 설정하고, 메인에서  `var students : [GradeManage] = []` 로 사용하였습니다.
