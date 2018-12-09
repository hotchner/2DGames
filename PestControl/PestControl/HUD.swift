//
//  HUD.swift
//  PestControl
//
//  Created by 马红奇 on 2018/12/8.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import SpriteKit

enum HUDSettings {
  static let font = "Noteworthy-Bold"
  static let fontSize: CGFloat = 50
}

class HUD: SKNode {
  var timerLabel: SKLabelNode?
  
  override init() {
    super.init()
    name = "HUD"
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func add(message: String, position: CGPoint, fontSize: CGFloat = HUDSettings.fontSize) {
    let label = SKLabelNode(fontNamed: HUDSettings.font)
    label.text = message
    label.name = message
    label.fontSize = HUDSettings.fontSize
    label.zPosition = 100
    addChild(label)
    label.position = position
  }
  
  func addTimer(time: Int) {
    guard let scene = scene else { return }
    let position = CGPoint(x: 0, y: scene.frame.height / 2 - 10)
    add(message: "Timer", position: position, fontSize: 24)
    timerLabel = childNode(withName: "Timer") as? SKLabelNode
    timerLabel?.verticalAlignmentMode = .top
    timerLabel?.fontName = "Menlo"
    updateTimer(time: time)
  }
  
  func updateTimer(time: Int) {
    let minutes = (time / 60) % 60
    let seconds = time % 60
    let timerText = String(format: "%02d:%02d", minutes, seconds)
    timerLabel?.text = timerText
  }
}
