//
//  common.swift
//  autosolve moment
//
//  Created by Pradyun Setti on 5/03/21.
//  https://github.com/breadone/AutosolveMoments

import Foundation

//<prefs>
public var precision: Int = 2 //dp of answer, default is 2
public var showComponents: Bool = true //whether or not to show the force components in the final answer, default is true
//</prefs>

public var π = Double.pi

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
} //source: https://stackoverflow.com/questions/27338573/rounding-a-double-value-to-x-number-of-decimal-places-in-swift

