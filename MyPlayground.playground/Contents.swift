import Foundation

//ex26
//제네릭(Generic)
//용도 : 클래스나 구조체에 입력되는 타입을 고정시켜주는 용도. 주로 콜렉션-배열의 입력타입으로 사용됨.
//예) Array<Int>, Struct<Int>, Class<Int>

struct Calc {
    var param : Int
    init(param : Int){
        self.param = param
    }
}
struct Calc2<MYTYPE> {
    var param : MYTYPE
    init(param : MYTYPE){
        self.param = param
    }
}

var calc = Calc(param: 10)
var calc2 = Calc<Int>(param : 10)
dump( calc2 )
var calc3 = Calc2<String>(param: "문자열")
dump( calc3 )
