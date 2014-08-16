//
//  BNRQuizViewController.m
//  HypnoNerd
//
//  Created by Lew on 7/23/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRQuizViewController.h"


@interface BNRQuizViewController ()

@property (nonatomic, assign) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic, copy) NSArray *questions;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Create two arrays filled with questions and answers
        // and make the pointers point to them
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
        if (self) {
            //Get the tab bar item
            UITabBarItem *tbi = self.tabBarItem;
            
            //Give it a label
            tbi.title = @"Quiz";
            
            //Give it an image
            UIImage *i = [UIImage imageNamed:@"quiz.png"];
            tbi.image = i;
    }
    
    // Return the address of the new object
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)showQuestionButtonPressed:(UIButton *)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    
    // Am I pas the last question?
    if (self.currentQuestionIndex == [self.questions count]) {
        
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at the index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // Display the string in the question label
    self.questionLabel.text = question;
    
    // Reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswerButtonPressed:(UIButton *)sender
{
    // What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // Display it in the answer label
    self.answerLabel.text = answer;
}




@end
