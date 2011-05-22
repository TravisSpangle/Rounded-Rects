//
//  DrawRoundRect.m
//  RoundedRect
//
//  Created by Travis Spangle on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawRoundRect.h"


@implementation DrawRoundRect

@synthesize width, radius;

-(id)initWithFrame:(CGRect)frame
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
	self = [super initWithFrame:frame];
	if(self != nil)
	{
		NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"portrait.JPG" ofType:nil];
		UIImage *img = [UIImage imageWithContentsOfFile:imagePath];
		image = CGImageRetain(img.CGImage);
        self.width = 3.0;
        self.radius = 50.0;
	}
	return self;
}

-(void)dealloc
{
	CGImageRelease(image);
	[super dealloc];
}

- (void) drawRect:(CGRect)rect
{
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Creating rect for image
    CGRect imageRect;
	imageRect.origin = CGPointMake(20.0, 20.0);
    imageRect.size = CGSizeMake(200.0, 300.0);
    
    //flipping the image
    CGContextTranslateCTM(context, imageRect.size.width / 4.0f, imageRect.size.height / .85f);
    CGContextScaleCTM(context, 1.0f, -1.0f);

    //create shadow
    CGRect shadowRect = CGRectMake(imageRect.origin.x-(width / 2.0f), imageRect.origin.y-(10+width), imageRect.size.width+width, imageRect.size.height);
    
    //Filling the shadow in Black
    CGContextSetRGBFillColor(context, 0, 0, 0, 1);
    
    // Creating and adding clipping path to context as a shadow    
    CGPathRef shadowRound = [self newRoundedRectPath:shadowRect];
    CGContextBeginPath(context);
    CGContextAddPath(context, shadowRound);    
	CGContextClosePath(context);
    
    //Shadow is finished, filling it in.
    CGContextFillPath(context);
    
    //Create clipping path and apply to image for rounded look
    CGPathRef imageRound = [self newRoundedRectPath:imageRect];        
	CGContextBeginPath(context);
    CGContextAddPath(context, imageRound);
	CGContextClosePath(context);

    //Saving context pre-image-clipping
    CGContextSaveGState(context);   
    
    //clip image path
	CGContextClip(context);
    
    //Draw Image in clipped path
	CGContextDrawImage(context, imageRect, image);
    
    //Restore context from pre-image drawn state
    CGContextRestoreGState(context);
    
    // And stroke the clipped area
    CGContextSetLineWidth(context, width);
	CGContextSetRGBStrokeColor(context, 255, 255, 255, 1.0);
    
    CGContextBeginPath(context);
    CGContextAddPath(context, imageRound);
	CGContextClosePath(context);

    CGContextStrokePath(context);
        
    CGPathRelease(imageRound); 
    CGPathRelease(shadowRound);
}

- (CGPathRef) newRoundedRectPath:(CGRect)bounds
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, &CGAffineTransformIdentity,
                      CGRectGetMinX(bounds) + radius, CGRectGetMinY(bounds));       
    
    CGPathAddArc(path, &CGAffineTransformIdentity,
                 CGRectGetMaxX(bounds) - radius, CGRectGetMinY(bounds)
                 + radius, radius, 3 * M_PI / 2, 0, 0);
    
    CGPathAddArc(path, &CGAffineTransformIdentity,
                 CGRectGetMaxX(bounds) - radius, CGRectGetMaxY(bounds)
                 - radius, radius, 0, M_PI / 2, 0);
    
    CGPathAddArc(path, &CGAffineTransformIdentity,
                 CGRectGetMinX(bounds) + radius, CGRectGetMaxY(bounds)
                 - radius, radius, M_PI / 2, M_PI, 0);
    
    CGPathAddArc(path, &CGAffineTransformIdentity,
                 CGRectGetMinX(bounds) + radius, CGRectGetMinY(bounds)
                 + radius, radius, M_PI, 3 * M_PI / 2, 0);
    
    CGPathCloseSubpath( path );
    
    return path;
}


@end
