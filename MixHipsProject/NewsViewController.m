//
//  NewsViewController.m
//  MixHipsProject
//
//  Created by SDT-1 on 2014. 1. 16..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()<UIAlertViewDelegate , UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchButton;
@property (weak, nonatomic) IBOutlet UIView *hideView;

@end

@implementation NewsViewController


-(IBAction)searchNews:(id)sender{
    float height = self.searchView.frame.size.height;
    
    self.tableView.center = CGPointMake(self.tableView.center.x, self.tableView.center.y + height);
    [self.searchView becomeFirstResponder];
    self.hideView.hidden= NO;
    self.searchButton.enabled = NO;
    self.searchView.hidden = NO;
}

-(IBAction)closeSearchbar:(id)sender{
    float height = self.searchView.frame.size.height;
    
    self.tableView.center = CGPointMake(self.tableView.center.x, self.tableView.center.y - height);
    [self.searchView resignFirstResponder];
    self.hideView.hidden = YES;
    self.searchButton.enabled =YES;
    self.searchView.hidden = YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NEWS_CELL"];
    return cell;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.hideView.hidden = YES;
    self.searchView.hidden = YES;
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
