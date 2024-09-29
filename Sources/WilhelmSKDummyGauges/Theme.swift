//
//  File.swift
//  WilhelmSKDummyGauges
//
//  Created by Scott Bender on 9/28/24.
//

import Foundation
import SwiftUI

extension Color {
  public static func wSKbackground(_ theme: Theme) -> Color
  {
    return Color(theme.backgroundHighlightColor)
  }

  public static func wSKbackgroundHighlight(_ theme: Theme) -> Color
  {
    return Color(theme.backgroundHighlightColor)
  }
    
  public static func wSKtext(_ theme: Theme) -> Color
  {
    return Color(theme.textColor)
  }
  
  public static func wSKvalueLabel(_ theme: Theme) -> Color
  {
    return Color(theme.valueLabelColor)
  }
  
  public static func wSKswitch(_ theme: Theme) -> Color
  {
    return Color(theme.switchColor)
  }
  
  public static func wSKfusionDisplayView(_ theme: Theme) -> Color
  {
    return Color(theme.fusionDisplayViewColor)
  }
  
  public static func wSKmutedText(_ theme: Theme) -> Color
  {
    return Color(theme.mutedTextColor)
  }
  
  public static func wSKgood(_ theme: Theme) -> Color
  {
    return Color(theme.goodColor)
  }
  
  public static func wSKwarning(_ theme: Theme) -> Color
  {
    return Color(theme.warningColor)
  }
  
  public static func wSKbad(_ theme: Theme) -> Color
  {
    return Color(theme.badColor)
  }
  
  public static func wSKgaugeBorder(_ theme: Theme) -> Color
  {
    return Color(theme.gaugeBorderColor)
  }
}

@available(iOS 17, *)
extension ShapeStyle where Self == Color {
  
  public static func wSKtext(_ theme: Theme ) -> Color
  {
    return Color.wSKtext(theme)
  }
  /*
  public static var wSKText: Color  { get {
    return  Color.red
  }}
   */
}

@available(iOS 17, *)
public struct TextColorShapeStyle: ShapeStyle {
  public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
    Color.wSKtext(environment.theme)
    //Color.white
  }
}

/*
@available(iOS 17, *)
public struct TextColorShapeStyle: ShapeStyle {
  public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
    Color.wSKtext(environment.theme)
    //Color.white
  }
}
 */


private enum ThemeType {
  case light
  case dark
  case red
  case blue
}

open class Theme : NSObject, ObservableObject {
  fileprivate init(_ type: ThemeType)
  {
    digitalFontName = "Segment7Standard"
    switch type
    {
    case .light:
      gaugeColorAlpha = 1.0
      textAlpha = 1.0
      backgroundColor = UIColor.white
      backgroundHighlightColor = UIColor.init(white: 0.8, alpha:1)
      textColor =  UIColor.black
      valueLabelColor = textColor;
      switchColor = UIColor.init(white:0.75, alpha:1)
      fusionDisplayViewColor = Self.RGB(0, 122, 255)
      whiteText = false
      nightMode = false
      isRed = false
      
      mutedTextColor = UIColor.lightGray
      goodColor = Self.RGB(27, 202, 33)
      warningColor = Self.RGB(232, 231, 33);
      badColor = Self.RGB(231, 32, 43);
      //buttonColorName = "black"
      isLight = true
      gaugeBorderColor = mutedTextColor
      
      useSegmented7DigitalFont = true
      
    case .red:
      gaugeColorAlpha = 0.50;
      textAlpha = 0.55;
      whiteText = true
      nightMode = true
      backgroundColor = UIColor.black
      backgroundHighlightColor = UIColor.init(white:0.1, alpha:1)
      textColor = UIColor.red.withAlphaComponent(CGFloat(textAlpha))
      valueLabelColor = textColor;
      switchColor = UIColor.black
      mutedTextColor = UIColor.red.withAlphaComponent(0.30)
      goodColor = Self.RGB(27, 202, 33).withAlphaComponent(CGFloat(gaugeColorAlpha))
      warningColor = Self.RGB(232, 231, 33).withAlphaComponent(CGFloat(gaugeColorAlpha))
      badColor = Self.RGB(255, 0, 0)
      fusionDisplayViewColor = mutedTextColor
      gaugeBorderColor = mutedTextColor
      isRed = true
      useSegmented7DigitalFont = true
      isLight = false
      /*
       case .blue:
       case .dark:
       */
      
    default:
      gaugeColorAlpha = 1.0;
      textAlpha = 1.0;
      whiteText = true
      nightMode = false
      isLight = false
      isRed = false
      backgroundColor = UIColor.black;
      backgroundHighlightColor = UIColor.init(white: 0.1, alpha:1)
      textColor = UIColor.white
      valueLabelColor = textColor;
      switchColor = UIColor.init(white:0.75, alpha:1)
      fusionDisplayViewColor = Self.RGB(0, 122, 255)
      mutedTextColor = UIColor.darkGray
      goodColor = Self.RGB(27, 202, 33)
      warningColor = Self.RGB(232, 231, 33)
      badColor = Self.RGB(231, 32, 43)
      gaugeBorderColor = mutedTextColor;
      useSegmented7DigitalFont = true
    }
  }
  
  public var backgroundHighlightColor : UIColor
  public var textColor : UIColor
  public var valueLabelColor: UIColor
  public var switchColor :  UIColor
  public var fusionDisplayViewColor :  UIColor
  public var mutedTextColor :  UIColor
  public var goodColor :  UIColor
  public var warningColor :  UIColor
  public var badColor :  UIColor
  public var gaugeBorderColor :  UIColor

  public var whiteText: Bool
  public var nightMode: Bool
  public var backgroundColor : UIColor
  public var gaugeColorAlpha : Float
  public var textAlpha : Float
   
  public var isLight: Bool
  public var isRed: Bool
  public var useSegmented7DigitalFont: Bool
   
  var digitalFontName : String
      
  private static let _lightTheme: Theme = Theme(.light)
  private static let _darkTheme: Theme = Theme(.dark)
  private static let _redTheme: Theme = Theme(.red)
  private static let _defaultTheme: Theme = _darkTheme

  public static func dark() -> Theme
  {
    return _darkTheme
  }
  
  public static func light() -> Theme
  {
    return _lightTheme
  }
  
  public static func red() -> Theme
  {
    return _redTheme
  }

  public static func theDefault() -> Theme
  {
    return _defaultTheme
  }

  private static func RGB(_ red: Int, _ green: Int, _ blue: Int) -> UIColor
  {
    return UIColor.init(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
  }
     
  /*
\
   Theme *theme = [[self alloc] init];
   
   theme.name = @"Dark";
   theme.gaugeColorAlpha = 1.0;
   theme.textAlpha = 1.0;
   theme.whiteText = YES;
   theme.backgroundColor = [COLOR_TYPE blackColor];
   theme.backgroundHighlightColor = [COLOR_TYPE colorWithWhite:0.1 alpha:1];
   theme.textColor = [COLOR_TYPE whiteColor];
   theme.needleColor = RED_NEEDLE; //[COLOR_TYPE redColor];
   theme.secondNeedleColor = [COLOR_TYPE greenColor];
   theme.thirdNeedleColor = [COLOR_TYPE blueColor];
   theme.scaleDivisionColor = theme.textColor;
   theme.scaleSubDivisionColor = theme.textColor;
   theme.valueLabelColor = theme.textColor;
   theme.switchColor = [UIColor colorWithWhite:0.75 alpha:1];
   theme.fusionDisplayViewColor = RGB(0, 122, 255);
   theme.mutedTextColor = [UIColor darkGrayColor];
   theme.goodColor = RGB(27, 202, 33);
   theme.warningColor = RGB(232, 231, 33);
   theme.badColor = RGB(231, 32, 43);
   theme.buttonColorName = @"white";
   theme.gaugeBorderColor = theme.mutedTextColor;
   theme.trackColor = [UIColor darkGrayColor];
   theme.routeColor = [UIColor yellowColor];
   theme.courseVectorColor = [UIColor redColor];
   theme.twaVectorColor = [UIColor greenColor];
   theme.awaVectorColor = [UIColor yellowColor];
   
   #if !TARGET_OS_WATCH
   #if !TARGET_OS_TV && !TARGET_OS_OSX
   theme.preferredStatusBarStyle = UIStatusBarStyleLightContent;
   #endif
   theme.refreshButtonImageName = @"recurring_appointment_white";
   theme.settingsButtonImageName = @"automatic";
   theme.infoButtonImageName = @"info-white";
   #endif
   
   theme.showShadowOnDigitalGauges = YES;
   theme.useSegmented7DigitalFont = YES;
   
   [theme reloadDefaults];
   dark = theme;
   
   return theme;
   }
   
   + (instancetype)blueTheme
   {
   if ( blue )
   {
   return blue;
   }
   
   Theme *theme = [[self alloc] init];
   
   UIColor *baseColor = RGB(0, 122, 255);
   
   theme.name = @"Blue";
   theme.gaugeColorAlpha = 0.85;
   theme.textAlpha = 0.55;
   theme.whiteText = YES;
   theme.nightMode = NO;
   theme.backgroundColor = [COLOR_TYPE blackColor];
   theme.backgroundHighlightColor = [COLOR_TYPE colorWithWhite:0.1 alpha:1];
   theme.textColor = [COLOR_TYPE whiteColor];
   theme.needleColor = baseColor;
   theme.secondNeedleColor = [COLOR_TYPE greenColor];
   theme.thirdNeedleColor = RED_NEEDLE; //[COLOR_TYPE blueColor];
   theme.scaleDivisionColor = theme.textColor;
   theme.scaleSubDivisionColor = theme.textColor;
   theme.valueLabelColor = theme.textColor;
   theme.switchColor = theme.textColor;
   theme.mutedTextColor = [baseColor colorWithAlphaComponent:0.30];
   theme.goodColor = [baseColor colorWithAlphaComponent:theme.gaugeColorAlpha];
   //theme.goodColor = baseColor;
   theme.warningColor = [RGB(232, 231, 33) colorWithAlphaComponent:theme.gaugeColorAlpha];
   //theme.badColor = [RGB(231, 32, 43) colorWithAlphaComponent:theme.gaugeColorAlpha];
   //theme.badColor = RGB(231, 32, 43);
   theme.badColor = RGB(255, 0, 0);
   //theme.fusionDisplayViewColor = theme.backgroundColor;
   theme.fusionDisplayViewColor = baseColor;
   theme.gaugeBorderColor = [COLOR_TYPE darkGrayColor];
   theme.trackColor = [UIColor darkGrayColor];
   theme.routeColor = [UIColor yellowColor];
   theme.courseVectorColor = [UIColor redColor];
   theme.twaVectorColor = [UIColor greenColor];
   theme.awaVectorColor = [UIColor yellowColor];
   
   theme.buttonColorName = @"white";
   //theme.isRed = YES;
   
   #if !TARGET_OS_WATCH
   #if !TARGET_OS_TV && !TARGET_OS_OSX
   theme.preferredStatusBarStyle = UIStatusBarStyleLightContent;
   #endif
   theme.refreshButtonImageName = @"recurring_appointment_white";
   theme.settingsButtonImageName = @"automatic";
   theme.infoButtonImageName = @"info-white";
   #endif
   
   theme.showShadowOnDigitalGauges = YES;
   theme.useSegmented7DigitalFont = YES;
   
   [theme reloadDefaults];
   blue = theme;
   
   return theme;
   }
   
   */
}
