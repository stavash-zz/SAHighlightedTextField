//
//  SAHighlightedTextField.h
//  SAHighlightedTextField
//
//  Created by Stav Ashuri on 6/19/13.
//  Copyright (c) 2013 Zemingo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAHighlightedTextField : UITextField

- (void)configureWithBackgroundImage:(UIImage *)bgImage andHighlightedImage:(UIImage *)highlightedImage withResizeCapInsets:(UIEdgeInsets)insets;

@property (assign, nonatomic) CGSize textInsets;
@property (assign, nonatomic) CGPoint textOffset;

@end
