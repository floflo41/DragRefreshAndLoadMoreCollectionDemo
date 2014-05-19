//
//  ViewController.m
//  DragRefreshAndLoadMoreCollectionDemo
//
//  Created by iMisterbell on 19/05/2014.
//  Copyright (c) 2014 iMisterbell. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewLayout.h"
#import "Cell.h"
#import "UICollectionView+DragLoad.h"

@class FrameObservingView;

@protocol FrameObservingViewDelegate <NSObject>
- (void)frameObservingViewFrameChanged:(FrameObservingView *)view;
@end

@interface FrameObservingView : UIView
@property (nonatomic,assign) id<FrameObservingViewDelegate>delegate;
@end

@interface ViewController ()<UICollectionViewDragLoadDelegate,UICollectionViewDataSource,FrameObservingViewDelegate>
{
    UICollectionView *_collectionView;
    NSUInteger _dataCount;
}
@end

@implementation FrameObservingView
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self.delegate frameObservingViewFrameChanged:self];
}
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)frameObservingViewFrameChanged:(FrameObservingView *)view
{
    _collectionView.frame = self.view.bounds;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FrameObservingView *frameObservingView = [[FrameObservingView alloc] init];
    frameObservingView.delegate = self;
    self.view = frameObservingView;
    
    _dataCount = 20;
    
    CollectionViewLayout *collectionViewLayout = [[CollectionViewLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:collectionViewLayout];
    _collectionView.frame = self.view.bounds;
    _collectionView.dataSource = self;
    [_collectionView setDragDelegate:self refreshDatePermanentKey:@"FriendList"];
    _collectionView.showLoadMoreView = YES;
    [self.view addSubview:_collectionView];
    [_collectionView setBackgroundColor:[UIColor redColor]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Dummy methods

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return _dataCount;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    [collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"MY_CELL"];
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    //cell.label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
    /*UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blueColor];
    return cell;*/
}

@end
