// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let registrar = self.registrar(forPlugin: "Echo")!
    let basicStandard = FlutterBasicMessageChannel(
      name: "dev.flutter.echo.basic.standard", binaryMessenger: registrar.messenger(),
      codec: FlutterStandardMessageCodec.sharedInstance())
    basicStandard.setMessageHandler { (input, reply) in
      reply(input)
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
