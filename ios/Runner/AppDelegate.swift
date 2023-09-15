import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "bluetoothChannel" // Update with your channel name

    private var centralManager: CBCentralManager?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    centralManager = CBCentralManager(delegate: self, queue: nil)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
    private func enableBluetooth(result: FlutterResult) {
        if let centralManager = CBCentralManager(delegate: nil, queue: nil) {
            switch centralManager.state {
            case .poweredOn:
                result("Bluetooth is already enabled")
            case .poweredOff:
                // You can display a dialog here to request enabling Bluetooth
                // Implement the dialog using native iOS code
                // For example:
                // self.showBluetoothDialog()
                result("Bluetooth is off")
            case .resetting:
                result("Bluetooth is resetting")
            case .unauthorized:
                result("Bluetooth is unauthorized")
            case .unknown:
                result("Bluetooth status is unknown")
            case .unsupported:
                result("Bluetooth is not supported")
            @unknown default:
                result("Unknown Bluetooth status")
            }
        } else {
            result("Central Manager initialization failed")
        }
    }
}
