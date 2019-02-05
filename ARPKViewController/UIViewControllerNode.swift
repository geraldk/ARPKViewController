//
//  ARPKViewControllerNode.swift
//  ARPKViewController
//
//  Created by Gerald Kim on 4/2/19.
//  Copyright © 2019 ARPlaykit. All rights reserved.
//

import Foundation
import SceneKit
import UIKit

class UIViewControllerNode: SCNNode {
    let viewController: UIViewController

    init(width: CGFloat, height: CGFloat,
         viewController: UIViewController,
         billboard: Bool = true) {
        self.viewController = viewController
        super.init()
        let plane = SCNPlane(width: width, height: height)
        self.geometry = plane
        self.geometry?.firstMaterial?.diffuse.contents = viewController.view
        if billboard {
            let yFreeConstraint = SCNBillboardConstraint()
            yFreeConstraint.freeAxes = .Y
            self.constraints = [yFreeConstraint]
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError("ARPKViewController Coder Not Implemented") }
}
