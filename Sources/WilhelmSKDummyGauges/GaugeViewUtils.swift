//
//  File.swift
//  WilhelmSKDummyGauges
//
//  Created by Scott Bender on 9/27/24.
//

import SwiftUI
import WilhelmSKLibrary

@available(iOS 17, *)
extension GaugeConfig {
  open func getObservableSelfPath(_ boat: WilhelmSKLibrary.SignalKBase, path: String?, source: String? = nil) -> ObservedObject<SKValue> {
    guard let path else {
      let dummy = WilhelmSKLibrary.SKValue(SKPathInfo("xsome.path", meta: nil), value: 0.0)
      return ObservedObject(wrappedValue:dummy)
    }
    return ObservedObject(wrappedValue:boat.getObservableSelfPath(path, source: source))
  }
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
