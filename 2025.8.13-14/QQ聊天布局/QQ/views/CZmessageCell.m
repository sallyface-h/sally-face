//
//  CZmessageCell.m
//  QQ
//
//  Created by 基 on 2025/8/18.
//

#import "CZmessageCell.h"
#import "CZmessage.h"
#import "CZmessageFrame.h"
@interface CZmessageCell ()
@property (nonatomic,weak)UILabel *lblTime;
@property (nonatomic,weak)UIButton *btnText;
@property (nonatomic,weak)UIImageView *imageIcon;
@end
@implementation CZmessageCell
+(instancetype)messageCellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"message_ID";
    CZmessageCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[CZmessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self== [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *lblTime= [[UILabel alloc]init];
        lblTime.font= [UIFont systemFontOfSize:12];
        lblTime.textAlignment=NSTextAlignmentCenter;
        [self addSubview:lblTime];
        self.lblTime=lblTime;
        
        UIButton *btnText= [[UIButton alloc]init];
        [btnText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnText.titleLabel.numberOfLines=0;
        [self addSubview:btnText];
        self.btnText=btnText;
        btnText.titleLabel.font=textFont;
        
        UIImageView *imageIcon= [[UIImageView alloc]init];
        [self addSubview:imageIcon];
        self.imageIcon=imageIcon;
    }
    self.backgroundColor= [UIColor clearColor];
    return self;
}

- (void)setMessageFrame:(CZmessageFrame *)messageFrame{
    _messageFrame=messageFrame;
    CZmessage *message=messageFrame.message;
    
    
    self.lblTime.text=message.time;
    self.lblTime.frame=messageFrame.timeFrame;
    self.lblTime.hidden=message.hideTime;
    
    NSString *imageIcon= message.type==typeMe ? @"me":@"others";
    self.imageIcon.image= [UIImage imageNamed:imageIcon];
    self.imageIcon.frame=messageFrame.iconFrame;
    
    [self.btnText setTitle:message.text forState:UIControlStateNormal];
    self.btnText.frame=messageFrame.textFrame;
    
    
    NSString *imgNor;
    if (message.type==typeOthers) {
        imgNor=@"others1";
    }else{
        imgNor=@"me1";
    }
    UIImage *imgNormal= [UIImage imageNamed:imgNor];
    [self.btnText setBackgroundImage:imgNormal forState:UIControlStateNormal];
    imgNormal = [imgNormal stretchableImageWithLeftCapWidth:imgNormal.size.width*0.5 topCapHeight:imgNormal.size.height*0.5];
    
    
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
