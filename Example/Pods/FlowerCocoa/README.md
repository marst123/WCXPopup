# FlowerCocoa

[![CI Status][image-1]][1]
[![Version][image-2]][2]
[![License][image-3]][3]
[![Platform][image-4]][4]



FlowerCocoa is a set of UIKit-based control libraries that I independently encapsulate with reference to Rx's notation, and its core relies on link.

## Design idea

Before the design, I always think that the syntax and freedom at the code level is the initial design idea. Swift provides me with such convenience, and I need to make it more convenient.

```
<!--original-->

let label = UILabel()
label.text = name
label.textColor = color
```

```
<!--chain-->

let label = UILabel().text(name).textColor(color)
```

Using chain, you don't need to regenerate the current object for setting the attribute. Although we know who this object is, it is clearly simplified, but it is not perfect.

This is my original idea. I just want to start the UI through the chain call and define the attributes to make things simple. Then I realized that in practice, I still need them to communicate with each other.
Therefore, the most important thing is to insert other attributes with the \`link ''. Through a generic "link" layer, I can define new characters within the range allowed by nsobject without being restrained by which role (reference, RX).

It is like a multifunctional plug that can be compatible with different characteristics of different brands, but it also has the same characteristics, reminding me not only for UIKIT, but even the CA and Quartzcore frameworks.

This is a very simple library that makes the UI definition as simple as possible. In any case, this is simple, and this is enough.

## Features

- [x] Based on `link` access to UI, support custom expansion.
-  [x] Low learning cost, easier to get started.
- [x] Clean code separation.
- [x] Special Label: GradientLayerlabel，InsetLabel，TextLayerLabel
- [x] High playability😜

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 13.0+
- Swift 5.0+
- CocoaPods

## Installation

FlowerCocoa is available through [CocoaPods][5]. To install
it, simply add the following line to your Podfile:

```ruby
pod 'FlowerCocoa'
```

## Method Chaining

**You need to evoke it:** 

```
UIView().link
			.bgColor(.white)
			.isUserInteractionEnabled(true)
			.base

UILabel().link
			.text("FlowerCocoa")
			.titleColor(.hex("#000000"))
			.font(.regular(12))
			.lines(0)
			.alignment(.justified)
			.base

UIButton().link
			.stateNormal({$0.title("FlowerCocoa")})
			.isEnabled(true)
			.setTag(tag: 10000)
			.base

```

It wraps `Moisture` so it will be lighter and more focused on itself, we just need to make the initialization scene more convenient via chaining.

## Author

marst123, tianlan2325@qq.com

## License

FlowerCocoa is available under the MIT license. See the LICENSE file for more info.

[1]:	https://travis-ci.org/marst123/FlowerCocoa
[2]:	https://cocoapods.org/pods/FlowerCocoa
[3]:	https://cocoapods.org/pods/FlowerCocoa
[4]:	https://cocoapods.org/pods/FlowerCocoa
[5]:	https://cocoapods.org

[image-1]:	https://img.shields.io/travis/marst123/FlowerCocoa.svg?style=flat
[image-2]:	https://img.shields.io/cocoapods/v/FlowerCocoa.svg?style=flat
[image-3]:	https://img.shields.io/cocoapods/l/FlowerCocoa.svg?style=flat
[image-4]:	https://img.shields.io/cocoapods/p/FlowerCocoa.svg?style=flat