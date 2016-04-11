# VISPERS-Wireframe-Protocol

[![License](https://img.shields.io/cocoapods/l/VISPERS-Wireframe-Protocol.svg?style=flat)](http://cocoapods.org/pods/VISPERS-Wireframe-Protocol)
[![Platform](https://img.shields.io/cocoapods/p/VISPERS-Wireframe-Protocol.svg?style=flat)](http://cocoapods.org/pods/VISPERS-Wireframe-Protocol)


The wireframe is the powerful thing that wires the view controllers in your VISPERS app together. It takes an NSURL and some parameters, talks to the components that create your view controllers (the ControllerProvider) which create the view controller connected to this URL, and gives it to those components which are responsible for presenting your controller (the ControllerRoutingPresenter).

The wireframe is responsible for navigating to the next view controller and communicates with the presenter layer.


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

VISPERS-Wireframe-Protocol is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "VISPERS-Wireframe-Protocol"
```

## Author

Jan Bartel, barteljan@yahoo.de

## License

VISPERS-Wireframe-Protocol is available under the MIT license. See the LICENSE file for more info.
