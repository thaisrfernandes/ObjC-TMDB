//
//  MovieCell.m
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 23/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MovieCell.h"

@implementation MovieCell

-(void)awakeFromNib {
    [super awakeFromNib];
}

@end

//fazer ibdesignable
//@IBDesignable class UIRoundedImageView: UIImageView {
//    //MARK: - UI Setup
//    override func prepareForInterfaceBuilder() {
//        commonInit()
//    }
//
//    func commonInit() {
//        layer.cornerRadius = cornerRadius
//    }
//
//    //MARK: - Inspectable Variables - cornerRadius
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//}
