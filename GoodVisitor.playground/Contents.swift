//Good Visitor

//: Playground - noun: a place where people can play

import UIKit

//visit upon
// Visit... this is a visiter that can accept x. this should be able to accept lots of things.
protocol PresidentVisitor {
  func visit(president: PresidentTruman)
  func visit(president: PresidentTrump)
  func visit(president: PresidentObama)
}


//this is just type stuff. because we do this once we don't
protocol PresidentElement {
  func allow(_ visitor: PresidentVisitor)
}

class PresidentTruman: PresidentElement {
  func allow(_ visitor: PresidentVisitor) {
    visitor.visit(president: self)
  }
}

class PresidentObama: PresidentElement {
  func allow(_ visitor: PresidentVisitor) {
    visitor.visit(president: self)
  }
}

class PresidentTrump: PresidentElement {
  func allow(_ visitor: PresidentVisitor) {
    visitor.visit(president: self)
  }
}

//core responsibility
class SmackVisitor: PresidentVisitor {
  var intensity: Int = 0
  
  func visit(president: PresidentTruman) { intensity = 5 }
  func visit(president: PresidentTrump) { intensity = 5000 }
  func visit(president: PresidentObama) { intensity = 0 }
}

class HugVisitor: PresidentVisitor {
  var intensity: Int = 0
  
  func visit(president: PresidentTruman) { intensity = 10 }
  func visit(president: PresidentTrump) { intensity = 20 }
  func visit(president: PresidentObama) { intensity = 1000 }
}

let presidents: [PresidentElement] = [PresidentTrump(), PresidentTruman(), PresidentObama()]

let worthIt = presidents.map { (prez) -> Int in
  let smackAttack = SmackVisitor()
  prez.allow(smackAttack)
  return smackAttack.intensity > 4 ? smackAttack.intensity : 0
}

worthIt
