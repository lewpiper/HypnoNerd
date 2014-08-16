//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Lew on 7/23/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end


@implementation BNRReminderViewController


- (IBAction)addReminder:(id)sender{
    NSDate *date =self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
}


- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //get the tab bar item
        UITabBarItem *tbi = self.tabBarItem;
        
        //Give it a label
        tbi.title = @"Reminder";
        
        //Give it an image
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    return self;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view.");
}


//This lets the user only select a reminder time that is at least 60 seconds from now. 
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}


@end
