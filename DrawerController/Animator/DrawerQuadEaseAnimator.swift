//
//  DrawerQuadEaseAnimator.swift
//  KWDrawerController
//
//  Created by Kawoou on 2017. 2. 8..
//  Copyright © 2017년 Kawoou. All rights reserved.
//

import UIKit

public class DrawerQuadEaseAnimator: DrawerTickAnimator {

    // MARK: - Enum
    
    public enum EaseType {
        case easeIn
        case easeOut
        case easeInOut
        
        internal func algorithm(value: Double) -> Double {
            switch self {
            case .easeIn:
                return pow(value, 2)
            case .easeOut:
                return -(value * (value - 2))
            case .easeInOut:
                if value < 0.5 {
                    return 2 * pow(value, 2)
                } else {
                    return (-2 * pow(value, 2)) + (4 * value) - 1
                }
            }
        }
    }
    
    
    // MARK: - Property
    
    public var easeType: EaseType
    
    
    // MARK: - Public
    
    public override func tick(delta: TimeInterval, duration: TimeInterval, animations: @escaping (Float)->()) {
        
        animations(Float(self.easeType.algorithm(value: delta / duration)))
        
    }
    
    
    // MARK: - Lifecycle
    
    init(easeType: EaseType = .easeInOut) {
        self.easeType = easeType
        
        super.init()
    }
    
}
