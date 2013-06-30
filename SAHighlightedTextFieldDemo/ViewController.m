//
//  ViewController.m
//  SAHighlightedTextFieldDemo
//
//  Created by Stav Ashuri on 6/30/13.
//  Copyright (c) 2013 Stav Ashuri. All rights reserved.
//

#import "ViewController.h"
#import "SAHighlightedTextField.h"

@interface ViewController ()

@property (assign, nonatomic) IBOutlet SAHighlightedTextField *tfDemo;
@property (assign, nonatomic) IBOutlet SAHighlightedTextField *tfDemo2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tfDemo configureWithBackgroundImage:[UIImage imageNamed:@"text_field"] andHighlightedImage:[UIImage imageNamed:@"text_field_editing"] withResizeCapInsets:UIEdgeInsetsMake(0.0f, 8.0f, 0.0f, 8.0f)];
    self.tfDemo.textInsets = CGSizeMake(6.0f, 4.0f);
    self.tfDemo.textOffset = CGPointMake(35.0f, 0.0f);
    self.tfDemo.textColor = [UIColor whiteColor];
    
    [self.tfDemo2 configureWithBackgroundImage:[UIImage imageNamed:@"text_field"] andHighlightedImage:[UIImage imageNamed:@"text_field_editing"] withResizeCapInsets:UIEdgeInsetsMake(0.0f, 8.0f, 0.0f, 8.0f)];
    self.tfDemo2.textInsets = CGSizeMake(6.0f, 4.0f);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissPressed:(id)sender
{
    [self.view endEditing:YES];
}

@end
