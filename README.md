# ReSwiftRx

ReSwiftRx is an extension for [ReSwift](https://github.com/ReSwift/ReSwift) that provides a method
    to create a [RxSwift](https://github.com/ReactiveX/RxSwift)'s observable sequence of states from a Store.

[![Version](https://img.shields.io/cocoapods/v/ReSwiftRx.svg?style=flat)](http://cocoapods.org/pods/ReSwiftRx)
[![License](https://img.shields.io/cocoapods/l/ReSwiftRx.svg?style=flat)](http://cocoapods.org/pods/ReSwiftRx)
[![Platform](https://img.shields.io/cocoapods/p/ReSwiftRx.svg?style=flat)](http://cocoapods.org/pods/ReSwiftRx)

## Example

### `asObservable()`
Following the example explained in [ReSwift](https://github.com/ReSwift/ReSwift#about-reswift):
```js

let mainStore = Store<AppState>(
    reducer: CounterReducer(),
    state: nil
)
//subscribe to store's events
let disposable = mainStore.asObservable()
	.subscribe(onNext: { state in
    	//reflect the app state into views
    })

```

## Requirements

## Installation

ReSwiftRx is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReSwiftRx"
```

## Author

Vincenzo Scamporlino, vinz.scamporlino@gmail.com

## License

ReSwiftRx is available under the MIT license. See the LICENSE file for more info.
