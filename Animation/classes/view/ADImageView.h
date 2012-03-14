//
//  ADImageView.h
//  CarDemo
//
//  Created by jiyanyao on 11-5-22.
//  Copyright 2011年 autoDay. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ADImageViewDelegate;

@interface ADImageView : UIImageView<UIAccelerometerDelegate> {
    CGPoint _tapInContainerView;

    CGPoint _ptGestureStart;

    
}

@end
