import android.bluetooth.BluetoothAdapter
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "bluetooth_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Set up the method channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "enableBluetooth") {
                enableBluetooth(result)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun enableBluetooth(result: MethodChannel.Result) {
        val bluetoothAdapter: BluetoothAdapter? = BluetoothAdapter.getDefaultAdapter()
        if (bluetoothAdapter != null) {
            if (!bluetoothAdapter.isEnabled) {
                bluetoothAdapter.enable()
                result.success("Bluetooth enabled")
            } else {
                result.success("Bluetooth is already enabled")
            }
        } else {
            result.error("BLUETOOTH_UNAVAILABLE", "Bluetooth is not available on this device", null)
        }
    }
}
