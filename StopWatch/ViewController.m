//
//  ViewController.m
//  StopWatch
//
//  Created by Danny Ho on 2/25/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation ViewController

- (void)updateTimer:(NSTimer *)timer {
    NSLog(@"%s" , __func__);
    int counter = self.timeLabel.text.intValue;
    self.timeLabel.text = [NSString stringWithFormat:@"%d", ++counter];
}

- (IBAction)play {
    self.timeLabel.text = @"0";
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:true];
}

- (IBAction)pause {
    NSLog(@"pause!");
    [self.timer invalidate];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
