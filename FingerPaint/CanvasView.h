//
//  CanvasView.h
//  FingerPaint
//
//  Created by Alex Lee on 2017-06-09.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasView : UIView

- (void)addPointToStroke:(CGPoint)point;

- (void)beginStrokeAtPoint:(CGPoint)point;

@end
