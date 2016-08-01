//
//  ViewController.m
//  DrawRectObject
//
//  Created by YouXianMing on 16/7/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "TmpView.h"
#import "WaveView.h"
#import "ReplicatorLineAnimationView.h"
#import "UIView+SetRect.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Wave 1
    {
        WaveView *waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
        waveView.phase     = 0.f;
        waveView.waveCrest = 5.f;
        waveView.waveCount = 1;
        waveView.type      = kStrokeWave | kFillWave;
        
        {
            DrawingStyle *fillStyle = [DrawingStyle new];
            fillStyle.fillColor     = [DrawingColor colorWithUIColor:[[UIColor redColor] colorWithAlphaComponent:0.25f]];
            waveView.fillStyle      = fillStyle;
            
            DrawingStyle *strokeStyle = [DrawingStyle new];
            strokeStyle.strokeColor   = [DrawingColor colorWithUIColor:[[UIColor redColor] colorWithAlphaComponent:0.5f]];
            strokeStyle.lineWidth     = 0.5f;
            waveView.strokeStyle      = strokeStyle;
        }
        
        ReplicatorLineAnimationView *replicatorLineView = [[ReplicatorLineAnimationView alloc] initWithFrame:waveView.bounds];
        replicatorLineView.direction   = kReplicatorLeft;
        replicatorLineView.speed       = 0.1f;
        replicatorLineView.contentView = waveView;
        [replicatorLineView startAnimation];
        [self.view addSubview:replicatorLineView];
    }
    
    // Wave 2
    {
        WaveView *waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
        waveView.phase     = 0.f;
        waveView.waveCrest = 10.f;
        waveView.waveCount = 1;
        waveView.type      = kStrokeWave | kFillWave;
        
        {
            DrawingStyle *fillStyle = [DrawingStyle new];
            fillStyle.fillColor     = [DrawingColor colorWithUIColor:[[UIColor redColor] colorWithAlphaComponent:0.5f]];
            waveView.fillStyle      = fillStyle;
            
            DrawingStyle *strokeStyle = [DrawingStyle new];
            strokeStyle.strokeColor   = [DrawingColor colorWithUIColor:[UIColor redColor]];
            strokeStyle.lineWidth     = 0.5f;
            waveView.strokeStyle      = strokeStyle;
        }
        
        ReplicatorLineAnimationView *replicatorLineView = [[ReplicatorLineAnimationView alloc] initWithFrame:waveView.bounds];
        replicatorLineView.direction = kReplicatorLeft;
        replicatorLineView.speed     = 0.3f;
        replicatorLineView.contentView = waveView;
        [replicatorLineView startAnimation];
        [self.view addSubview:replicatorLineView];
    }
    
    // Wave 3
    {
        WaveView *waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
        waveView.phase     = 10.f;
        waveView.waveCrest = 15.f;
        waveView.waveCount = 1;
        waveView.type      = kFillWave;
        
        {
            DrawingStyle *fillStyle = [DrawingStyle new];
            fillStyle.fillColor     = [DrawingColor colorWithUIColor:[UIColor redColor]];
            waveView.fillStyle      = fillStyle;
        }
        
        ReplicatorLineAnimationView *replicatorLineView = [[ReplicatorLineAnimationView alloc] initWithFrame:waveView.bounds];
        replicatorLineView.direction   = kReplicatorLeft;
        replicatorLineView.speed       = 0.5f;
        replicatorLineView.contentView = waveView;
        [replicatorLineView startAnimation];
        [self.view addSubview:replicatorLineView];
    }
}

@end
