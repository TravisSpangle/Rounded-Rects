//
//  RoundedRectViewController.m
//  RoundedRect
//
//  Created by Travis Spangle on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RoundedRectViewController.h"
#import "DrawRoundRect.h"

@implementation RoundedRectViewController

@synthesize cornerSlider;
@synthesize widthSlider;
@synthesize roundedRect;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    //DrawRoundRect is my UIView and roundedRect will be my instance of it.
    //  I call it with a frame that starts at position x:0 and y:0.
    //  Then give it the appropriate width and height so it doesn't overlap my sliders.
    roundedRect = [[DrawRoundRect alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 360.0)];
    roundedRect.backgroundColor = [UIColor clearColor]; //clear color is we see the background of my UIView Controller Class
    
    roundedRect.width = widthSlider.value;
    roundedRect.radius = cornerSlider.value;
    [self.view addSubview:roundedRect]; //Adding it as a subview.
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [roundedRect release];
    roundedRect = nil;
    
    [self setCornerSlider:nil];
    [self setWidthSlider:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction) cornerChanged;
{
//    roundedRect.radius = [cornerSlider value];
    roundedRect.radius = cornerSlider.value;
    [roundedRect setNeedsDisplay];    
}

//This action is tied to my width slider. It's called whenever the slider changes values and passes 
    //in a refrence to itself.
- (IBAction) widthChanged;
{
    //Sets the width property on my UIView
    roundedRect.width = widthSlider.value;
    //Asks the UIView to redraw itself
    [roundedRect setNeedsDisplay];
}
- (void)dealloc {
    [cornerSlider release];
    [widthSlider release];
    [super dealloc];
}
@end
