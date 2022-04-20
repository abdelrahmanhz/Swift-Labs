import Cocoa

// Task 1
func getFactorial(number: Int) -> Int{
    if(number <= 1) {return number}
    return number * getFactorial(number: number - 1)
}

print(getFactorial(number: 5))

// Task 2 - recursion
func clacPower(base: Int, power: Int) -> Int{
    if(power <= 0) {return 1}
    return base * clacPower(base: base, power: power - 1)
}

print(clacPower(base: 5, power: 2))


// Task 2 - loop
func calcPowerLoop(base: Int, power: Int) -> Int{
    var result = 1
    if(power <= 0) {return 1}
    for _ in 1...power {
        result *= base
    }
    return result
}

print(calcPowerLoop(base: 5, power: 2))

// Task 3
func sortArray(nums: inout [Int]){
    for index in 1..<nums.count{
        var currentIndex = index
        while currentIndex > 0 && nums[currentIndex] < nums[currentIndex - 1] {
            nums.swapAt(currentIndex - 1, currentIndex)
            currentIndex -= 1
        }
    }
}
var nums : [Int] = [1, 7 , 3, 8 , 11, -7, 0, 5]
sortArray(nums: &nums)
print(nums)

// Task 4
func calMinAndMax(nums : [Int]) -> (min: Int, max: Int)?{
    if(nums.isEmpty) {return nil}
    var currentMin = nums[0]
    var currentMax = nums[0]
    for num in nums[1..<nums.count] {
        if(num < currentMin){currentMin = num}
        else if(num > currentMax){currentMax = num}
    }
    return (currentMin, currentMax)
}
print(calMinAndMax(nums: nums) ?? "empty array")

// Task 5
func swap(num1: inout Int, num2: inout Int){
    let temp = num1
    num1 = num2
    num2 = temp
}

var num1 = 5
var num2  = -7
print("before swapping: \(num1) \(num2)")
swap(num1: &num1, num2: &num2)
print("after swapping: \(num1) \(num2)")

