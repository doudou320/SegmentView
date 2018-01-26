//
//  YLSegmentView.m
//  SegmentView
//
//  Created by Estrella on 2018/1/15.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "YLSegmentView.h"

#define TITLELABEL_WIDTH 80
#define SEGMENT_HEIGHT 30
#define BASE_TAG 100

@interface YLSegmentView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *titleScrollview;
@end

@implementation YLSegmentView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleScrollview];
    }
    return self;
}

- (UIScrollView *)titleScrollview
{
    if (!_titleScrollview) {
        _titleScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
        _titleScrollview.delegate = self;
        _titleScrollview.showsHorizontalScrollIndicator = NO;
        _titleScrollview.scrollEnabled = YES;
    }
    return _titleScrollview;
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = titleArray;
    
    if (titleArray.count > 0) {
        for (int i = 0; i<self.titleArray.count; i++) {
            UILabel *titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(TITLELABEL_WIDTH*i, 0, TITLELABEL_WIDTH, SEGMENT_HEIGHT)];
            titleLbl.text = [NSString stringWithFormat:@"%@",self.titleArray[i]];
            titleLbl.textAlignment = NSTextAlignmentCenter;
            titleLbl.tag = BASE_TAG + i;
            titleLbl.userInteractionEnabled = YES;
            [self.titleScrollview addSubview:titleLbl];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
            [titleLbl addGestureRecognizer:tap];
            
            if (i == 0) {
                titleLbl.textColor = [UIColor redColor];
                titleLbl.font = [UIFont boldSystemFontOfSize:20.0];
            }
        }
    }
    
    self.titleScrollview.contentSize = CGSizeMake(TITLELABEL_WIDTH*titleArray.count, 30);

}

- (void)onTap:(UIGestureRecognizer *)gesture
{
    NSInteger tag = gesture.view.tag - BASE_TAG;
    
    for (UIView *subView in self.titleScrollview.subviews) {
        
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subView;
            if ( tag == label.tag - BASE_TAG ) {
                label.textColor = [UIColor redColor];
                label.font = [UIFont boldSystemFontOfSize:20.0];
            }else{
                label.textColor = [UIColor blackColor];
                label.font = [UIFont systemFontOfSize:17.0];
            }
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedTitleIndex:)]) {
        [self.delegate selectedTitleIndex:tag];
    }
}

- (void)selectedTitleWithIndex:(NSInteger)index
{
    for (UIView *subView in self.titleScrollview.subviews) {
        
        if ([subView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)subView;
            if ( index == label.tag - BASE_TAG ) {
                label.textColor = [UIColor redColor];
                label.font = [UIFont boldSystemFontOfSize:20.0];
            }else{
                label.textColor = [UIColor blackColor];
                label.font = [UIFont systemFontOfSize:17.0];
            }
        }
    }
}
@end
