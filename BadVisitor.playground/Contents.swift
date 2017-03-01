//Bad Visitor

//: Playground - noun: a place where people can play

import UIKit

// Visit... this is a visiter that can accept x
protocol PresidentSmacker {
  func smack(president: PresidentTruman)
  func smack(president: PresidentTrump)
  func smack(president: PresidentObama)
}

//this is just type stuff
protocol President {
  func allow(smacker: PresidentSmacker)
}

class PresidentTruman: President {
  func allow(smacker: PresidentSmacker) {
    smacker.smack(president: self)
  }
}

class PresidentObama: President {
  func allow(smacker: PresidentSmacker) {
    smacker.smack(president: self)
  }
}

class PresidentTrump: President {
  func allow(smacker: PresidentSmacker) {
    smacker.smack(president: self)
  }
}

class SmackLevel: PresidentSmacker {
  var intensity: Int = 0
  
  func smack(president: PresidentTruman) { intensity = 5 }
  func smack(president: PresidentTrump) { intensity = 5000 }
  func smack(president: PresidentObama) { intensity = 0 }
}

let presidents: [President] = [PresidentTrump(), PresidentTruman()]

let worthIt = presidents.map { (prez) -> Int in
  let smackAttack = SmackLevel()
  prez.allow(smacker: smackAttack)
  return smackAttack.intensity > 4 ? smackAttack.intensity : 0
}

worthIt
