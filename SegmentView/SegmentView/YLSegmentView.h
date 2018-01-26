//
//  YLSegmentView.h
//  SegmentView
//
//  Created by Estrella on 2018/1/15.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YLSegmentViewDelegate <NSObject>

- (void)selectedTitleIndex:(NSInteger)index;

@end

@interface YLSegmentView : UIView

@property (nonatomic, weak) id<YLSegmentViewDelegate> delegate;

@property (nonatomic, strong) NSArray *titleArray;

- (void)selectedTitleWithIndex:(NSInteger)index;

@end
