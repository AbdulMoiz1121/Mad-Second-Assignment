// Make sure this package name matches your project's package name
package com.companyname.ch12_platform_channel 

import android.os.Build // Import the Build class [cite: 431]
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel // Import MethodChannel [cite: 431]
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) { [cite: 361]
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    // Create the MethodChannel with the same name as the client [cite: 437, 441]
    val deviceInfoChannel = MethodChannel(flutterView, "platformchannel.companyname.com/deviceinfo")

    // Set the MethodCallHandler [cite: 442, 446]
    deviceInfoChannel.setMethodCallHandler { call, result ->
      // Check if the method name matches 'getDeviceInfo' [cite: 447]
      if (call.method == "getDeviceInfo") {
        val deviceInfo = getDeviceInfo() // Call the helper method [cite: 448]
        result.success(deviceInfo) [cite: 449]
      } else {
        // Return not implemented if method name doesn't match [cite: 450-451]
        result.notImplemented()
      }
    }
  }

  // Helper method to get device info [cite: 453, 457]
  private fun getDeviceInfo(): String {
    // Build and return the device info string [cite: 454-456]
    return ("\nDevice: " + Build.DEVICE [cite: 458]
            + "\nManufacturer: " + Build.MANUFACTURER [cite: 459]
            + "\nModel: " + Build.MODEL [cite: 460-462]
            + "\nProduct: " + Build.PRODUCT [cite: 463]
            + "\nVersion Release: " + Build.VERSION.RELEASE [cite: 464]
            + "\nVersion SDK: " + Build.VERSION.SDK_INT [cite: 465]
            + "\nFingerprint: " + Build.FINGERPRINT) [cite: 466]
  }
}