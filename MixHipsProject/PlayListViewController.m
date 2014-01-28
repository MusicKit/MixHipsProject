//
//  PlayListViewController.m
//  MixHipsProject
//
//  Created by SDT-1 on 2014. 1. 27..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "PlayListViewController.h"

@interface PlayListViewController () <UITableViewDataSource, UITableViewDelegate, AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UILabel *musicName;
@property (weak, nonatomic) IBOutlet UILabel *singerName;
@end



@implementation PlayListViewController{
    NSArray *musicFiles;
}
//음악 파일 재생
-(void)playMusic:(NSURL *)url{
    if(nil!=self.player){
        if([self.player isPlaying]){
            [self.player stop];
        }
        
        //플레이어 초기화
        self.player = nil;
        
    }
    
    __autoreleasing NSError *error;
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    self.player.delegate = self;
    
    [self.player play];
    
    /*
    if([player prepareToPlay]){
        self.status.text = [NSString stringWithFormat:@"재생 중:%@",[[url path]lastPathComponent]];
        [player play];
        
        //타이머 시작
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    }
     */
}

-(IBAction)play:(id)sender{
    
}

-(IBAction)stop:(id)sender{
    [self.player stop];
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [musicFiles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PLAYLIST_CELL" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *fileName = [musicFiles objectAtIndex:indexPath.row];
    NSURL *urlForPlay = [[NSBundle mainBundle]URLForResource:fileName withExtension:nil];
    [self playMusic:urlForPlay];
    //[self performSegueWithIdentifier:@"play" sender:self];
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
    
    musicFiles = [[NSArray alloc]initWithObjects:@"music1.mp3", @"music2.mp3",@"music3.mp3", nil];
    
    //다른 어플리케이션의 음악 재생을 멈추지 않는 정책
    AVAudioSession *session = [AVAudioSession sharedInstance];
    __autoreleasing NSError *error = nil;
    [session setCategory:AVAudioSessionCategoryAmbient error:&error];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
