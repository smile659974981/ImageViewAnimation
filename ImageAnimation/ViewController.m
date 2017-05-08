//
//  ViewController.m
//  ImageAnimation
//
//  Created by 孑孓 on 2017/5/8.
//  Copyright © 2017年 hlhj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)NSMutableArray *mutableArray;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)NSBundle *imageBoundle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    if (self.imageBoundle) {
        for (int i = 1; i < 34; i ++) {
            NSString *imageStr = [NSString stringWithFormat:@"0%d.jpg",i];
            NSString *imagePath = [NSString stringWithFormat:@"%@/%@", [self.imageBoundle bundlePath], imageStr];
            UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
            [imageArray addObject:image];
        }
    }
    [_imageView setAnimationImages:imageArray];
    [_imageView setAnimationDuration:7];
    [_imageView setAnimationRepeatCount:0];
    [_imageView startAnimating];
    [self.view addSubview:_imageView];
}
- (NSBundle *)imageBoundle {
    if (_imageBoundle) {
        return _imageBoundle;
    }
    NSString *imageBundlePath = [[NSBundle mainBundle] pathForResource:@"iamges" ofType:@"bundle"];
    _imageBoundle = [NSBundle bundleWithPath:imageBundlePath];
    return _imageBoundle;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.imageView stopAnimating];
    self.imageView.animationImages = nil;
    
}


@end
