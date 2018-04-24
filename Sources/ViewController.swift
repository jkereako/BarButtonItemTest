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

    private let barButtonItemText = "Say Hello"
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

        setRightBarButtonItem(text:barButtonItemText, textColor: offColor)
    }
}

// MARK: - Target-actions
extension ViewController {
    @IBAction func toggleAction(_ sender: UISwitch) {
        let color: UIColor = sender.isOn ? onColor : offColor
        setRightBarButtonItem(text: barButtonItemText, textColor: color)
    }

    @IBAction func barButtonItemAction(_ sender: UISwitch) {
        let alertController = UIAlertController(
            title: "Hello!", message: "Hello", preferredStyle: .alert
        )

        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

        present(alertController, animated: true)
    }
}

// MARK: - Private Helpers
private extension ViewController {
    /// Sets the right bar button item with a specified text color. For some reason, setting the
    /// text color on an existing UIBarButtonItem works in iOS 10, but not iOS 11. The solution
    /// across both versions is to always reset the UIBarButtonItem instance.
    ///
    /// - Parameter textColor: The font color of the UIBarButtonItem
    func setRightBarButtonItem(text: String, textColor: UIColor) {
        let barButtonItem = UIBarButtonItem(
            title: text,
            style: .plain,
            target: self, action: #selector(barButtonItemAction(_:))
        )

        navigationItem.setRightBarButton(barButtonItem, animated: false)

        // Style the bar button item
        let attributes: [NSAttributedStringKey: Any] = [.foregroundColor: textColor]

        barButtonItem.setTitleTextAttributes(attributes, for: .normal)
    }
}

