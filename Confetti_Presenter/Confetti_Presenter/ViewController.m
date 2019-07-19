//
//  ViewController.m
//  Confetti_Presenter
//
//  Created by Bat-Erdene, Ene on 7/19/19.
//  Copyright © 2019 Bat-Erdene, Ene. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)popConfetti:(id)sender {
     ConfettiView *layer = [[ConfettiView alloc] initWithFrame:self.view.bounds];
            layer.hidden = NO;
            [layer playAudio];
            [self.view addSubview:layer];
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
                [self removeConfettiSubviewsFromUIView:self.view];
            });
    }
- (void)removeConfettiSubviewsFromUIView:(UIView *)parentView
{
    for (id child in [parentView subviews])
    {
       if ([child isMemberOfClass:[ConfettiView class]])
       {
            [child removeFromSuperview];
       }
    }
}

@end
