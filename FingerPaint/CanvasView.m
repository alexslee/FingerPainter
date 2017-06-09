//
//  CanvasView.m
//  FingerPaint
//
//  Created by Alex Lee on 2017-06-09.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "CanvasView.h"

@interface CanvasView ()

@property (strong, nonatomic)UIBezierPath *path;

@end

@implementation CanvasView

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
{
    if (self == [super initWithCoder:aDecoder]) {
        _path = [[UIBezierPath alloc] init];
        [_path setLineWidth:5.0];
        self.backgroundColor = [UIColor whiteColor];
        [[UIColor blackColor] setStroke];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.path stroke];
}

- (void)addPointToStroke:(CGPoint)point;
{
    [self.path addLineToPoint:point];
    NSLog(@"continuing to draw");
    [self setNeedsDisplay];
}

- (void)beginStrokeAtPoint:(CGPoint)point;
{
    NSLog(@"beginning to draw");
    [self.path moveToPoint:point];
}

@end
