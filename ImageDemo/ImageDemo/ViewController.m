//
//  ViewController.m
//  ImageDemo
//
//  Created by 赵朋 on 16/7/11.
//  Copyright © 2016年 赵朋. All rights reserved.
//

#import "ViewController.h"
#import "KZImageViewer.h"
#import "KZImage.h"

@interface ViewController ()

/*  */
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 100, 150, 120)];
//    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    _imageView = imageView;
    
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(secondTapHandle:)];
    [_imageView addGestureRecognizer:gesture];
    [self.view addSubview:imageView];
    
    
}


- (void)secondTapHandle:(UITapGestureRecognizer *)tap {
    
    NSMutableArray  *kzImageArray = [NSMutableArray array];
//    KZImage *kzImage = [[KZImage alloc] initWithImage:_imageView.image];
    KZImage *kzImage = [[KZImage alloc] initWithURL:[NSURL URLWithString:@"http://i0.letvimg.com/lc07_iscms/201605/31/18/26/759aa66781f4472e81d926a07102c804.jpg"]];
    kzImage.thumbnailImage = _imageView.image;
    kzImage.srcImageView = _imageView;
    [kzImageArray addObject:kzImage];
    
    KZImageViewer *imageViewer = [[KZImageViewer alloc] init];
    [imageViewer showImages:kzImageArray atIndex:0];
    
    
    
    
    
    
}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
