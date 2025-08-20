//
//  CZmessageFrame.m
//  QQ
//
//  Created by 基 on 2025/8/18.
//

#import "CZmessageFrame.h"
#import <UIKit/UIKit.h>
#import "CZmessage.h"
#import "NSString+CZNSStringExt.h"

@implementation CZmessageFrame
-(void)setMessage:(CZmessage *)message{
    _message=message;
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    CGFloat margin=5;
    
    CGFloat timeX=0;
    CGFloat timeY=0;
    CGFloat timeW=screenW;
    CGFloat timeH=15;
    if (!message.hideTime) {
        _timeFrame=CGRectMake(timeX, timeY, timeW, timeH);
    }
   
    
    CGFloat iconW=50;
    CGFloat iconH=50;
    CGFloat iconY=CGRectGetMaxY(_timeFrame)+margin;
    CGFloat iconX=message.type==typeOthers? margin:screenW-margin-iconW;
    _iconFrame=CGRectMake(iconX, iconY, iconW, iconH);
    
    CGSize textSize= [message.text sizeOfTextWithMaxSize:CGSizeMake(300, MAXFLOAT) font:textFont];
    CGFloat textW=textSize.width+40;
    CGFloat textH=textSize.height+30;
    CGFloat textY=iconY;
    CGFloat textX=message.type==typeOthers? CGRectGetMaxX(_iconFrame):(screenW-margin-iconW-textW);
    _textFrame=CGRectMake(textX, textY, textW
                          , textH);
    CGFloat maxY=MAX(CGRectGetMaxY(_textFrame), CGRectGetMaxY(_iconFrame));
    _rowHeight=maxY+margin;
    
    
}
@end
