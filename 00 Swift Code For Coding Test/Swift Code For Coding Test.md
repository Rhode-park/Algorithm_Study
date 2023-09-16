# Swift Code for Coding Test

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
`readLine()`에 강제언래핑을 활용하여 입력을 받을 수 있다.
실무에서 짤 때는 값이 없을 경우(nil) 런타임 에러를 야기하기때문에 지양하지만, 알고리즘 문제에서 보통 입력값은 구체적인 값이 주어지고 그에 따른 결과값을 반환하도록 요구한다.
그러므로, 강제 언래핑을 통해 코드양을 줄이고 시간 관리를 하도록 한다.
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
String에 대한 count 프로퍼티를 통해서 문자열에 있는 문자의 개수를 알 수 있다.
결과적으로, `count`를 출력하면, 5가 나온다.
<br/>

**문자열이 비어있는지 확인하기**
```swift
let str = "aBcDe"
let emptyStr = ""
let isStrEmpty = str.isEmpty
let isEmptyStrEmpty = emptyStr.isEmpty
```
String에 대한 isEmpty 프로퍼티를 통해서 문자열이 비어있는지 여부를 알 수 있다.
결과적으로, `isStrEmpty`를 출력하면, false가 나온다.
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
결과적으로, `capitalizedStr`을 출력하면, Abcde가 나온다.
이 때, `import Foundation`이 필요하다.

```swift
let str = "aBcDe"
let lowerStr = str.lowercased()
```
`lowercased()`를 사용하면, 모든 글자가 소문자로 변환된다.
결과적으로, `lowerStr`을 출력하면, abcde가 나온다.

```swift
let str = "aBcDe"
let upperStr = str.uppercased()
```
`uppercased()`를 사용하면, 모든 글자가 대문자로 변환된다.
결과적으로, `upperStr`을 출력하면, ABCDE가 나온다.
<br/>

**문자열의 특정 문자 변환하기**
```swift
import Foundation

let str = "lovelyhodoo"
let secondStr = str.replacingOccurrences(of: "o", with: "0")
let thirdStr = str.replacingOccurrences(of: "O", with: "0")
```
`replacingOccurrences(of:, with:)`를 사용하면, 원하는 글자를 다른 문자로 변환할 수 있다.
결과적으로, `secondStr`을 출력하면, l0velyh0d00가 나온다.
그리고, `thirdStr`를 출력하면, 대소문자를 구분하기 때문에 문자열이 변환되지 않은 채로 그대로 lovelyhodoo가 나온다.
이 때, `import Foundation`이 필요하다.
<br/>

**문자열의 특정 문자열 찾기**
```swift
let str = "lovelyhodoo"
let isContainsH = str.contains("h")
let isContainsLovely = str.contains("lovely")
let isContainsUpperLovely = str.contains("LOVELY")
let isContainsRhode = str.contains("rhode")
```
`contains()`를 사용하면, 문자열이 특정 문자열을 포함하고 있는지를 Bool값으로 받아볼 수 있다.
결과적으로, `isContainsH`를 출력하면, true가 나온다.
또한, `isContainsLovely`를 출력하면, true가 나온다.
그러나, 대소문자를 구분하기때문에, `isContainsUpperLovely`를 출력하면, false가 나온다.
특정 문자열을 포함하지 않았기때문에, `isContainsRhode`를 출력할 때도, false가 나온다.

<br/>

**SubString**
```swift
let str = "lovelyhodoo"
let idx = str.index(str.startIndex, offsetBy: 6)
let result = str[idx]
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
마찬가지로, `index(, offsetBy:)`를 통해서 앞에서부터 6번째에 해당하는 문자의 인덱스를 가져오고 있다.
0번째 인덱스부터 시작하기때문에, 실질적으로는 7번째 글자에 대한 인덱스라고 보면 된다.
이 때, `result`를 출력하면, 7번째 글자부터 마지막 글자까지인 hodoo가 나오며, `result`의 타입은 Substring이다

```swift
let str = "lovelyhodoo"
let endIdx = str.index(str.startIndex, offsetBy: 6)
let result = str[...endIdx]
```
마찬가지로, `index(, offsetBy:)`를 통해서 앞에서부터 6번째에 해당하는 문자의 인덱스를 가져오고 있다.
0번째 인덱스부터 시작하기때문에, 실질적으로는 7번째 글자에 대한 인덱스라고 보면 된다.
이 때, `result`를 출력하면, 첫번째 글자부터 7번째 글자까지인 lovelyh가 나오며, `result`의 타입은 Substring이다

```swift
let str = "lovelyhodoo"
let idx = str.index(str.endIndex, offsetBy: -3)
let result = str[idx]
```
`index(, offsetBy:)`를 통해서 뒤에서부터 3번째에 해당하는 문자의 인덱스를 가져올 수도 있다.
이 때, `result`를 출력하면, d가 나오며, `result`의 타입은 Character이다.

```swift
let str = "lovelyhodoo"
let startIdx = str.index(str.endIndex, offsetBy: -3)
let result = str[startIdx...]
```
마찬가지로, `index(, offsetBy:)`를 통해서 뒤에서부터 3번째에 해당하는 문자의 인덱스를 가져오고 있다.
이 때, `result`를 출력하면, 뒤에서 3번째인 글자부터 마지막 글자까지인 doo가 나오며, `result`의 타입은 Substring이다.

```swift
let str = "lovelyhodoo"
let endIdx = str.index(str.endIndex, offsetBy: -3)
let result = str[...endIdx]
```
마찬가지로, `index(, offsetBy:)`를 통해서 뒤에서부터 3번째에 해당하는 문자의 인덱스를 가져오고 있다.
이 때, `result`를 출력하면, 첫번째 글자부터 뒤에서 3번째인 글자까지인 lovelyhod가 나오며, `result`의 타입은 Substring이다.
<br/>

**Prefix와 Suffix**
```swift
let str = "lovelyhodoo"
let isStartWithLovely = str.hasPrefix("lovely")
let isStartWithHodoo = str.hasPrefix("hodoo")
```
`hasPrefix()`를 통해서 문자열이 특정 문자열로 시작하는지를 Bool값으로 받아볼 수 있다.
결과적으로 `isStartWithLovely`를 출력하면, true가 나온다.
또한, `isStartWithHodoo`를 출력하면, false가 나온다.

```swift
let str = "lovelyhodoo"
let isEndWithLovely = str.hasSuffix("lovely")
let isEndWithHodoo = str.hasSuffix("hodoo")
```
마찬가지로, `hasSuffix()`를 통해서 문자열이 특정 문자열로 끝나는지를 Bool값으로 받아볼 수 있다.
결과적으로, `isEndWithLovely`를 출력하면, false가 나온다.
또한, `isEndWithHodoo`를 출력하면, true가 나온다.

<br/>
<br/>

### 수학
**진수 변환하기**
```swift
let str = "11"
let binary = Int(str, radix: 2)!
let octal = Int(str, radix: 8)!
let hexadecimal = Int(str, radix: 16)!
```
`Int(_:, radix:)`를 통해서 String형태로 주어진 숫자의 진수를 바꿀 수 있다.
`radix`뒤에 계산하고자 하는 진수의 숫자를 입력하면, 결과적으로 10진수로 값이 얼마가 되는지를 나타내준다.
2진법 기준으로 11이었던 것은 11<sub>2</sub> = 1x2<sup>1</sup>+1x2<sup>0</sup>이므로 10진법 기준으로 3이다.
결과적으로, `binary`를 출력하면, 3이 나온다.
마찬가지로, `octal`을 출력하면, 9가, `hexadecimal`을 출력하면 17이 나온다.

이 때, 강제언래핑을 활용하여 Int로 변환한다.
실무에서 짤 때는 String을 Int로 변환할 수 없을 경우(nil) 런타임 에러를 야기하기때문에 지양하지만, 알고리즘 문제에서 보통 입력값은 숫자로 변환할 수 있는 값이 주어지고 그에 따른 결과값을 반환하도록 요구한다.
그러므로, 강제 언래핑을 통해 코드양을 줄이고 시간 관리를 하도록 한다.

```swift
let number = 11
let binary = String(number, radix: 2)
let octal = String(number, radix: 8)
let hexadecimal = String(number, radix: 16)
```
`String(_:, radix:)`를 통해서는 역으로 Int형태로 주어진 숫자의 진수를 바꿀 수 있다.
`radix`뒤에 계산하고자 하는 진수의 숫자를 입력하면, 결과적으로 해당 진수로 어떻게 표현할 수 있는지를 나타내준다.
10진법 기준으로 11이었던 것은 11 = 8+0+2+1 = 1x2<sup>3</sup>+0x2<sup>2</sup>+1x2<sup>1</sup>+1x2<sup>0</sup> = 1011<sub>2</sub> 으로 표현할 수 있다.
결과적으로, `binary`를 출력하면, 1011이 나온다.
마찬가지로, `octal`를 출력하면, 13이, `hexadecimal`를 출력하면, b가 나온다.
<br/>

**n제곱 구하기**
```swift
import Foundation
let firstNumber = pow(2.0, 3.0)
let secondNumber = pow(2, 3)
```
`pow()`메서드를 통해서 n제곱을 표현할 수 있다.
결과적으로, `firstNumber`를 출력하면, 2.0<sup>3.0</sup> = 8.0이므로 8.0이 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
또한, `secondNumber`를 출력하면, 2<sup>3</sup> = 8이므로 8이 출력된다.
그리고 `secondNumber`의 타입은 Decimal이다.
이 때, `import Foundation`이 필요하다.
<br/>

**제곱근 구하기**
```swift
import Foundation
let firstNumber = sqrt(9.0)
let secondNumber = sqrt(25)
```
`sqrt()`메서드를 통해서 제곱근을 표현할 수 있다.
결과적으로, `firstNumber`를 출력하면, 9.0<sup>1/2</sup> = 3.0이므로 3.0이 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
또한, `secondNumber`를 출력하면, 25<sup>1/2</sup> = 5.0이므로 5.0이 출력된다.
그리고 `secondNumber`의 타입은 Double이다.
이 때, `import Foundation`이 필요하다.
<br/>

**소수점 다루기**
```swift
import Foundation
let firstNumber = round(-3.75)
let secondNumber = round(-3.2)
let thirdNumber = round(2.7)
```
`round()`메서드를 통해서 반올림을 할 수 있다.
결과적으로, `firstNumber`를 출력하면, -3.75에서 반올림 해준 -4.0이 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
또한, `secondNumber`를 출력하면, -3.2에서 반올림 해준 -3.0이 출력된다.
그리고 `secondNumber`의 타입은 Double이다.
마지막으로, `thirdNumber`를 출력하면, 2.7에서 반올림 해준 3.0이 출력된다.
그리고 `thirdNumber`의 타입은 Double이다.
이 때, `import Foundation`이 필요하다.

```swift
import Foundation
let firstNumber = floor(-3.75)
let secondNumber = floor(-3.2)
let thirdNumber = floor(2.7)
```
`floor()`메서드를 통해서 내림을 할 수 있다.
결과적으로, `firstNumber`를 출력하면, -3.75에서 내림 해준 -4.0이 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
또한, `secondNumber`를 출력하면, -3.2에서 내림 해준 -4.0이 출력된다.
그리고 `secondNumber`의 타입은 Double이다.
마지막으로, `thirdNumber`를 출력하면, 2.7에서 내림 해준 2.0이 출력된다.
그리고 `thirdNumber`의 타입은 Double이다.
이 때, `import Foundation`이 필요하다.

```swift
import Foundation
let firstNumber = ceil(-3.75)
let secondNumber = ceil(-3.2)
let thirdNumber = ceil(2.7)
```
`ceil()`메서드를 통해서 올림을 할 수 있다.
결과적으로, `firstNumber`를 출력하면, -3.75에서 올림 해준 -3.0이 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
또한, `secondNumber`를 출력하면, -3.2에서 올림 해준 -3.0이 출력된다.
그리고 `secondNumber`의 타입은 Double이다.
마지막으로, `thirdNumber`를 출력하면, 2.7에서 올림 해준 3.0이 출력된다.
그리고 `thirdNumber`의 타입은 Double이다.
이 때, `import Foundation`이 필요하다.

```swift
import Foundation
let firstNumber = trunc(-3.75)
let secondNumber = trunc(-3.2)
let thirdNumber = trunc(2.7)
```
`trunc()`메서드를 통해서 버림을 할 수 있다.
결과적으로, `firstNumber`를 출력하면, -3.75에서 버림 해준 -3.0이 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
또한, `secondNumber`를 출력하면, -3.2에서 버림 해준 -3.0이 출력된다.
그리고 `secondNumber`의 타입은 Double이다.
마지막으로, `thirdNumber`를 출력하면, 2.7에서 버림 해준 2.0이 출력된다.
그리고 `thirdNumber`의 타입은 Double이다.
이 때, `import Foundation`이 필요하다.

```swift
import Foundation
let digit: Double = pow(10, 4)
let firstNumber = round(-3.75812*digit)/digit
let secondNumber = round(-3.24687*digit)/digit
let thirdNumber = round(2.733468*digit)/digit
```
`pow()`메서드와 `round()`메서드를 통해서 특정 자리에서 반올림을 할 수 있다.
`digit`은 pow(10, 4) = 10<sup>4</sup>이므로, 소수점 4번째 자리까지 나오는 반올림을 할 수 있다.
-3.75812*`digit`은 네 자리 수 앞으로 이동한 -37581.2이며, 여기에서 round()메서드를 사용해주면, 반올림이 되어 -37581.0이 된다. 
여기에서, 다시 `digit`으로 나눠주면, 네 자리 수 뒤로 이동한 -3.7581이 된다.
결과적으로, `firstNumber`를 출력하면, -3.75812의 소수점 4번째 자리까지 반올림 해준 -3.7581이 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
또한, `secondNumber`를 출력하면, -3.24687의 소수점 4번째 자리까지 반올림 해준 -3.2469이 출력된다.
그리고 `secondNumber`의 타입은 Double이다.
마지막으로, `thirdNumber`를 출력하면, 2.733468의 소수점 4번째 자리까지 반올림 해준 2.7335이 출력된다.
그리고 `thirdNumber`의 타입은 Double이다.
이 때, `import Foundation`이 필요하다.
특정 자리에서 내림, 올림, 버림의 경우에도 `floor()`, `ceil()`, `trunc()`메서드와 `pow()`를 사용해서 해줄 수 있다.
<br/>
**절댓값 구하기**
```swift
let firstNumber = (-3.75).magnitude
let secondNumber = abs(-3.75)
```
`.magnitude`와 `abs()`를 통해서 특정 숫자의 절댓값을 구할 수 있다.
결과적으로, `firstNumber`를 출력하면, -3.75의 절댓값인 3.75가 출력된다.
그리고 `firstNumber`의 타입은 Double이다.
마찬가지로, `secondNumber`를 출력하면, -3.75의 절댓값인 3.75가 출력된다.
그리고 `secondNumber`의 타입역시 Double이다.
<br/>

**Int와 UInt**
추후에 내용 정리할 예정
<br/>

**Double과 Decimal**
추후에 내용 정리할 예정

<br/>
<br/>

### 배열
**배열 채우기**
추후에 내용 정리할 예정
<br/>

**배열의 요소 문자열로 합치기**
```swift
let strs = ["Rhode", "loves", "Hodoo"]
let firstStr = strs.joined()
let secondStr = strs.joined(separator: " ")
let thirdStr = strs.joined(separator: "_")
let fourthStr = strs.joined(separator: "0")
let fifthStr = strs.joined(separator: "aa")
```
`joined()`와 `joined(separator:)`를 통해서 배열의 요소들을 문자열로 합칠 수 있다.
`joined()`를 사용할 경우, 단순히 요소들이 문자열로 합쳐진다.
결과적으로, `firstStr`를 출력하면, RhodelovesHodoo가 나온다.
`joined(separator:)`를 사용해서는 배열의 요소들 사이사이에 문자열을 끼워넣을 수 있다.
결과적으로, `secondStr`을 출력하면, Rhode loves Hodoo가, `thirdStr`을 출력하면, Rhode_loves_Hodoo가 나온다.
이 때, 끼워넣을 문자열이 String의 형태라면 숫자가 되든, 영어의 문자열이든 관련 없이 넣을 수 있다.
결과적으로, `fourthStr`을 출력하면, Rhode0loves0Hodoo가, `fifthStr`를 출력하면, RhodeaalovesaaHodoo가 나온다.
<br/>
