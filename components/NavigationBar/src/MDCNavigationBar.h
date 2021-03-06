/*
 Copyright 2016-present the Material Components for iOS authors. All Rights Reserved.

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

#import <UIKit/UIKit.h>

@protocol MDCButtonBarDelegate;

/** Specifies the title alignment of the |MDCNavigationBar|. */
typedef NS_ENUM(NSInteger, MDCNavigationBarTitleAlignment) {
  /** Aligns the title to the center of the NavigationBar. */
  MDCNavigationBarTitleAlignmentCenter,
  /** Aligns the title to the left/leading of the NavigationBar. */
  MDCNavigationBarTitleAlignmentLeading
};

/**
 This protocol defines all of the properties on UINavigationItem that can be listened to by
 MDCNavigationBar.
 */
@protocol MDCUINavigationItemObservables <NSObject>
@required

@property(nonatomic, copy, nullable) NSString *title;
@property(nonatomic, strong, nullable) UIView *titleView;
@property(nonatomic) BOOL hidesBackButton;
@property(nonatomic, copy, nullable) NSArray<UIBarButtonItem *> *leftBarButtonItems;
@property(nonatomic, copy, nullable) NSArray<UIBarButtonItem *> *rightBarButtonItems;
@property(nonatomic) BOOL leftItemsSupplementBackButton;
@property(nonatomic, strong, nullable) UIBarButtonItem *leftBarButtonItem;
@property(nonatomic, strong, nullable) UIBarButtonItem *rightBarButtonItem;

@end

@class MDCNavigationBar;

/**
  The MDCNavigationBarTextColorAccessibilityMutator class creates an external object with which to
  work on an instance of a Material Navigation Bar to activate and ensure accessibility on its title
  and buttons.

  ### Dependencies

  Material NavigationBarTextColorAccessibilityMutator depends on the Navigation Bar material
  component and MDFTextAccessibility Framework.
  */

@interface MDCNavigationBarTextColorAccessibilityMutator : NSObject

/**
 Initializes and returns a newly created accessibility mutator
 */
- (nonnull instancetype)init;

/**
  Mutates title text color and navigation items' tint colors based on background color of
  navigation bar.
  */
- (void)mutate:(nonnull MDCNavigationBar *)navBar;

@end

/**
 The MDCNavigationBar class is a view consisting of a leading and trailing button bar, title label,
 and an optional title view.

 This view is not designed to have subviews added to it except via through its declared properties
 (e.g. titleView).
 */
IB_DESIGNABLE
@interface MDCNavigationBar : UIView

#pragma mark Behavior

/* Title displayed in the bar if titleView is unset. */
@property(nonatomic, copy, nullable) NSString *title;

/**
 The title view layout differs from the traditional behavior of UINavigationBar.

 Due to MDCNavigationBar being able to expand vertically, the titleView's height is updated to match
 any changes in the MDCNavigationBar's height.

 You may wish to create a container view that is able to manage subview layout if your situation
 requires it.
 */
@property(nonatomic, strong, nullable) UIView *titleView;

/**
 The font applied to the title of navigation bar.
 Font size is enforced to 20.
 Both Default and null_resettable value is MDCTypography's titleFont.
 Note that the font attribute of titleTextAttributes will take precedence over this property.
 */
@property(nonatomic, strong, null_resettable) UIFont *titleFont;

/**
 The title label's text color.

 Default is nil (text draws black).
 */
@property(nonatomic, strong, nullable) UIColor *titleTextColor;

/**
 The inkColor that is used for all buttons in trailing and leading button bars.

 If set to nil, button bar buttons use default ink color.
 */
@property(nonatomic, strong, nullable) UIColor *inkColor;

/**
 Sets the title font for the given state for all buttons.

 @param font The font that should be displayed on text buttons for the given state.
 @param state The state for which the font should be displayed.
 */
- (void)setButtonsTitleFont:(nullable UIFont *)font forState:(UIControlState)state;

/**
 Returns the font set for @c state that was set by setButtonsTitleFont:forState:.

 If no font has been set for a given state, the returned value will fall back to the value
 set for UIControlStateNormal.

 @param state The state for which the font should be returned.
 @return The font associated with the given state.
 */
- (nullable UIFont *)buttonsTitleFontForState:(UIControlState)state;

/** The back button to be displayed, if any. */
@property(nonatomic, strong, nullable) UIBarButtonItem *backItem;

/*  If YES, this navigation bar will hide the back button. */
@property(nonatomic) BOOL hidesBackButton;

/* Use these properties to set multiple items in a navigation bar.
 The single properties (leadingBarButtonItem and trailingBarButtonItem) refer to the first item in
 the respective array of items.

 NOTE: You'll achieve the best results if you use either the singular properties or the plural
 properties consistently and don't try to mix them.

   leadingBarButtonItems are placed in the navigation bar from the leading edge to the trailing edge
 with the first item in the list at the leading outside edge and leading aligned.
   trailingBarButtonItems are placed from the trailing edge to the leading edge with the first item
 in the list at the trailing outside edge and trailing aligned.
 */
@property(nonatomic, copy, nullable) NSArray<UIBarButtonItem *> *leadingBarButtonItems;
@property(nonatomic, copy, nullable) NSArray<UIBarButtonItem *> *trailingBarButtonItems;

/* By default, the leadingItemsSupplementBackButton property is NO. In this case, the back button is
 not drawn and the leading item or items replace it. If you would like the leading items to appear
 in addition to the back button (as opposed to instead of it) set leadingItemsSupplementBackButton
 to YES.
 */
@property(nonatomic) BOOL leadingItemsSupplementBackButton;

/*
 Use these when you want to display a custom leading or trailing item in this navigation bar.
 A custom leading item replaces the regular back button unless you set
 leadingItemsSupplementBackButton to YES.
 */
@property(nonatomic, strong, nullable) UIBarButtonItem *leadingBarButtonItem;
@property(nonatomic, strong, nullable) UIBarButtonItem *trailingBarButtonItem;

/**
 The horizontal text alignment of the navigation bar title. Defaults to
 MDCNavigationBarTitleAlignmentLeading.
 */
@property(nonatomic) MDCNavigationBarTitleAlignment titleAlignment;

#pragma mark Observing UINavigationItem instances

/**
 Begin observing changes to the provided navigation item.

 Only one navigation item instance can be observed at a time. Observing a second navigation item
 will stop observation of the first navigation item.

 Once execution returns from this method the receiver's state will match that of the newly-observed
 navigation item.

 The observed navigation item is strongly held.
 */
- (void)observeNavigationItem:(nonnull UINavigationItem *)navigationItem;

/**
 Stop observing changes to the previously-observed navigation item.

 Does nothing if no navigation item is being observed.
 */
- (void)unobserveNavigationItem;

#pragma mark UINavigationItem interface matching

/* Equivalent to leadingBarButtonItems. */
@property(nonatomic, copy, nullable) NSArray<UIBarButtonItem *> *leftBarButtonItems;

/* Equivalent to trailingBarButtonItems. */
@property(nonatomic, copy, nullable) NSArray<UIBarButtonItem *> *rightBarButtonItems;

/* Equivalent to leadingBarButtonItem. */
@property(nonatomic, strong, nullable) UIBarButtonItem *leftBarButtonItem;

/* Equivalent to trailingBarButtonItem. */
@property(nonatomic, strong, nullable) UIBarButtonItem *rightBarButtonItem;

/* Equivalent to leadingItemsSupplementBackButton. */
@property(nonatomic) BOOL leftItemsSupplementBackButton;

#pragma mark - To be deprecated

/**
 Makes the navigation bar use flexible top and bottom insets for buttons and titles, by vertically
 positioning them based on the height of the navigation bar. Default insets do not allow the height
 of the navigation bar to be set to anything less than 56.0f, so this property has to be set to YES
 in that case.
 
 When this is set to YES, the custom titleView is aligned with the button bars and has the same
 height as them, regardless of the height of the navigation bar. This allows vertically aligning the
 content of the titleView with the buttons, by vertically centering the content of the titleView.
 
 Default is NO.
 
 NOTE: This property will be deprecated and the YES behavior will replace the current behavior.
 All clients who rely on the titleView should set this to YES and implement proper alignment before
 deprecation.
 */
@property(nonatomic) BOOL useFlexibleTopBottomInsets;

/**
 Display attributes for the titleView's title text.

 Font attribute will take precedence over titleFont property.
 Setting this property will render an NSAttributedString with the assigned attributes across the
 entire text.

 Note: this property will be deprecated in future, please use titleFont and titleTextColor instead.
 */
#if defined(__IPHONE_11_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0)
@property(nonatomic, copy, nullable)
    NSDictionary<NSAttributedStringKey, id> *titleTextAttributes UI_APPEARANCE_SELECTOR;
#else
@property(nonatomic, copy, nullable)
    NSDictionary<NSString *, id> *titleTextAttributes UI_APPEARANCE_SELECTOR;
#endif

#pragma mark - Deprecated

/** The text alignment of the navigation bar title. Defaults to NSTextAlignmentLeft. */
@property(nonatomic) NSTextAlignment textAlignment __deprecated_msg("Use titleAlignment instead.");

@end
