//
//  SegmentController.m
//  SegmentView
//
//  Created by Estrella on 2018/1/17.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "SegmentController.h"

@interface SegmentController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *contentScrollView;


@end

@implementation SegmentController

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.contentScrollView];
    }
    return self;
}

- (UIScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-30)];
        _contentScrollView.delegate = self;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.scrollEnabled = YES;
        _contentScrollView.backgroundColor = [UIColor greenColor];
    }
    return _contentScrollView;
}

- (void)setControllersArray:(NSArray *)controllersArray
{
    _controllersArray = controllersArray;
    
    if (controllersArray.count > 0) {
        
        for (int i = 0; i < controllersArray.count; i++) {
            UIViewController *vc = (UIViewController *)controllersArray[i];
            vc.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-30);
            [self.contentScrollView addSubview:vc.view];
        }
        
        self.contentScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*controllersArray.count, [UIScreen mainScreen].bounds.size.height-64-30);
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
    NSLog(@"%s",__func__);

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDragging:scrollView willDecelerate:YES];
    NSLog(@"%s",__func__);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"x = %f",scrollView.contentOffset.x);
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    NSInteger page = (scrollView.contentOffset.x + width*0.5) / width ;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedViewIndex:)]) {
        [self.delegate selectedViewIndex:page];
    }
    
    [self.contentScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*page, 0) animated:YES];
    NSLog(@"%s",__func__);
}

- (void)showViewWithIndex:(NSInteger)index
{
   [self.contentScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*index, 0) animated:YES];
}

@end
