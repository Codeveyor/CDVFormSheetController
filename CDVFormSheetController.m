//
//  CDVFormSheetController.m
//  Qvout
//
//  Created by Alex Golub on 12/14/15.
//  Copyright © 2015 alex. All rights reserved.
//

#import "CDVFormSheetController.h"

@interface CDVFormSheetController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *additionalView;

@property (nonatomic, strong) UIImageView *bottomDismissImage;

@property (nonatomic, strong) UITapGestureRecognizer *backgroundTapGestureRecognizer;

@end

static const CGFloat kButtonSideLength = 45.0f;
static const CGFloat kBackgroundAlphaValue = 0.3f;
static const CGFloat kBottomButtonBottomSpace = 20.0f;

@implementation CDVFormSheetController

#pragma mark - View Lifecycle

- (instancetype)initWithCustomBackgroundWithViewController:(UIViewController *)presentedFormSheetViewController
{
    if (self == [super initWithViewController:presentedFormSheetViewController])
    {
        self.additionalView = [[UIView alloc]initWithFrame:self.formSheetWindow.frame];
        self.additionalView.backgroundColor = [UIColor blackColor];
        self.additionalView.alpha = kBackgroundAlphaValue;
        [self.formSheetWindow addSubview:self.additionalView];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                 action:@selector(handleTapGestureRecognizer:)];
    self.backgroundTapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.backgroundTapGestureRecognizer];
}

#pragma mark - Gestures

- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint touchPoint = [tapGestureRecognizer locationInView:tapGestureRecognizer.view];
    CGRect dismissImageRect = self.bottomDismissImage.frame;
    
    NSLog(@"%@", NSStringFromCGPoint(touchPoint));

    if (CGRectContainsPoint(dismissImageRect, touchPoint))
    {
        [self dismissImageDidFired];
    }
}

#pragma mark - UI Elements

- (void)setupBottomCancelAction
{    
    self.bottomDismissImage = [[UIImageView alloc]initWithFrame:CGRectMake((self.additionalView.frame.size.width / 2) - (kButtonSideLength / 2),
                                                                              self.additionalView.frame.size.height - kButtonSideLength - kBottomButtonBottomSpace,
                                                                              kButtonSideLength,
                                                                              kButtonSideLength)];
    [self.bottomDismissImage setImage:[UIImage imageNamed:@"modal_cancel"]];
    [self.additionalView addSubview:self.bottomDismissImage];
}

#pragma mark - Actions

- (void)dismissImageDidFired
{
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:nil];
}

@end
