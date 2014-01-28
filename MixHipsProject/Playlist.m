//
//  Playlist.m
//  MixHipsProject
//
//  Created by SDT-1 on 2014. 1. 27..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Playlist.h"

@implementation Playlist

+ (id)playlist:(NSString *)musicName singerName:(NSString *)singerName image:(NSString *)image{
    
    Playlist *list = [[Playlist alloc]init];
    list.musicName = musicName;
    list.singerName = singerName;
    list.imageName = image;
    
    return list;
}

@end
