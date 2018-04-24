# Description
Demonstrates how to dynamically change the text color of a UIBarButtonItem.

# Why?
The reason for this project is because of a difference in iOS 10 and iOS 11. In
iOS 10, to change the text color of a UIBarButtonItem was intuitive:

```swift
 override func viewDidLoad() {
  super.viewDidLoad()
  
  let barButtonItem = UIBarButtonItem(
      title: "Say Hello",
      style: .plain,
      target: self, 
      action: #selector(barButtonItemAction(_:)
      )
  )

  navigationItem.setRightBarButton(barButtonItem, animated: true)

  // Style the bar button item
  let attributes: [NSAttributedStringKey: Any] = [.foregroundColor: UIColor.gray]

  barButtonItem.setTitleTextAttributes(attributes, for: .normal)
}

// Change the text color of the bar button item when a UISwitch is toggled.
@IBAction func toggleAction(_ sender: UISwitch) {
  // Get the right bar button item.
  guard let barButtonItem = navigationItem.rightBarButtonItem else {
      assertionFailure("Expected a bar button item")
      return
  }

  let color: UIColor = sender.isOn ? .green : .gray
  let attributes: [NSAttributedStringKey: Any] = [.foregroundColor: color]

  // This works in iOS 10
  barButtonItem.setTitleTextAttributes(attributes, for: .normal)
}
```

But, in iOS 11, the code above doesn't work. I failed to find documentation
to detail why.

The best solution I've found which works on both iOS 10 and 11 is to create a
new UIBarButtonItem when any properties (i.e. the text color) change.
