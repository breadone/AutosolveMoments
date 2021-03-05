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
        self.angle = angle //angle of vector !!FROM POS X AXIS!!
        self.pDist = pDist //perpendicular distance to pivot
        self.xComponent = 0
        self.yComponent = 0
        CalcComponents()
    }
    
    func CalcComponents() {
        switch self.angle {
        case ...90:
            self.xComponent = self.mag * cos(self.angle)
            self.yComponent = self.mag * cos(self.angle)
        case 90...180:
            let rAngle = 180 - self.angle
            self.xComponent = -(self.mag * cos(rAngle))
            self.yComponent = self.mag * sin(rAngle)
        case 180...270:
            let rAngle = 180 - self.angle //not sure about this one xx
            self.xComponent = -(self.mag * cos(rAngle))
            self.yComponent = -(self.mag * sin(rAngle))
        case 270...360:
            let rAngle = 360 - self.angle
            self.xComponent = self.mag * cos(rAngle)
            self.yComponent = -(self.mag * sin(rAngle))
        default:
            print("invalid angle")
        }
    }
}

