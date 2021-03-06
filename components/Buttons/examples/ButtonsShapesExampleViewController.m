/*
 Copyright 2018-present the Material Components for iOS authors. All Rights Reserved.

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

#import "MDCButtonColorThemer.h"
#import "MDCButtonTypographyThemer.h"
#import "MaterialButtons.h"
#import "MaterialShapes.h"
#import "MaterialShapeLibrary.h"
#import "MaterialTypography.h"
#import "supplemental/ButtonsTypicalUseSupplemental.h"

@interface ButtonsShapesExampleViewController ()
@property(nonatomic, strong) MDCFloatingButton *floatingButton;
@end

@implementation ButtonsShapesExampleViewController

- (MDCButton *)buildCustomStrokedButton {
  MDCButton *button = [[MDCButton alloc] init];
  [button setBorderWidth:1.0 forState:UIControlStateNormal];
  [button setBorderColor:[UIColor colorWithWhite:0.1f alpha:1] forState:UIControlStateNormal];
  return button;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  MDCSemanticColorScheme *colorScheme = [[MDCSemanticColorScheme alloc] init];
  MDCTypographyScheme *typographyScheme = [[MDCTypographyScheme alloc] init];

  self.view.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1];
  UIColor *titleColor = [UIColor whiteColor];

  // Raised button

  MDCRaisedButton *raisedButton = [[MDCRaisedButton alloc] init];
  [raisedButton setTitle:@"Add To Cart" forState:UIControlStateNormal];
  [MDCButtonTypographyThemer applyTypographyScheme:typographyScheme toButton:raisedButton];

  UIImage *plusImage = [UIImage imageNamed:@"Plus"];
  plusImage = [plusImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
  [raisedButton setImage:plusImage forState:UIControlStateNormal];
  [raisedButton setTitleColor:
      [UIColor colorWithRed:71/255.0f green:50/255.0f blue:50/255.0f alpha:1]
                     forState:UIControlStateNormal];
  raisedButton.imageView.tintColor =
      [UIColor colorWithRed:71/255.0f green:50/255.0f blue:50/255.0f alpha:1];
  [raisedButton setBackgroundColor:
      [UIColor colorWithRed:242/255.0f green:174/255.0f blue:178/255.0f alpha:1]];

  MDCRectangleShapeGenerator *raisedShapeGenerator =
      [[MDCRectangleShapeGenerator alloc] init];
  [raisedShapeGenerator setCorners:[[MDCCutCornerTreatment alloc] initWithCut:8.f]];
  raisedButton.shapeGenerator = raisedShapeGenerator;

  [raisedButton sizeToFit];
  [raisedButton addTarget:self
                   action:@selector(didTap:)
         forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:raisedButton];

  // Disabled raised button

  MDCRaisedButton *disabledRaisedButton = [[MDCRaisedButton alloc] init];
  [disabledRaisedButton setTitle:@"Disabled" forState:UIControlStateNormal];
  [MDCButtonTypographyThemer applyTypographyScheme:typographyScheme toButton:disabledRaisedButton];
  [MDCButtonColorThemer applySemanticColorScheme:colorScheme toRaisedButton:disabledRaisedButton];

  MDCRectangleShapeGenerator *disabledRaisedShapeGenerator =
      [[MDCRectangleShapeGenerator alloc] init];
  MDCCurvedCornerTreatment *curvedCorners = [[MDCCurvedCornerTreatment alloc] init];
  curvedCorners.size = CGSizeMake(10, 30);
  [disabledRaisedShapeGenerator setCorners:curvedCorners];
  disabledRaisedButton.shapeGenerator = disabledRaisedShapeGenerator;

  [disabledRaisedButton sizeToFit];
  [disabledRaisedButton addTarget:self
                           action:@selector(didTap:)
                 forControlEvents:UIControlEventTouchUpInside];
  [disabledRaisedButton setEnabled:NO];
  [self.view addSubview:disabledRaisedButton];

  // Flat button

  MDCFlatButton *flatButton = [[MDCFlatButton alloc] init];
  [flatButton setTitle:@"Oval Flat" forState:UIControlStateNormal];
  [MDCButtonTypographyThemer applyTypographyScheme:typographyScheme toButton:flatButton];
  [MDCButtonColorThemer applySemanticColorScheme:colorScheme toFlatButton:flatButton];

  MDCPillShapeGenerator *flatShapeGenerator = [[MDCPillShapeGenerator alloc] init];
  flatButton.shapeGenerator = flatShapeGenerator;

  [flatButton sizeToFit];
  [flatButton addTarget:self
                 action:@selector(didTap:)
       forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:flatButton];

  // Custom stroked button

  MDCButton *strokedButton = [self buildCustomStrokedButton];
  [strokedButton setTitle:@"Button" forState:UIControlStateNormal];
  [MDCButtonTypographyThemer applyTypographyScheme:typographyScheme toButton:strokedButton];
  [MDCButtonColorThemer applySemanticColorScheme:colorScheme toButton:strokedButton];

  MDCSlantedRectShapeGenerator *strokedShapeGenerator =
      [[MDCSlantedRectShapeGenerator alloc] init];
  strokedShapeGenerator.slant = 10.f;
  strokedButton.shapeGenerator = strokedShapeGenerator;

  [strokedButton sizeToFit];
  [strokedButton addTarget:self
                    action:@selector(didTap:)
          forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:strokedButton];

  // Disabled custom stroked button

  MDCButton *disabledStrokedButton = [self buildCustomStrokedButton];
  [disabledStrokedButton setTitle:@"Button" forState:UIControlStateNormal];
  [MDCButtonTypographyThemer applyTypographyScheme:typographyScheme toButton:disabledStrokedButton];
  [MDCButtonColorThemer applySemanticColorScheme:colorScheme toButton:disabledStrokedButton];

  MDCRectangleShapeGenerator *disabledStrokedShapeGenerator =
      [[MDCRectangleShapeGenerator alloc] init];
  [disabledStrokedShapeGenerator setTopEdge:
      [[MDCTriangleEdgeTreatment alloc] initWithSize:5 style:MDCTriangleEdgeStyleCut]];
  [disabledStrokedShapeGenerator setTopLeftCorner:[[MDCCutCornerTreatment alloc] initWithCut:10]];
  [disabledStrokedShapeGenerator setTopRightCorner:
      [[MDCCurvedCornerTreatment alloc] initWithSize:CGSizeMake(5, 20)]];
  [disabledStrokedShapeGenerator setBottomEdge:
      [[MDCTriangleEdgeTreatment alloc] initWithSize:5 style:MDCTriangleEdgeStyleHandle]];
  [disabledStrokedShapeGenerator setBottomRightCorner:
      [[MDCCutCornerTreatment alloc] initWithCut:5]];
  [disabledStrokedShapeGenerator setBottomLeftCorner:
      [[MDCCurvedCornerTreatment alloc] initWithSize:CGSizeMake(10, 5)]];
  disabledStrokedButton.shapeGenerator = disabledStrokedShapeGenerator;

  [disabledStrokedButton sizeToFit];
  [disabledStrokedButton addTarget:self
                            action:@selector(didTap:)
                  forControlEvents:UIControlEventTouchUpInside];
  [disabledStrokedButton setEnabled:NO];
  [self.view addSubview:disabledStrokedButton];

  // Floating action button

  self.floatingButton = [[MDCFloatingButton alloc] init];
  [self.floatingButton setTitleColor:titleColor forState:UIControlStateNormal];
  self.floatingButton.imageView.tintColor = UIColor.whiteColor;
  [self.floatingButton setImage:plusImage forState:UIControlStateNormal];
  [self.floatingButton sizeToFit];

  MDCRectangleShapeGenerator *floatingShapeGenerator = [[MDCRectangleShapeGenerator alloc] init];
  [floatingShapeGenerator setCorners:
      [[MDCCutCornerTreatment alloc] initWithCut:CGRectGetWidth(self.floatingButton.bounds) / 2.f]];
  self.floatingButton.shapeGenerator = floatingShapeGenerator;

  [self.floatingButton addTarget:self
                          action:@selector(didTap:)
                forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:self.floatingButton];

  self.buttons = @[
    raisedButton, disabledRaisedButton, flatButton, strokedButton,
    disabledStrokedButton, self.floatingButton
  ];

  [self setupShapeExampleViews];
}

- (void)setupShapeExampleViews {
  UILabel *raisedButtonLabel = [self addLabelWithText:@"Raised: Cut Corners"];
  UILabel *disabledRaisedButtonLabel = [self addLabelWithText:@"Disabled Raised: Curved Cut"];
  UILabel *flatButtonLabel = [self addLabelWithText:@"Flat: Oval Ink"];
  UILabel *strokedButtonLabel = [self addLabelWithText:@"Stroked: Triangular"];
  UILabel *disabledStrokedButtonLabel = [self addLabelWithText:@"Stroked Disabled: Freeform"];
  UILabel *floatingDiamondLabel = [self addLabelWithText:@"Floating Action: Diamond"];

  self.labels = @[
    raisedButtonLabel, disabledRaisedButtonLabel, flatButtonLabel, strokedButtonLabel,
    disabledStrokedButtonLabel, floatingDiamondLabel
  ];
}

- (void)didTap:(id)sender {
  NSLog(@"%@ was tapped.", NSStringFromClass([sender class]));
  if (sender == self.floatingButton) {
    [self.floatingButton
          collapse:YES
        completion:^{
          dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)),
                         dispatch_get_main_queue(), ^{
                           [self.floatingButton expand:YES completion:nil];
                         });
        }];
  }
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  if (animated) {
    [self.floatingButton collapse:NO completion:nil];
  }
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  if (animated) {
    [self.floatingButton expand:YES completion:nil];
  }
}

@end
