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
        case ...90: //A quadrant
            self.xComponent = (self.mag * cos(self.angle))
            self.yComponent = (self.mag * sin(self.angle))
        case 90...180://S Quadrant
            let rAngle = 180 - self.angle
            self.xComponent = -(self.mag * cos(rAngle))
            self.yComponent = (self.mag * sin(rAngle))
        case 180...270://T Quadrant
            let rAngle = 180 - self.angle //not sure about this one xx
            self.xComponent = -(self.mag * cos(rAngle))
            self.yComponent = -(self.mag * sin(rAngle))
        case 270...360://C Quadrant
            let rAngle = 360 - self.angle
            self.xComponent = (self.mag * cos(rAngle))
            self.yComponent = -(self.mag * sin(rAngle))
        default:
            print("invalid angle")
        }
    }
}

var Forces = [Force]() //creates empty array of forces

for i in 1...10 { //limit of 10 forces for now, will prob increase in the future
    print("Add Force? (y/n): ")
    if readLine() == "n" {
        break
    }
    
    print("For Force \(i), enter it's magnitude: ")
    let mag = Double(readLine() ?? "0")!
    
    print("For Force \(i), enter it's angle, in degrees, from posX axis: ")
    let angle = Double(readLine() ?? "0")!
    
    print("For Force \(i), enter it's perpendicular distance from the pivot: ")
    let pdist = Double(readLine() ?? "0")!
    
    Forces.append(Force(mag: mag, angle: angle, pDist: pdist))
}


