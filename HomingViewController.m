//
//  HomingViewController.m
//  MixHipsProject
//
//  Created by SDT-1 on 2014. 1. 23..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "HomingViewController.h"
#import "PlayListViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#define IMAGE_NUM 3

@interface HomingViewController ()<UIScrollViewDelegate>
{
    int loadedPageCount;
    UIScrollView *_scrollView;
    UIPageControl *pageControl;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *playButton;


@end

@implementation HomingViewController{
    PlayListViewController *playerVC;
}

/// ------------------음악 재생------------------------
-(IBAction)musicPlay:(id)sender{
    if([playerVC.player isPlaying]){
        [self musicStop];
    }
    else{
        [self musicStart];
    }
}

-(void)musicStart{
    [playerVC.player play];
}

-(void)musicStop{
    [playerVC.player stop];
}

///////////////////////////////////

-(void)loadContentsPage:(int)pageNo{
    if(pageNo <0|| pageNo <loadedPageCount || pageNo >= IMAGE_NUM)
        return;
    
    if(pageNo == 0){
        float width = _scrollView.frame.size.width;
        float height = _scrollView.frame.size.height;
        
//        NSString *fileName = [NSString stringWithFormat:@"ball%d", pageNo];
//        NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:@"png"];
//        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor grayColor];
        imageView.frame = CGRectMake(width * pageNo, 0, width, height);
        [_scrollView addSubview:imageView];

        
         
    }
    else if(pageNo == 1){
        //개인동의서
        
        float width = _scrollView.frame.size.width;
        float height = _scrollView.frame.size.height;
        
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(width *pageNo, 0, width, height);
        [_scrollView addSubview:view];
        
    }
    else if(pageNo == 2){
        //별명 작성 버튼
        
        float width = _scrollView.frame.size.width;
        float height = _scrollView.frame.size.height;
        
        UIView *view = [[UIView alloc]init];
        view.frame = CGRectMake(width *pageNo, 0, width, height);
        [_scrollView addSubview:view];
    }
    loadedPageCount++;
     
    
    /*
    if(pageNo <0|| pageNo <loadedPageCount || pageNo >= IMAGE_NUM)
        return;
    
    float width = _scrollView.frame.size.width;
    float height = _scrollView.frame.size.height;
    
    NSString *fileName = [NSString stringWithFormat:@"ball%d", pageNo];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(width * pageNo, 0, width, height);
    [_scrollView addSubview:imageView];
    loadedPageCount++;
     */
}



-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    float width = scrollView.frame.size.width;
    float offsetX = scrollView.contentOffset.x;
    int pageNo = floor(offsetX / width);
    pageControl.currentPage = pageNo;
  
    
    [self loadContentsPage:pageNo-1];
    [self loadContentsPage:pageNo];
    [self loadContentsPage:pageNo+1];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //float width = _scrollView.frame.size.width;
    float heigth = _scrollView.bounds.size.height;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 320, 160)];
    [self.view addSubview:_scrollView];
    
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(320 * IMAGE_NUM, heigth);
    NSLog(@"%@",NSStringFromCGSize(_scrollView.contentSize));
    _scrollView.backgroundColor = [UIColor blackColor];
    
    pageControl.frame = CGRectMake(160, 52, 39, 37);
    pageControl.numberOfPages = IMAGE_NUM;
    
    [_scrollView addSubview:pageControl];
    loadedPageCount =0;
    
    [self loadContentsPage:0];
    
    [self loadContentsPage:1];
  
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    //[self.navigationController setToolbarHidden:NO];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
