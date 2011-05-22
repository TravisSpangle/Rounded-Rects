//
//  RoundedRectViewController.h
//  RoundedRect
//
//  Created by Travis Spangle on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawRoundRect;

@interface RoundedRectViewController : UIViewController {
    DrawRoundRect *roundedRect;
}

@property(nonatomic, retain) DrawRoundRect *roundedRect;

- (IBAction) cornerChanged: (UISlider *) cornerSlider;
- (IBAction) widthChanged: (UISlider *) widthSlider;

@end
