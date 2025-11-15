import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool { [cite: 192-196]

    // Get the FlutterViewController [cite: 288-289]
    let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController

    // Create the FlutterMethodChannel with the same name as the client [cite: 290, 293]
    let deviceInfoChannel = FlutterMethodChannel(name: "platformchannel.companyname.com/deviceinfo",
                                               binaryMessenger: flutterViewController)

    // Set the MethodCallHandler [cite: 294, 298]
    deviceInfoChannel.setMethodCallHandler({
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in [cite: 299]
      
      // Check if the method name matches 'getDeviceInfo' [cite: 300]
      if (call.method == "getDeviceInfo") {
        // Call the helper method to get info [cite: 301]
        self.getDeviceInfo(result: result)
      } else {
        // Return not implemented if method name doesn't match [cite: 303-304]
        result(FlutterMethodNotImplemented)
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Helper method to get device info [cite: 307-308]
  private func getDeviceInfo(result: FlutterResult) {
    let device = UIDevice.current [cite: 316]
    var deviceInfo: String = "" [cite: 317]
    
    // Build the device info string [cite: 312-314, 318]
    deviceInfo = "\nName: \(device.name)" [cite: 318]
    deviceInfo += "\nModel: \(device.model)" [cite: 320]
    deviceInfo += "\nSystem: \(device.systemName) \(device.systemVersion)" [cite: 321-322]
    deviceInfo += "\nProximity Monitoring Enabled: \(device.isProximityMonitoringEnabled)" [cite: 323-324]
    deviceInfo += "\nMultitasking Supported: \(device.isMultitaskingSupported)" [cite: 326]
    
    // Return the result to Flutter [cite: 326]
    result(deviceInfo)
  }
}