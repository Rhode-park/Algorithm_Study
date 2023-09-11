# Swift Code For Coding Test

## 목차
| 목차 | 
| -------- |
| [입력](#입력) |
| [String과 Substring](#String과-Substring) |
| [수학](#수학) |
| [배열](#배열) |
| [세트](#세트) |
| [딕셔너리](#딕셔너리) |
| [정렬](#정렬) |
| [반복](#반복) |
| [고차함수](#고차함수) |

### 입력
**기본 입력 받기**
```swift
let input = readLine()!
```
`readLine()`에 강제언래핑을 활용하여 입력을 받는다.
실무에서는 짤 때는 값이 없을 경우(nil) 런타임 에러를 야기하기때문에 지양하지만, 알고리즘 문제에서 보통 입력값은 구체적인 값이 주어지고 그에 따른 결과값을 반환하도록 요구한다.
그러므로 강제 언래핑을 통해 코드양을 줄이고 시간 관리를 하도록 한다.
<br/>

**공백을 기준으로 입력값 배열에 넣기**
```swift
let inputs = readLine()!.split(separator: " ")
```
a b c를 입력하면, `inputs`에 ["a", "b", "c"]가 들어가게 된다.
이 때, `let inputs: [String.SubSequence]`이며, `inputs`의 요소의 타입은 Substring이다.


```swift
let numbers = readLine()!.split(separator: " ").map {Int($0)!}
```
1 2 3을 입력하면, `numbers`에 [1, 2, 3]이 들어가게 된다.
이 때, `let numbers: [Int]`이며, `numbers`의 요소의 타입은 Int이다.
<br/>

**공백이 없는 입력값 배열에 넣기**
```swift
let inputs = Array(readLine()!).map {String($0)}
```
1ab를 입력하면, inputs에 ["1", "a", "b"]가 들어가게 된다.
이 때, `let inputs: [String]`이며, `inputs`의 요소의 타입은 String이다.


```swift
let numbers = Array(readLine()!).map {Int(String($0))!}
```
123을 입력하면, numbers에 [1, 2, 3]이 들어가게 된다.
이 때, `let numbers: [Int]`이며, `numbers`의 요소의 타입은 Int이다.

<br/>
<br/>

### String과 Substring
**문자열의 문자 개수 세기**
```swift
let str = "aBcDe"
let count = str.count
```
String에 대한 count 프로퍼티를 이용해 문자열에 있는 문자의 개수를 알 수 있다.
결과적으로 `count`를 출력하면, 5가 나온다.
<br/>

**문자열이 비어있는지 확인하기**
```swift
let str = "aBcDe"
let emptyStr = ""
let isStrEmpty = str.isEmpty
let isEmptyStrEmpty = emptyStr.isEmpty
```
String에 대한 isEmpty 프로퍼티를 이용해 문자열이 비어있는지 여부를 알 수 있다.
결과적으로 `isStrEmpty`를 출력하면, false가 나온다.
또한, `isEmptyStrEmpty`를 출력하면, true가 나온다.
count 프로퍼티를 이용해 문자열의 개수가 0개인지를 확인할 수도 있으나, count의 시간 복잡도는 O(n)이다.
반면에, isEmpty 프로퍼티는 시간복잡도가 O(1)이다.
그러므로, isEmpty 프로퍼티를 사용하는 것이 바람직하다.

<br/>

**대소문자 변환하기**
```swift
let str = "aBcDe"
```
라는 문자열을 대소문자를 변환할 생각이다.
```swift
import Foundation

let str = "aBcDe"
let capitalizedStr = str.capitalized 
```
`capitalized`를 사용하면, 첫 글자만 대문자로 변환 가능하다.
결과적으로 `capitalizedStr`을 출력하면, Abcde가 나온다.
이 때, `import Foundation`이 필요하다.

```swift
let str = "aBcDe"
let lowerStr = str.lowercased()
```
`lowercased()`를 사용하면, 모든 글자가 소문자로 변환된다.
결과적으로 `lowerStr`을 출력하면, abcde가 나온다.

```swift
let str = "aBcDe"
let upperStr = str.uppercased()
```
`uppercased()`를 사용하면, 모든 글자가 대문자로 변환된다.
결과적으로 `upperStr`을 출력하면, ABCDE가 나온다.
<br/>

**문자열의 특정 문자 변환하기**
```swift
import Foundation

let str = "lovelyhodoo"
let secondStr = str.replacingOccurrences(of: "o", with: "0")
let thirdStr = str.replacingOccurrences(of: "O", with: "0")
```
`replacingOccurrences(of:, with:)`를 사용하면, 원하는 글자를 다른 문자로 변환할 수 있다.
결과적으로 `secondStr`을 출력하면, l0velyh0d00가 나온다.
그리고, `thirdStr`를 출력하면, 대소문자를 구분하기 때문에 문자열이 변환되지 않은 채로 그대로 lovelyhodoo가 나온다.
이 때, `import Foundation`이 필요하다.
<br/>

**SubString**
```swift
let str = "lovelyhodoo"
let startIdx = str.index(str.startIndex, offsetBy: 6)
let result = str[startIdx]
```
Swift에서는 문자열에 대한 서브스크립트가 되지 않기때문에, 이렇게 인덱스를 구해와야한다.
`index(, offsetBy:)`를 통해서 앞에서부터 6번째에 해당하는 문자의 인덱스를 가져오고 있다.
0번째 인덱스부터 시작하기때문에, 실질적으로는 7번째 글자에 대한 인덱스라고 보면 된다.
이 때, `result`를 출력하면, h가 나오며, `result`의 타입은 Character이다.

```swift
let str = "lovelyhodoo"
let startIdx = str.index(str.startIndex, offsetBy: 6)
let result = str[startIdx...]
```

