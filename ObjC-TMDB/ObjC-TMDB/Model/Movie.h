//
//  Movie.h
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 21/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property NSNumber * _Nonnull id;
@property NSString * _Nullable title;
@property NSString * _Nullable overview;
@property NSNumber * _Nullable rating;
@property NSMutableArray<NSNumber*>* _Nullable genres;
@property UIImage * _Nullable imageCover;

@end
