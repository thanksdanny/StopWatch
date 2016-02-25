//
//  ViewController.m
//  StopWatch
//
//  Created by Danny Ho on 2/25/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "ViewController.h"

/*
 还要实现小数计时
 
 */

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *resetBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) NSInteger counter;
@property (nonatomic) BOOL isPlaying;

@end

@implementation ViewController

- (NSTimer *)timer {
    if (!_timer) _timer = [[NSTimer alloc] init];
    return _timer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.counter = 0;
        self.timeLabel.text = @"0";
        self.isPlaying = false;
        self.pauseBtn.enabled = NO;
    }
    return self;
}

- (void)updateTimer:(NSTimer *)timer {
    NSLog(@"%s" , __func__);
    int counter = self.timeLabel.text.intValue;
    self.timeLabel.text = [NSString stringWithFormat:@"%d", ++counter];
}

- (IBAction)play {
    if (self.isPlaying) {
        return;
    }
    self.playBtn.enabled = NO;
    self.pauseBtn.enabled = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:true];
    self.isPlaying = YES;
    
}

- (IBAction)pause {
    NSLog(@"pause!");
    self.playBtn.enabled = YES;
    self.pauseBtn.enabled = NO;
    [self.timer invalidate];
    self.isPlaying = NO;
}

- (IBAction)reset {
    [self.timer invalidate];
    self.timeLabel.text = @"0";
    self.playBtn.enabled = YES;
    self.pauseBtn.enabled = NO;
    self.isPlaying = NO;
    
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
