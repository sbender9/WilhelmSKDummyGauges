//
//  File.swift
//  WilhelmSKDummyGauges
//
//  Created by Scott Bender on 9/27/24.
//

import SwiftUI
import WilhelmSKLibrary

@available(iOS 17, *)
public extension GaugeConfig {
  open func getObservableSelfPath(_ boat: WilhelmSKLibrary.SignalKBase, path: String?, source: String? = nil) -> ObservedObject<SKValue> {
    guard let path else {
      let dummy = WilhelmSKLibrary.SKValue(SKPathInfo("xsome.path", meta: nil), value: 0.0)
      return ObservedObject(wrappedValue:dummy)
    }
    return ObservedObject(wrappedValue:boat.getObservableSelfPath(path, source: source))
  }
}

@available(iOS 17, *)
public extension EnvironmentValues {
  @Entry var theme: Theme = Theme.theDefault()
  @Entry var config: GaugeConfig? = nil
  @Entry var boat: SignalKBase? = nil
  @Entry var inWidget: Bool = false
}

@available(iOS 17, *)
public extension Text {
  func fitToWidth(_ fraction: CGFloat = 1.0) -> some View {
    self.modifier(FitToWidth(fraction: fraction))
  }
}

@available(iOS 17, *)
struct FitToWidth: ViewModifier {
  var fraction: CGFloat = 1.0
  func body(content: Content) -> some View {
    GeometryReader { g in
      content
        .font(.system(size: 1000))
        .minimumScaleFactor(0.005)
        .lineLimit(1)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      //.frame(width: g.size.width*self.fraction)
    }
  }
}

private func secondsToTimeString(_ input: Double?, includeHours: Bool = true) -> String
{
  guard let input else {
    return ""
  }
  var remaining = input
  var hours = 0
  var minutes = 0
  var seconds = 0
  
  
  if remaining > 60 * 60 {
    hours = Int(remaining / (60*60))
    remaining = remaining - Double(hours*60*60)
  }
  
  if remaining > 60 {
    minutes = Int(remaining / 60.0);
    remaining = remaining - Double(minutes * 60)
  }
  seconds = Int(remaining)
  
  if includeHours {
    return String(format:"%02d:%02d:%02d", hours, minutes, seconds)
  } else {
    return String(format:"%02d:%02d", minutes, seconds)
  }

}


public struct TimeText: View {
  let input: Double?
  let includeHours: Bool
  
  public init(_ input: Double?, includeHours: Bool = true) {
    self.input = input
    self.includeHours = includeHours
  }
  
  public var body: some View {
    Text(secondsToTimeString(input, includeHours: includeHours))
  }
}
