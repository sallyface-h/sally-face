//
//  CZweiboFrame.m
//  weibo
//
//  Created by 基 on 2025/8/16.
//

#import "CZweiboFrame.h"


@implementation CZweiboFrame
-(void)setWeibo:(CZweibo *)weibo{
    _weibo=weibo;
    CGFloat margin=10;
    CGFloat iconX=margin;
    CGFloat iconY=margin;
    CGFloat iconW=40;
    CGFloat iconH=40;
    _iconFrame=CGRectMake(iconX, iconY, iconW, iconH);
    
    NSString *nickName=weibo.name;
    CGFloat nameX= CGRectGetMaxX(_iconFrame)+margin;
    CGSize nameSize=[self sizeWithText:nickName adfMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    CGFloat nameW=nameSize.width;
    CGFloat nameH=nameSize.height;
    CGFloat nameY=iconY+(iconH-nameH)/2;
    _lblNameFrame=CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat vipW=10;
    CGFloat vipH=10;
    CGFloat vipX=CGRectGetMaxX(_lblNameFrame)+margin;
    CGFloat vipY=nameY;
    _vipFrame=CGRectMake(vipX, vipY, vipW, vipH);
    
    CGFloat textX=iconX;
    CGFloat textY=CGRectGetMaxY(_iconFrame)+margin;
    CGSize textSize= [self sizeWithText:weibo.text adfMaxSize:CGSizeMake(402, MAXFLOAT) andFont:textFont];
    CGFloat textW=textSize.width;
    CGFloat textH=textSize.height;
    _lblTextFrame=CGRectMake(textX, textY, textW, textH);
    
    CGFloat picW=100;
    CGFloat picH=100;
    CGFloat picX=iconX;
    CGFloat picY=CGRectGetMaxY(_lblTextFrame)+margin;
    _pictureFrame = CGRectMake(picX, picY, picW, picH);
    CGFloat rowHeight=0;
    if (self.weibo.picture) {
        rowHeight=CGRectGetMaxY(_pictureFrame)+margin;
    } else {
        rowHeight=CGRectGetMaxY(_lblTextFrame)+margin;
    }
    _rowHeight=rowHeight;
}
-(CGSize)sizeWithText:(NSString *)text adfMaxSize:(CGSize)maxSize andFont:
(UIFont *)font{
    NSDictionary *attr=@{NSFontAttributeName:font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
@end
