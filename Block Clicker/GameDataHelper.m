//
//  GameDataHelper.m
//  Block Clicker
//
//  Created by Luke Copeland on 3/28/15.
//  Copyright (c) 2015 Travis McMahon. All rights reserved.
//

#import "GameDataHelper.h"

@implementation GameDataHelper
static NSString * const goldKey = @"gold";
static NSString * const timeKey = @"time";

+(instancetype)sharedGameData {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ sharedInstance = [self loadInstance];});
    
    return sharedInstance;
}

-(void)reset{
    self.gold = 0; //Set Gold and time back to zero, new game
    self.time = 0;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeDouble:self.gold forKey:goldKey];
    [encoder encodeDouble:self.time forKey:timeKey];
    
}
-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [self init];
    if(self){
        _gold = [decoder decodeDoubleForKey:goldKey];
        _time = [decoder decodeDoubleForKey:timeKey];
    }
    return self;
}

+(NSString*)filePath {
    static NSString* filePath = nil;
    if(!filePath) {
        filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)firstObject]stringByAppendingPathComponent:@"gamedatahelper"];
    }
    return filePath;
}

+(instancetype)loadInstance{
    NSData* decodedData = [NSData dataWithContentsOfFile:[GameDataHelper filePath]];
    if(decodedData) {
        GameDataHelper* GameDataHelper = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        return GameDataHelper;
    }
    return [[GameDataHelper alloc]init];
}

-(void)save {
    NSData* encodedData = [NSKeyedArchiver archivedDataWithRootObject:self];
    [encodedData writeToFile:[GameDataHelper filePath] atomically:YES];
}

@end
