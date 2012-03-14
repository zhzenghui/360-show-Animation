//
//  ADImageView.m
//  CarDemo
//
//  Created by jiyanyao on 11-5-22.
//  Copyright 2011年 autoDay. All rights reserved.
//

#import "ADImageView.h"

static int imageNum;

#define imgageCount 100

#define space 320/100

//18   1000
//320  / 100   3.2

@implementation ADImageView

- (id)init {
    
    self = [super init];
    if (self) {
        imageNum = 1; 
    }
    return self;
}

- (void)dealloc{

    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];

    _ptGestureStart = [touch locationInView:self]; 

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{	
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:self];  
    
    NSString *strName = nil;

    //第几个image
    if (currentPosition.x >_ptGestureStart.x) {
        
        imageNum = (currentPosition.x - _ptGestureStart.x)/3.0; 
    }
    else {
        imageNum = imgageCount - (_ptGestureStart.x - currentPosition.x)/3.0; 
    }
    
//    设置界限
    if (imageNum >= imgageCount) {
        imageNum = 0;
    }
    else if (imageNum <= 0) {
        imageNum = imgageCount;
    }
   
    if (imageNum < 10) {
        strName = [NSString stringWithFormat:@"0000%d", imageNum];        
    }
    else if (imageNum >10 && imageNum <100) {
        strName = [NSString stringWithFormat:@"000%d", imageNum];        
    }
    else {
        strName = [NSString stringWithFormat:@"00%d", imageNum];        
    }
    

    strName = [[NSBundle mainBundle] pathForResource:strName ofType:@"png"];
    UIImage * image = nil;
    image = [[UIImage alloc] initWithContentsOfFile:strName];
    
    if (image) {
        self.image = image;
        [image release];
        
    }
 }


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    _tapInContainerView = [touch locationInView:self]; 
}

@end
