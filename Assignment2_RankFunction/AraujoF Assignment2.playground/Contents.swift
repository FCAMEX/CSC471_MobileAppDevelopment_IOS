import UIKit

// 1. Create a new Playground
// 2.a Function rank that performs a binary search of a key in a sorted integer attay.

public func rank(key: Int, array: [Int]) ->Int {
    var lo = 0;
    var hi = array.capacity - 1;
    
    while(lo <= hi){
        let mid = lo + (hi - lo) / 2;
        if(key < array[mid])
        {
            hi = mid - 1;
        }else if(key > array[mid]){
            lo = mid + 1;
        }else{
            return mid;
        }
    }
    return -1;
}

// 2.b Create a sorted integer array and test the rank function. Make several calls to the rank function and verify that the results are correct

var testArray = [20, 52, 66, 76, 88, 90, 112, 160, 188, 210, 300];

print("Testing rank function:");
var index = rank(key:20, array: testArray);
if(index == 0){
    print("Correct! Index = 0");
}else{
    print("Wrong! Index = \(index) it should be 0");
}
index = rank(key:66, array: testArray);
if(index == 2){
    print("Correct! Index = 2");
}else{
    print("Wrong! Index = \(index) it should be 2");
}
index = rank(key:112, array: testArray);
if(index == 6){
    print("Correct! Index = 6");
}else{
    print("Wrong! Index = \(index) it should be 6");
}
index = rank(key:210, array: testArray);
if(index == 9){
    print("Correct! Index = 9");
}else{
    print("Wrong! Index = \(index) it should be 9");
}
index = rank(key:3000, array: testArray);
if(index == -1){
    print("Correct! Index = -1");
}else{
    print("Wrong! Index = \(index) it should be -1");
}

//3.a Write a more complete version of the Fraction class. Add substraction, multiplication and division methods

import Foundation

class Fraction {
    var numerator: Int = 0;
    var denominator: Int = 1;
    
    func add(_ f: Fraction) -> Fraction{
        let addFrac : Fraction = Fraction();
        addFrac.numerator = numerator * f.denominator + denominator * f.numerator;
        addFrac.denominator = denominator * f.denominator;
        addFrac.reduce();
        return addFrac;
    }
    
    func subtract(_ f:Fraction) -> Fraction{
        let subFrac : Fraction = Fraction();
        subFrac.numerator = numerator * f.denominator - denominator * f.numerator;
        subFrac.denominator = denominator * f.denominator;
        subFrac.reduce();
        return subFrac;
    }
    
    func multiply(_ f:Fraction) -> Fraction{
        let multFrac : Fraction = Fraction();
        multFrac.numerator = numerator * f.numerator;
        multFrac.denominator = denominator * f.denominator;
        multFrac.reduce();
        return multFrac;
    }
    
    func divide(_ f:Fraction) -> Fraction{
        let divFrac : Fraction = Fraction();
        divFrac.numerator = numerator * f.denominator;
        divFrac.denominator = denominator * f.numerator;
        divFrac.reduce();
        return divFrac;
    }
    
    static func +(x:Fraction , y:Fraction) -> Fraction{
        return x.add(y);
    }

    static func -(x:Fraction , y:Fraction) -> Fraction{
        return x.subtract(y);
    }
    
    static func *(x:Fraction , y:Fraction) -> Fraction{
        return x.multiply(y);
    }
    
    static func /(x:Fraction , y:Fraction) -> Fraction{
        return x.divide(y);
    }
    
    static func ==(x:Fraction, y:Fraction) -> Bool{
        var test: Bool = false;
        if(x.numerator == y.numerator && x.denominator == y.denominator){
            test = true;
        }
        return test;
    }
    
    init(_ numerator: Int, over denominator: Int){
        self.numerator = numerator;
        self.denominator = denominator;
    }
    
    init() {}
    
    func setTo(numerator: Int, over denominator: Int){
        self.numerator = numerator;
        self.denominator = denominator;
    }
    
    func print(){
        Swift.print("\(numerator)/\(denominator)");
    }
    
    func toDouble() -> Double {
        return Double(numerator) / Double(denominator);
    }
    
    func reduce(){
        var u = abs(numerator);
        var v = denominator
        var r: Int
        while(v != 0){
            r = u % v; u = v; v = r;
        }
        numerator /= u;
        denominator /= u;
    }
}

//3.b  Write test code to test each of the new methods of the class with different input values.

let f1 = Fraction(1, over: 2);
let f2 = Fraction(1, over: 4);
let f3 = Fraction(2, over: 3);
let f4 = Fraction(3, over: 5);

let testf1 = f1 + f2; // 1/2 + 1/4 = 3/4
let testf2 = testf1 - f2; // 3/4 - 1/4 = 1/2
let testf3 = f3 * f4; // 2/3 * 3/5 = 2/5
let testf4 = testf3 / f4; //2/4 / 3/5 = 2/3
let testf5 = f3 + f4; // 2/3 + 3/5 = 19/15
let testf6 = testf5 - f3; //19/15 - 2/3 = 3/5
let testf7 = f1 * f2; // 1/2 * 1/4 = 1/8
let testf8 = testf7 / f1; // 1/8 / 1/2 = 1/4


print("\nTesting Fraction Class:");
if(testf1 == Fraction(3, over:4)){
    print("Correct! Passed Addition Test #1");
    testf1.print();
} else{
    print("Wrong! Failed Addition Test #1");
}

if(testf5 == Fraction(19, over:15)){
    print("Correct! Passed Addition Test #2");
    testf5.print();
} else{
    print("Wrong! Failed Addition Test #2");
}

if(testf2 == f1){
    print("Correct! Passed Subtraction Test #1");
    testf2.print();
} else{
    print("Wrong! Failed Subtraction Test #1");
}

if(testf6 == f4){
    print("Correct! Passed Subtraction Test #2");
    testf6.print();
} else{
    print("Wrong! Failed Subtraction Test #2");
}

if(testf3 == Fraction(2, over:5)){
    print("Correct! Passed Multiplication Test #1");
    testf3.print();
} else{
    print("Wrong! Failed Multiplication Test #1");
}

if(testf7 == Fraction(1, over:8)){
    print("Correct! Passed Multiplication Test #2");
    testf7.print();
} else{
    print("Wrong! Failed Multiplication Test #2");
}

if(testf4 == f3){
    print("Correct! Passed Division Test #1");
    testf4.print();
} else{
    print("Wrong! Failed Division Test #1");
}

if(testf8 == f2){
    print("Correct! Passed Division Test #2");
    testf8.print();
} else{
    print("Wrong! Failed Division Test #2");
}





