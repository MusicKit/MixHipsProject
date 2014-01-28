//
//  AlbumProfileViewController.m
//  MixHipsProject
//
//  Created by SDT-1 on 2014. 1. 17..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "AlbumProfileViewController.h"
#define kCellID @"IMG_CELL_ID1"

@interface AlbumProfileViewController ()< UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation AlbumProfileViewController

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"albumjoin" sender:indexPath];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 3;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// 재사용 큐에 셀을 가져온다
	UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
	/*
     // 선택 상태에 따른 셀UI 업데이트
     // "#3. 셀에 대해 더 깊이 파고들어가보자" 글에 있는 약간의 수정 부분에 대한 해결방법. 아래의 두줄이 있을때와 없을때를 비교해보세요.
     cell.layer.borderColor = (cell.selected) ? [UIColor yellowColor].CGColor : nil;
     cell.layer.borderWidth = (cell.selected) ? 5.0f : 0.0f;
     
     // 표시할 이미지 설정
     UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];
     if (imgView) imgView.image = self.dataList[indexPath.section][indexPath.row];
     */
	return cell;
}


- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    /*
     // 요청된 Supplementary View가 헤더인지 확인
     if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
     
     // 재사용 큐에서 뷰를 가져온다
     UICollectionReusableView* view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSupplementaryViewID forIndexPath:indexPath];
     
     NSArray* titles = [[NSArray alloc] initWithObjects:@"Girls", @"Cars", @"Movies", nil];
     
     UILabel* lbl = (UILabel*)[view viewWithTag:100];
     if (lbl) lbl.text = titles[indexPath.section];
     
     return view;
     }
     */
	
	return nil;
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
    
    UINib* nib = [UINib nibWithNibName:@"MypageCell" bundle:nil];
	[self.collectionView registerNib:nib forCellWithReuseIdentifier:kCellID];
	
	
	//[self updateData];
    [self.collectionView reloadData];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
