<p align="center">
<b>DSTextView</b> is to get rid of placeholder and its color issue of UITextView of UIKit in swift 5.1. It privide most of the delegate methods to use TextView and also gives you character count. You can set placeholder from Interface Builder.
</p>

<br/>

<p align="center" >
<img src="https://github.com/dsinha999/DSTextView/blob/master/screenshot.png?raw=true" alt="DateScrollPicker" title="DSTextView">
</p>

# DSTexView

- [x] Awesome UITextView
- [x] Get Characters count
- [x] Set color of the placeholder
- [x] Set placeholder in interface builder
- [x] Easy usage
- [x] Supports iOS, written in Swift 5


## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [UIView in your xib / storyboard](#uiviewinyourxib/storyboard)
  - [Properties](#properties)
  - [Delegates](#delegates)
- [Author](#author)
- [License](#license)


## Installation

DSTextView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile and run `pod install`:

```ruby
pod 'DSTextView'
```

Then you can import it when you need

```swift
import DSTextView
```

## Usage

In the example you will see a textview with placeholder that can be customized and used in your project. Once you've installed the pod, follow next steps. It's really simple:

### UIView in your xib / storyboard

Add a `UIView` in the xib where you want to place DSTextView. Then you have to input the class name in the view, you can change this in the identity inspector of the interface builder. Remember to input `DSTextView` in both (Class & Module)


Then, connect the IBOutlet in your UIViewController

```swift
@IBOutlet weak var textView: DSTextView!
```

### Properties

You can set properties of `DSTextView` on your requirement. 
 
```swift

        textView.padding = 12 // Same padding will be used for all sides | by default padding is 12
        textView.font = UIFont.systemFont(ofSize: 15) // Font for placeholder and DSTextView | by defaulr system font of size 15
        textView.editingAllowed = true // Editing is allowed or not | by default allowed
        textView.emojiAllowed = true // Emojis are allowed or not | by default allowed
        textView.maxLength = 200 // Max length of text | default is 200
        textView.returnKeyType = .default // Return type of the keyboard
        textView.keyboardType = .default // Keyboard type of the DSTextView
        textView.showDoneButton = true // Show toolbar or not with done button to dismiss DSTextView
        // Designable Properties
        textView.placeholder = "Write Something..." // Placeholder Text
        textView.placeholderColor = UIColor(white: 0.6, alpha: 1.0) // Placeholder Text
        textView.textColor = UIColor(white: 0.1, alpha: 1.0) // DSTextView Color
        textView.delegate = self // You can set through Storyboard also
```


### Implement  delegate

The first way to customize this `DSTextView` is implementing delegate. These methods handle the most common use cases. Both of them are optional. You can set delegate through storyboard itself.

```swift
textView.delegate = self
```

### Delegates

In order to add more functionality in your app, you must implement `DSTextViewDelegate `.

```swift
// Called when typing is started
func dsTextViewDidChange(_ textView: UITextView)
func dsTextViewDidEndEditing(_ textView: UITextView)
func dsTextViewDidBeginEditing(_ textView: UITextView)
func dsTextViewCharactersCount(_ count: Int)```


## Author

Dharmendra Sinha, dsinha6193@gmail.com


## License

DSTextView is available under the MIT license. See the LICENSE file for more info.

