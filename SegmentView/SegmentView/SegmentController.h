//
//  SegmentController.h
//  SegmentView
//
//  Created by Estrella on 2018/1/17.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentControllerDelegate <NSObject>

- (void)selectedViewIndex:(NSInteger)index;

@end


@interface SegmentController : UIView

@property (nonatomic, weak) id <SegmentControllerDelegate> delegate;

@property (nonatomic, strong) NSArray *controllersArray;

- (void)showViewWithIndex:(NSInteger)index;

@end
