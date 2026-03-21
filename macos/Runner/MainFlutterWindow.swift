import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // Window configuration
    self.title = "IPTV Player"
    self.minSize = NSSize(width: 900, height: 550)
    self.setContentSize(NSSize(width: 1280, height: 720))
    self.center()

    // macOS window style
    self.titlebarAppearsTransparent = false
    self.isMovableByWindowBackground = false
    self.styleMask.insert(.resizable)
    self.styleMask.insert(.miniaturizable)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
