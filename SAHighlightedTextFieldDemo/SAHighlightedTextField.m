//
//  SAHighlightedTextField.m
//  SAHighlightedTextField
//
//  Created by Stav Ashuri on 6/19/13.
//  Copyright (c) 2013 Zemingo. All rights reserved.
//

#import "SAHighlightedTextField.h"

#define kSAHighlightedTextFieldDefaultTextInsets CGSizeMake(0.0f,0.0f)
#define kSAHighlightedTextFieldDefaultTextOffset CGPointMake(0.0f,0.0f)

typedef enum
{
    kSAHighlightedTextFieldStateNormal,
    kSAHighlightedTextFieldStateHighlighted
}SAHighlightedTextFieldState;

@interface SAHighlightedTextField()

@property (assign, nonatomic) SAHighlightedTextFieldState curState;

@property (retain, nonatomic) UIImage *normalBackgroundImage;
@property (retain, nonatomic) UIImage *highlightedBackgroundImage;

@end

@implementation SAHighlightedTextField

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    [self toggleState:kSAHighlightedTextFieldStateNormal];
    self.textInsets = kSAHighlightedTextFieldDefaultTextInsets;
    self.textOffset = kSAHighlightedTextFieldDefaultTextOffset;
}

#pragma mark - NSObject

- (void)dealloc
{
    self.normalBackgroundImage = nil;
    self.highlightedBackgroundImage = nil;
    
    [super dealloc];
}

#pragma mark - Public

- (void)configureWithBackgroundImage:(UIImage *)bgImage andHighlightedImage:(UIImage *)highlightedImage withResizeCapInsets:(UIEdgeInsets)insets
{
    self.borderStyle = UITextBorderStyleNone;
    self.normalBackgroundImage = [bgImage resizableImageWithCapInsets:insets];
    self.highlightedBackgroundImage = [highlightedImage resizableImageWithCapInsets:insets];

    [self updateView];
}

#pragma mark - Private

- (void)updateView
{
    [self toggleState:self.curState];
}

#pragma mark - ToggleState

- (void)toggleState:(SAHighlightedTextFieldState)toState
{
    switch (toState) {
        case kSAHighlightedTextFieldStateNormal:
            self.background = self.normalBackgroundImage;
            break;
        case kSAHighlightedTextFieldStateHighlighted:
            self.background = self.highlightedBackgroundImage;
            break;
        default:
            break;
    }
    self.curState = toState;
}

#pragma mark - Responder chain

- (BOOL)becomeFirstResponder
{
    BOOL result = [super becomeFirstResponder];
	
    if (result)
    {
        [self toggleState:kSAHighlightedTextFieldStateHighlighted];
    }
    return result;
}

- (BOOL)resignFirstResponder
{
    BOOL result = [super resignFirstResponder];
	
    if (result)
    {
        [self toggleState:kSAHighlightedTextFieldStateNormal];
    }
    return result;
}

#pragma mark - Insets

- (CGRect)generalInsetRectForBounds:(CGRect)bounds
{
    CGRect originalInsetRect = CGRectInset(bounds, self.textInsets.width, self.textInsets.height);
    CGRect offsetRect = CGRectOffset(originalInsetRect, self.textOffset.x, self.textOffset.y);
    CGRect finalRect = CGRectMake(offsetRect.origin.x, offsetRect.origin.y, offsetRect.size.width - self.textOffset.x, offsetRect.size.height);
    return finalRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    return [self generalInsetRectForBounds:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return [self generalInsetRectForBounds:bounds];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return [self generalInsetRectForBounds:bounds];
}


@end
