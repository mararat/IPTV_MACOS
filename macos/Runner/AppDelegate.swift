import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationWillTerminate(_ notification: Notification) {
    // Notify Flutter engine to clean up before process exits
    if let controller = mainFlutterWindow?.contentViewController as? FlutterViewController {
      controller.engine.shutDownEngine()
    }
  }
}
