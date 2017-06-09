//
//  CanvasView.m
//  FingerPaint
//
//  Created by Alex Lee on 2017-06-09.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "CanvasView.h"

@interface CanvasView ()

@property (strong, nonatomic)UIBezierPath *currentPath;

@property (assign)NSInteger pathCount;

@property (strong, nonatomic)NSMutableArray *paths;

@property (nonatomic)CGFloat width;
@end

@implementation CanvasView

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
{
    if (self == [super initWithCoder:aDecoder]) {
        _currentPath = [[UIBezierPath alloc] init];
        _pathCount = 0;
        _paths = [[NSMutableArray alloc] init];
        _width = 5.0;
        self.backgroundColor = [UIColor whiteColor];
        [[UIColor blackColor] setStroke];
    }
    return self;
}

- (void)widthChangeFromVelocity:(CGPoint)velocity;
{
    self.width = 5.0;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    NSLog(@"width of stroke: %.2lf || width property: %.2lf",self.currentPath.lineWidth,self.width);
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
}

- (void)addPointToStroke:(CGPoint)point;
{
    [self.currentPath addLineToPoint:point];
    //NSLog(@"continuing to draw");
    [self setNeedsDisplay];
}

- (void)beginStrokeAtPoint:(CGPoint)point;
{
    NSLog(@"beginning to draw");
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [self.paths addObject:path];
    self.currentPath = [self.paths objectAtIndex:self.pathCount];
    [self.currentPath moveToPoint:point];
}

- (void)nextPath;
{
    self.pathCount++;
}

@end
