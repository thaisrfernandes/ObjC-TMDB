//
//  TemporaryMovie.h
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 22/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TemporaryMovie : NSObject

@property NSNumber * _Nonnull id;
@property NSString * _Nullable title;
@property NSString * _Nullable overview;
@property NSNumber * _Nullable rating;
@property NSMutableArray<NSNumber*>* _Nullable genres;
@property NSString * _Nullable posterPath;

@end
