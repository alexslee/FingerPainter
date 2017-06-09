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

@property (nonatomic)CGFloat currentWidth;

@property (assign)NSInteger pathCount;

@property (strong,nonatomic)UIColor *color;

@property (nonatomic)NSInteger colorCount;

@property (strong,nonatomic)NSMutableArray *colors;

@property (strong, nonatomic)NSMutableArray *paths;

@property (strong, nonatomic)NSMutableArray *widths;

@property (nonatomic)BOOL newColor;

@end

@implementation CanvasView

- (instancetype)initWithCoder:(NSCoder *)aDecoder;
{
    if (self == [super initWithCoder:aDecoder]) {
        _currentPath = [[UIBezierPath alloc] init];
        _paths = [[NSMutableArray alloc] init];
        _currentWidth = 5.0;
        _color = [UIColor blackColor];
        _widths = [[NSMutableArray alloc] init];
//        _colors = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor whiteColor];
        _colorCount = 0;
        [[UIColor blackColor] setStroke];
        _newColor = NO;
    }
    return self;
}

- (void)changeColor:(CGFloat)hue;
{
    if (self.colors == nil) {
        self.colors = [[NSMutableArray alloc] init];
    }
    NSLog(@"new hue is: %.2lf",hue);
    UIColor *newColor = [UIColor colorWithHue:hue saturation:1.0 brightness:1.0 alpha:1.0];
    [self.colors addObject:newColor];
    self.colorCount++;
    self.color = newColor;
    self.newColor = YES;
    
}

- (void)widthChangeFromVelocity:(CGPoint)velocity;
{
//    float x = pow(velocity.x,2);
//    float y = pow(velocity.y,2);
//    
//    float param = sqrtf(x+y);
//    

//    CGFloat testWidth;
//    if (param > 50) {
//        testWidth = 10;
//    } else if (param > 40) {
//        testWidth = 9.5;
//    } else if (param > 30) {
//        testWidth = 9;
//    } else if (param > 20) {
//        testWidth = 8.5;
//    } else if (param > 10) {
//        testWidth = 8;
//    } else {
//        testWidth = 7.5;
//    }
//    
//    if (testWidth != self.currentWidth) {
//        
//        self.currentWidth = testWidth;
//        
//        UIBezierPath *newPath = [[UIBezierPath alloc]init];
//        [newPath moveToPoint:self.currentPath.currentPoint];
//        
//        [self.paths addObject:newPath];
//        self.currentPath = newPath;
//        self.currentWidth = testWidth;
//        [self.widths addObject:[NSNumber numberWithFloat:testWidth]];
//        
//    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if ([self.paths count] != 0) {
//        if (!self.newColor) {
//            if (self.colors == nil) {
//                self.colors = [[NSMutableArray alloc] init];
//                [self.colors addObject:[UIColor blackColor]];
//            } else if ([self.colors count] == 0) {
//                [self.colors addObject:[UIColor blackColor]];
//            } else {
//                [self.colors addObject: [self.colors objectAtIndex:[self.colors count]-1] ];
//            }
//            //self.colorCount++;
//        }
        if ([self.colors count] == 0) {
            UIColor *firstColor = [UIColor blackColor];
            [self.colors addObject:firstColor];
            [firstColor setStroke];
            for (unsigned i = 0; i < [self.paths count]; i++) {
                UIBezierPath *path = [self.paths objectAtIndex:i];
                //[path setLineWidth:[[self.widths objectAtIndex:i] floatValue]];
                [path setLineWidth:5.0];
                [path stroke];
            }
        } else {
            for (unsigned i = 0; i < [self.paths count]; i++) {
                UIBezierPath *path = [self.paths objectAtIndex:i];
//                if (i >= self.colorCount) {
//                    [[self.colors objectAtIndex:self.colorCount] setStroke];
//                } else {
                    [[self.colors objectAtIndex:i] setStroke];
//                }
                //[path setLineWidth:[[self.widths objectAtIndex:i] floatValue]];
                [path setLineWidth:5.0];
                [path stroke];
            }
        }
        self.newColor = NO;
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
    UIBezierPath *newPath = [[UIBezierPath alloc]init];
    [newPath moveToPoint:point];

    [self.paths addObject:newPath];
    self.currentPath = newPath;
    self.pathCount++;
    if (self.colors == nil) {
        self.colors = [[NSMutableArray alloc] init];
    }
    if (self.pathCount > self.colorCount) {
        [self.colors addObject:self.color];
        self.colorCount++;
    }
    
    //[self.currentPath moveToPoint:point];
}

@end
