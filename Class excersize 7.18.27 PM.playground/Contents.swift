import Foundation
var captains: [String: String] = ["kirk": "ncc1701", "sisko": "nx74205", "janeway": "ncc74656", "picard": "ncc1701d"]

var firstOfficers: [String: String] = ["spock": "ncc1701", "kira": "nx74205", "chakotay": "ncc74656", "riker": "ncc1701d", "tpol": "nx01"]

var vulcanOfficers: [String] = ["spock", "tuvok", "tpol"]

var humanOfficers: [String] = ["sisko", "kirk", "picard", "chakotay", "janeway", "riker", "seven"]

var femaleOfficers: [String] = ["kira", "dax", "tpol", "janeway", "troi", "seven"]

/*:
First, a set of warm-up problems for everyone
*/
// Q0: How many human officers are there?

let numOfHumanOfficers = humanOfficers.count
print(numOfHumanOfficers)


// Q1: What percentage of humans are female?

let females = humanOfficers.filter{femaleOfficers.contains($0)}
let percent = Float(females.count)/Float(numOfHumanOfficers) * 100
print(percent)


// Q2: How many first officers are human?

let firstOff = firstOfficers.filter{humanOfficers.contains($0.key)}
print(firstOff.count)




// Q3: Get a list of females sorted by name

let femalesSorted = femaleOfficers.sorted()
print(femalesSorted)


/*:
 Given the following struct and some methods to make these objects comparable, answer the questions in the sets below
 */
struct Officer: Comparable {
  var name: String
  var ship: String
  
  init(name: String, ship: String){
    self.name = name
    self.ship = ship
  }

  // To make this struct conform to Equatable protocol
  // Note that since matching all properties, this would
  // have been given automatically when made Equatable
  static func ==(lhs: Officer, rhs: Officer) -> Bool {
    return lhs.name == rhs.name && lhs.ship == rhs.ship
  }
  
  // To make this struct conform to Comparable protocol
  static func <(lhs: Officer, rhs: Officer) -> Bool {
    return lhs.name < rhs.name
  }
}

/*:
Group 1
*/
// Q4: Create an array of officer objects who captain starships

let allCaptains: [Officer] = captains.map{Officer(name: $0, ship:$1)}
print(allCaptains.map{$0.name})


// Q5: Alphabetize the previous list by the captain's name

let alphab = captains.map{ Officer(name: $0, ship:$1)}.sorted()
print(alphab.map{$0.name})


/*:
Group 2
*/
// Q6: Create an array of officers serving as first officers who are also Vulcan


let first: [Officer] = firstOfficers.map{Officer(name: $0, ship:$1)}
let vulcans = first.filter{vulcanOfficers.contains($0.name)}
print(vulcans.map{$0.name})


// Q7: How many these Vulcan first officers have names shorter than 5 characters?

let vulcansLessFive = vulcans.map{$0.name.count < 5}
print(vulcansLessFive.filter{$0 != false}.count)




