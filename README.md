# WCXPopup


### What is WCXPopup
This is the core view of a custom pop-up window, which supports animation display and hiding, and supports scene interpretation in four directions: up, down, left, and right.
#### Uniqueness
Identifier defines uniqueness

#### Animation
Rich entry and exit animations

#### Size
In addition to automatically constraining margins, following WCXPopupDelegate can also define height

[![CI Status][image-1]][1]
[![Version][image-2]][2]
[![License][image-3]][3]
[![Platform][image-4]][4]


## Installation

To install **WCXPopup**, add the following line to your `Podfile`:

```ruby
pod 'WCXPopup'
```

Then run:

```bash
pod install
```

### Usage

```swift
import WCXPopup

WCXPopupManager.shared.showPopup(
        type: .bottom, 
        hideType: .slideToBottom, 
        contentView: bottomView, 
        identifier: "VIEW_", 
        delegate: self, 
        isTapGestureMaskView: true)

func popupViewContentHeight(_ identifier: String) -> CGFloat {

}
```

### Share
My understanding of encapsulation is to focus on doing one thing purely. If the process is perfect, there is no need to let it carry more. I provide a WCXPopup component with pop-up window as the core. You can use it to define your own content and give full play to your imagination.

## Requirements

- iOS 13.0+
- Swift 5.0+
- CocoaPods

## Contributing

We welcome contributions! If you have any suggestions or improvements, feel free to fork the repository and submit a pull request.

## Author

marst123, tianlan2325@qq.com

## License

**WCXPopup** is available under the MIT license. See the [LICENSE][5] file for more details.

[1]:	https://travis-ci.org/marst123/WCXPopup
[2]:	https://cocoapods.org/pods/WCXPopup
[3]:	https://cocoapods.org/pods/WCXPopup
[4]:	https://cocoapods.org/pods/WCXPopup
[5]:	LICENSE

[image-1]:	https://img.shields.io/travis/marst123/WCXPopup.svg?style=flat
[image-2]:	https://img.shields.io/cocoapods/v/WCXPopup.svg?style=flat
[image-3]:	https://img.shields.io/cocoapods/l/WCXPopup.svg?style=flat
[image-4]:	https://img.shields.io/cocoapods/p/WCXPopup.svg?style=flat