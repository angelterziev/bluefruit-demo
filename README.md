# bluefruit-demo
Demoing how to use Bluefruit inside an existing obj-c project

## Checkout sources and prepare to build
From the Terminal
1. `git clone https://github.com/angelterziev/bluefruit-demo.git`
1. `cd bluefruit-demo`
1. `git submodule init`
1. `git submodule update --remote`
1. `pod install`

Then Load `BluefruitDemo.xcworkspace` into Xcode and build

## How to import swift into your Objective-C
1. Create a new Project in Objective-C
1. Create a new .swift file  
  * A popup window will appear and ask "Would You like to configure an Objective-C bridging Header".
  * Choose Yes.
1. Click on your Xcode Project file
1. Click on Build Settings
1. Find the Search bar and search for Defines Module.
1. Change value to Yes.
1. In your .m file, add the following : #import _"YourTargetName-Swift.h"_

_"YourTargetName-Swift.h"_ single file is an autogenerated header that defines Objective-C interfaces for all Swift classes in your project that are either annotated with `@objc` or inherit from `NSObject`.

By default, the generated header contains interfaces for Swift declarations marked with the public or open modifier. If your app target has an Objective-C bridging header, the generated header also includes interfaces marked with the internal modifier. Declarations marked with the private or fileprivate modifier don't appear in the generated header, and aren't exposed to the Objective-C runtime unless they are explicitly marked with a `@IBAction, @IBOutlet, or @objc` attribute. Inside unit test targets, you can access imported internal declarations as if they were public by prepending `@testable` to the product module import statement.

### Include Swift Classes in Objective-C Headers Using Forward Declarations
When declarations in an Objective-C header file refer to a Swift class or protocol that comes from the same target, importing the generated header creates a cyclical reference. To avoid this, use a forward declaration of the Swift class or protocol to reference it in an Objective-C interface.

``` Objective-C
// MyObjcClass.h
@class MySwiftClass;
@protocol MySwiftProtocol;

@interface MyObjcClass : NSObject
- (MySwiftClass *)returnSwiftClassInstance;
- (id <MySwiftProtocol>)returnInstanceAdoptingSwiftProtocol;
// ...
@end
```
