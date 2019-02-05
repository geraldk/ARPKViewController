//
//  ViewController.swift
//  ARPKViewController
//
//  Created by Gerald Kim on 4/2/19.
//  Copyright © 2019 ARPlaykit. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    let config = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        sceneView.session.run(config)
        sceneView.autoenablesDefaultLighting = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "TestTableViewController")
        let testNode = UIViewControllerNode(width: 0.2, height: 0.4, viewController: viewController)
        guard let pointOfView = sceneView.pointOfView else { return }
        let transform = pointOfView.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let frontPositionOfCamera = orientation + location
        testNode.position = frontPositionOfCamera
        sceneView.scene.rootNode.addChildNode(testNode)
    }
}

func +(lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
}

