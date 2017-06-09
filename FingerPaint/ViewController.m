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
@property (strong, nonatomic) UISlider *colorSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectZero];
    self.colorSlider = slider;
    slider.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *colorWidth = [NSLayoutConstraint constraintWithItem:slider
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.view
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:0.75
                                                                   constant:0.0];
    NSLayoutConstraint *colorHorizontal = [NSLayoutConstraint constraintWithItem:slider
                                                                       attribute:NSLayoutAttributeCenterX
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.canvasView
                                                                       attribute:NSLayoutAttributeCenterX
                                                                      multiplier:1.0
                                                                        constant:0.0];
    
    NSLayoutConstraint *colorTop = [NSLayoutConstraint constraintWithItem:slider
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.canvasView
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                    constant:20.0];
    [self.view addSubview:slider];
    slider.hidden = YES;
    colorWidth.active = YES;
    colorTop.active = YES;
    colorHorizontal.active = YES;
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.continuous = NO;
    
    [slider addTarget:self action:@selector(colorChanger:) forControlEvents:UIControlEventValueChanged];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleColorSlider:(UIButton *)sender {
    self.colorSlider.hidden = !self.colorSlider.hidden;
}

- (void)colorChanger:(UISlider *)sender {
    [self.canvasView changeColor:sender.value];
}

- (IBAction)panGestureHandle:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.canvasView];
    CGPoint velocity = [sender velocityInView:self.canvasView];
    [self.canvasView widthChangeFromVelocity:velocity];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        [self.canvasView beginStrokeAtPoint:point];
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        [self.canvasView addPointToStroke:point];
        
    } else {
//        [self.canvasView nextPath];
    }
}

@end
