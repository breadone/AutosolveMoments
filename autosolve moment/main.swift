//
//  main.swift
//  autosolve moment
//
//  Created by Pradyun Setti on 5/03/21.
//

import Foundation

class Force {
    var mag, xComponent, yComponent, angle, dDist, xDist, yDist: Double
    
    init(mag: Double, angle: Double, dDist: Double) {
        self.mag = mag //magnitude of vector
        self.angle = angle //angle of vector in degrees !!FROM POS X AXIS!!
        self.dDist = dDist //direct distance to pivot
        self.xComponent = 0
        self.yComponent = 0
        self.xDist = 0
        self.yDist = 0
        CalcComponents()
    }
    
    func CalcComponents() {
        self.angle = (self.angle * π / 180) //convert into radians for swift
        
        switch self.angle {
        case 0...π/2: //A quadrant
            self.xComponent = (self.mag * cos(self.angle))
            self.yComponent = (self.mag * sin(self.angle))
        case π/2...π://S Quadrant
            let rAngle = π - self.angle
            self.xComponent = -(self.mag * cos(rAngle))
            self.yComponent = (self.mag * sin(rAngle))
        case π...(3/2) * π://T Quadrant
            let rAngle = π - self.angle
            self.xComponent = -(self.mag * cos(rAngle))
            self.yComponent = -(self.mag * sin(rAngle))
        case (3/2) * π...2*π://C Quadrant
            let rAngle = 2*π - self.angle
            self.xComponent = (self.mag * cos(rAngle))
            self.yComponent = -(self.mag * sin(rAngle))
        default:
            print("invalid angle")
        }
        
        self.xDist = self.dDist * cos(self.angle)
        self.yDist = self.dDist * sin(self.angle)
    }
}

var Forces = [Force]() //creates empty array of forces

while true { //inputs force(s)
    print("Enter the new Force's magnitude: ", terminator: "")
    let newMag = Double(readLine() ?? "0")!
    
    print("Enter the new Force's angle, in degrees, from posX axis: ", terminator: "")
    let newAngle = Double(readLine() ?? "0")!
    
    print("Enter the new Force's direct distance from the pivot: ", terminator: "")
    let newdDist = Double(readLine() ?? "0")!
    
    Forces.append(Force(mag: newMag, angle: newAngle, dDist: newdDist))
        
    print("Add another Force? (y/n): ", terminator: "")
    if readLine() == "n" {
        break
    }
}

var sumX: Double = 0
var sumY: Double = 0
for i in 0...Forces.count - 1 {
    sumX += Forces[i].xComponent * Forces[i].yDist
    sumY += Forces[i].yComponent * Forces[i].xDist
}
print("-------")
print("∑X: \(sumX.roundToPlaces(toPlaces: 2))\n∑Y: \(sumY.roundToPlaces(toPlaces: 2))\nTotal: \((sumX+sumY).roundToPlaces(toPlaces: 3))")
