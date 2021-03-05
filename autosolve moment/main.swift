//
//  main.swift
//  autosolve moment
//
//  Created by Pradyun Setti on 5/03/21.
//

import Foundation

class Force {
    var mag, xComponent, yComponent, angle, pDist: Double
    
    init(mag: Double, angle: Double, pDist: Double) {
        self.mag = mag //magnitude of vector
        self.angle = angle //angle of vector in degrees !!FROM POS X AXIS!!
        self.pDist = pDist //perpendicular distance to pivot
        self.xComponent = 0
        self.yComponent = 0
        CalcComponents()
    }
    
    func CalcComponents() {
        self.angle = (self.angle * Double.pi / 180) //convert into radians for swift
        
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
    }
}

var Forces = [Force]() //creates empty array of forces

while true {
    print("Enter the new Force's magnitude: ")
    let newMag = Double(readLine() ?? "0")!
    
    print("Enter the new Force's angle, in degrees, from posX axis: ")
    let newAngle = Double(readLine() ?? "0")!
    
    print("Enter the new Force's perpendicular distance from the pivot: ")
    let newpDist = Double(readLine() ?? "0")!
    
    Forces.append(Force(mag: newMag, angle: newAngle, pDist: newpDist))
        
    print("Add another Force? (y/n): ")
    if readLine() == "n" {
        break
    }
}

var sumX: Double = 0
var sumY: Double = 0
for i in 0...Forces.count - 1 {
    sumX += Forces[i].xComponent.roundToPlaces(toPlaces: 3)
    sumY += Forces[i].yComponent.roundToPlaces(toPlaces: 3)
}

print("X: \(sumX)\nY: \(sumY)")
