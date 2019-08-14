// For more details see here:
// https://marcosantadev.com/fake-appdelegate-unit-testing-swift/

import UIKit

private let isRunningTests = NSClassFromString("XCTestCase") != nil
private let appDelegateClass = isRunningTests ? nil : NSStringFromClass(AppDelegate.self)
private let arguments = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self,
                                                                                   capacity: Int(CommandLine.argc))

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)
