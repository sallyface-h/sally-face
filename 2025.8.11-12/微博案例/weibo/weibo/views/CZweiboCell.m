//
//  CZweiboCell.m
//  weibo
//
//  Created by 基 on 2025/8/16.
//

#import "CZweiboCell.h"
#import "CZweibo.h"
#import "czweiboFrame.h"


@implementation CZweiboCell
-(void)setWeiboFrame:(CZweiboFrame *)weiboFrame{
    _weiboFrame=weiboFrame;
    [self settingDate];
    [self settingFrame];
}
-(void)settingDate{
    CZweibo *model=self.weiboFrame.weibo;
    self.lblName.text=model.name;
    self.lblText.text=model.text;
    self.imageViewIcon.image= [UIImage imageNamed:model.icon];
    if (model.isVip) {
        self.imageViewVip.hidden=NO;
    } else {
        self.imageViewVip.hidden=YES;
    }
    if (model.picture) {
        self.imageViewPicture.image =[UIImage imageNamed:model.picture];
        self.imageViewPicture.hidden=NO;
    } else {
        self.imageViewPicture.hidden=YES;
    }
}
-(void)settingFrame{
    self.imageViewIcon.frame=self.weiboFrame.iconFrame;
    
    self.lblName.frame=self.weiboFrame.lblNameFrame;
    
    self.imageViewVip.frame=self.weiboFrame.vipFrame;
    
    self.lblText.frame=self.weiboFrame.lblTextFrame;

    self.imageViewPicture.frame=self.weiboFrame.pictureFrame;
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self= [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imageViewIcon= [[UIImageView alloc]init];
        [self.contentView addSubview:imageViewIcon];
        self.imageViewIcon=imageViewIcon;
        UILabel *lblName=[[UILabel alloc]init];
        [self.contentView addSubview:lblName];
        self.lblName=lblName;
        lblName.font=nameFont;
        UIImageView *imageViewVip= [[UIImageView alloc]init];
        [self.contentView addSubview:imageViewVip];
        imageViewVip.image=[UIImage imageNamed:@"vip"];
        self.imageViewVip=imageViewVip;
        UIImageView *imageViewPicture= [[UIImageView alloc]init];
        [self.contentView addSubview:imageViewPicture];
        self.imageViewPicture=imageViewPicture;
        UILabel *lbltext= [[UILabel alloc]init];
        [self.contentView addSubview:lbltext];
        lbltext.numberOfLines=0;
        self.lblText=lbltext;
        lbltext.font=textFont;
    }
    return self;
}
+(instancetype)weiboCellWithTableVIew:(UITableView *)tableView{
    NSString *ID=@"weiboCell";
    CZweiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[CZweiboCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
