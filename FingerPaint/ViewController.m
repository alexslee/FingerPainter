//
//  ViewController.m
//  FingerPaint
//
//  Created by Alex Lee on 2017-06-09.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet CanvasView *canvasView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)panGestureHandle:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.canvasView];
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        [self.canvasView beginStrokeAtPoint:point];
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        [self.canvasView addPointToStroke:point];
        
    }
}

@end
