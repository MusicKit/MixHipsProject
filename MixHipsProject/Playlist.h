//
//  Playlist.h
//  MixHipsProject
//
//  Created by SDT-1 on 2014. 1. 27..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Playlist : NSObject

@property (strong, nonatomic) NSString *musicName, *singerName, *imageName;

+ (id)playlist:(NSString *)musicName singerName:(NSString *)singerName image:(NSString *)image;

@end
