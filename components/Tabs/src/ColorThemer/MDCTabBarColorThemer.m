/*
 Copyright 2017-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MDCTabBarColorThemer.h"

static const CGFloat kUnselectedOpacity = 0.6f;

@implementation MDCTabBarColorThemer

+ (void)applySemanticColorScheme:(nonnull id<MDCColorScheming>)colorScheme
                          toTabs:(nonnull MDCTabBar *)tabBar {
  tabBar.barTintColor = colorScheme.primaryColor;
  tabBar.tintColor = colorScheme.onPrimaryColor;
  tabBar.selectedItemTintColor = colorScheme.onPrimaryColor;
  tabBar.unselectedItemTintColor =
      [colorScheme.onPrimaryColor colorWithAlphaComponent:kUnselectedOpacity];
}

+ (void)applySurfaceVariantWithColorScheme:(nonnull id<MDCColorScheming>)colorScheme
                                    toTabs:(nonnull MDCTabBar *)tabBar {
  tabBar.barTintColor = colorScheme.surfaceColor;
  tabBar.tintColor = colorScheme.primaryColor;
  tabBar.selectedItemTintColor = colorScheme.primaryColor;
  tabBar.unselectedItemTintColor =
      [colorScheme.onSurfaceColor colorWithAlphaComponent:kUnselectedOpacity];
}

+ (void)applyColorScheme:(id<MDCColorScheme>)colorScheme
                toTabBar:(MDCTabBar *)tabBar {
  if ([colorScheme respondsToSelector:@selector(primaryLightColor)]) {
    tabBar.unselectedItemTintColor = colorScheme.primaryLightColor;
    tabBar.inkColor = colorScheme.primaryLightColor;
  }
  if ([colorScheme respondsToSelector:@selector(primaryDarkColor)]) {
    tabBar.selectedItemTintColor = colorScheme.primaryDarkColor;
  }
}

@end
