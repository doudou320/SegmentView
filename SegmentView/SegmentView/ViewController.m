//
//  ViewController.m
//  SegmentView
//
//  Created by Estrella on 2018/1/15.
//  Copyright © 2018年 Estrella. All rights reserved.
//

#import "ViewController.h"
#import "YLSegmentView.h"
#import "SegmentController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"


@interface ViewController () <YLSegmentViewDelegate,SegmentControllerDelegate>

@property (nonatomic, strong) YLSegmentView *segView;

@property (nonatomic, strong) SegmentController *contentView;

@property (nonatomic, copy) NSString *head_a;
@property (nonatomic, copy) NSString *head_b;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.segView = [[YLSegmentView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 30)];
    self.segView.delegate = self;
    self.segView.titleArray = [NSArray arrayWithObjects:@"头条",@"要闻",@"娱乐",@"体育",@"网易号",@"北京",@"视频",@"财经", nil];
    [self.view addSubview:self.segView];

   self.contentView = [[SegmentController alloc] initWithFrame:CGRectMake(0,64+30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-30)];
    self.contentView.delegate = self;
    self.contentView.controllersArray = [NSArray arrayWithObjects:[[FirstViewController alloc] init],[[SecondViewController alloc] init],[[ThirdViewController alloc] init], nil];
    [self.view addSubview:self.contentView];
}

- (void)selectedTitleIndex:(NSInteger)index
{
    [self.contentView showViewWithIndex:index];
}

- (void)selectedViewIndex:(NSInteger)index
{
    [self.segView selectedTitleWithIndex:index];
}
@end
