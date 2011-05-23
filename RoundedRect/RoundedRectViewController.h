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
    UISlider *cornerSlider;
    UISlider *widthSlider;
}
@property (nonatomic, retain) IBOutlet UISlider *cornerSlider;
@property (nonatomic, retain) IBOutlet UISlider *widthSlider;

@property(nonatomic, retain) DrawRoundRect *roundedRect;

- (IBAction) cornerChanged;
- (IBAction) widthChanged;

@end
