//
//  DrawRoundRect.h
//  RoundedRect
//
//  Created by Travis Spangle on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawRoundRect : UIView {
 	CGImageRef image;  
    
    CGFloat width;
    CGFloat radius;
}

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat radius;

- (CGPathRef) newRoundedRectPath:(CGRect)bounds;

@end
