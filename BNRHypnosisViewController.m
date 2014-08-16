//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Lew on 7/23/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"
#import "BNRQuizViewController.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end


@implementation BNRHypnosisViewController

//This is the view loading
- (void) loadView{
    
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    //Setting the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    [backgroundView addSubview:textField];
    self.view = backgroundView;
    
    //There will be a warning on this line. We will discuss it shortly.
    textField.delegate = self;
    
}


- (void)viewDidLoad {
  //Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        //Create a UIImage from a file
        //This will use Hypno@2x.png on retina devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //Put that image on the tab bar ite
        self.tabBarItem.image = i;
    }
    return self;
}


- (BOOL)textFieldShouldReturn:(UITextField *) textField{
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @" ";
    [textField resignFirstResponder];
    return YES;
}


//Adding the labels at random locations on the screen.
- (void)drawHypnoticMessage: (NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        //Configure the label's colors and text
        messageLabel.backgroundColor = [ UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.text = message;
        
        //This method resizes the label, which will be relative to the text that is displaying
        [messageLabel sizeToFit];
        
        
        //Get a random x value that fits within the hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel. bounds.size.width);
        int x = arc4random() % width;
        
        //Get a random y value that fits within the hyposis view's height
        int height =(int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        //Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        //Add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
}

@end

