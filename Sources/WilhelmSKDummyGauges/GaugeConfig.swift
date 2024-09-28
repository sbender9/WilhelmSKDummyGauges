//
//  File.swift
//  WilhelmSKDummyGauges
//
//  Created by Scott Bender on 9/27/24.
//

import Foundation
import WilhelmSKLibrary

open class GaugeConfig :NSObject {
  open var customizations: [String: Any]
  open var signalKPath: String
  open var title: String
  
  public init(_ customizations: [String : Any]) {
    self.customizations = customizations
    self.signalKPath = customizations["signalKPath"] as! String
    self.title = customizations["title"] as? String ?? ""
  }
}

open class ElectricalOverviewGauge : GaugeConfig {
  
  public override init(_ customizations: [String : Any])
  {
    super.init(customizations)
    /*
    for (key,value) in mappings {
      customizations[key] = value
    }
     */
    //self.customizations = customizations.merge(mappings) { $1 } as! [String: Any]
  }
  
  public func getPath(_ path: String) -> String? {
    return self.customizations[path] as! String
  }
  
  public func getSource(_ path: String) -> String? {
    return nil
  }
}

open class Theme : NSObject {
  override public init()
  {
  }
  
  public static func defaultTheme() -> Theme
  {
    return Theme()
  }
  
  /*
  public static func darkTheme()
  {
  
  }
  
  public static func lightTheme()
  {
  }
  
  public static func redTheme()
  {
  }
  
  public static func blueTheme()
  {
  }
   */

}
