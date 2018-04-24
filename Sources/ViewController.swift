//
//  ViewController.swift
//  BarButtonItemTest
//
//  Created by Jeff Kereakoglow on 4/23/18.
//  Copyright © 2018 AlexisDigital. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    init() {
        super.init(nibName: "View", bundle: Bundle(for: ViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

// MARK: - Target-actions
extension ViewController {
    @IBAction func toggleAction(_ sender: UISwitch) {
        print("Toggled")
    }
}

