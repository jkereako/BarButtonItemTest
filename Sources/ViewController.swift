//
//  ViewController.swift
//  BarButtonItemTest
//
//  Created by Jeff Kereakoglow on 4/23/18.
//  Copyright © 2018 AlexisDigital. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var toggle: UISwitch!

    private let offColor = UIColor.gray
    private let onColor = UIColor.green

    init() {
        super.init(nibName: "View", bundle: Bundle(for: ViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Always start in the off-position
        toggle.isOn = false

        // Define the color of the navigation bar
        navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.isTranslucent = true

        let barButtonItem = UIBarButtonItem(
            title: "Say Hello",
            style: .plain,
            target: self, action: #selector(barButtonItemAction(_:))
        )

        navigationItem.setRightBarButton(barButtonItem, animated: true)

        // Style the bar button item
        let attributes: [NSAttributedStringKey: Any] = [.foregroundColor: offColor]

        barButtonItem.setTitleTextAttributes(attributes, for: .normal)
    }
}

// MARK: - Target-actions
extension ViewController {
    @IBAction func toggleAction(_ sender: UISwitch) {
        guard let barButtonItem = navigationItem.rightBarButtonItem else {
            assertionFailure("Expected a bar button item")
            return
        }

        let color: UIColor = sender.isOn ? onColor : offColor
        let attributes: [NSAttributedStringKey: Any] = [.foregroundColor: color]

        barButtonItem.setTitleTextAttributes(attributes, for: .normal)
    }

    @IBAction func barButtonItemAction(_ sender: UISwitch) {
        let alertController = UIAlertController(
            title: "Hello!", message: "Hello", preferredStyle: .alert
        )

        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        present(alertController, animated: true)
    }
}

