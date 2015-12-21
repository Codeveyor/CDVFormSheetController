//
//  CDVFormSheetController.h
//  Qvout
//
//  Created by Alex Golub on 12/14/15.
//  Copyright © 2015 alex. All rights reserved.
//

#import "MZFormSheetController.h"

@class CDVFormSheetController;

typedef void(^CDVFormSheetPresentationCompletionHandler)(CDVFormSheetController *formSheetController);

@interface CDVFormSheetController : MZFormSheetController

- (instancetype)initWithCustomBackgroundWithViewController:(UIViewController *)presentedFormSheetViewController;

/// setup background UI elements
- (void)setupBottomCancelAction;

@end
