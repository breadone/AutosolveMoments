//
//  main.swift
//  autosolve moment
//
//  Created by Pradyun Setti on 5/03/21.
//

import Foundation

class Force {
    var mag, xForce, yForce, angle, xDist, yDist: Double
    
    init(mag: Double, angle: Double, xDist: Double, yDist: Double) {
        self.mag = mag //magnitude of vector
        self.angle = angle //angle of vector in degrees !!FROM POS X AXIS!!
        self.xForce = 0 //y component of force relative to axes
        self.yForce = 0 //x component of force relative to axes
        self.xDist = xDist //x component of distance to pivot
        self.yDist = yDist //y component of distance to pivot
        CalcForceComponents()
    }
    
    func CalcForceComponents() {
        self.angle = (self.angle * π / 180) //convert into radians
        
        switch self.angle {
        case 0...π/2: //A quadrant
            self.xForce = (self.mag * cos(self.angle))
            self.yForce = (self.mag * sin(self.angle))
        case π/2...π://S Quadrant
            let rAngle = π - self.angle
            self.xForce = -(self.mag * cos(rAngle))
            self.yForce = (self.mag * sin(rAngle))
        case π...(3/2) * π://T Quadrant
            let rAngle = π - self.angle
            self.xForce = -(self.mag * cos(rAngle))
            self.yForce = -(self.mag * sin(rAngle))
        case (3/2) * π...2*π://C Quadrant
            let rAngle = 2*π - self.angle
            self.xForce = (self.mag * cos(rAngle))
            self.yForce = -(self.mag * sin(rAngle))
        default:
            print("invalid angle")
        }
    }
}

var Forces = [Force]() //creates empty array of forces

while true { //input force(s)
    print("Enter the new Force's magnitude: ", terminator: "")
    let newMag = Double(readLine() ?? "0")!
    
    print("Enter the new Force's angle, in degrees, from posX axis: ", terminator: "")
    let newAngle = Double(readLine() ?? "0")!
    
    print("Enter the new Force's x distance from the pivot: ", terminator: "")
    let newxDist = Double(readLine() ?? "0")!
    
    print("Enter the new Force's y distance from the pivot: ", terminator: "")
    let newyDist = Double(readLine() ?? "0")!
    
    Forces.append(Force(mag: newMag, angle: newAngle, xDist: newxDist, yDist: newyDist))
        
    print("Add another Force? (y/n): ", terminator: "")
    if readLine() == "n" {
        break
    }
}
//print(Forces[0].xForce, Forces[0].yForce)
var sumX: Double = 0
var sumY: Double = 0

for i in 0...Forces.count - 1 {
    sumX += (Forces[i].xForce * Forces[i].yDist)
    sumY += (Forces[i].yForce * Forces[i].xDist)
}

#if DEBUG
print(Forces[0].xForce, Forces[0].yForce)
#endif

print("--------")
print("∑X: \(sumX.roundToPlaces(toPlaces: 2))\n∑Y: \(sumY.roundToPlaces(toPlaces: 2))\nTotal: \((sumX+sumY).roundToPlaces(toPlaces: 3))")
