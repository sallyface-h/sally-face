//
//  CZGroupHeaderView.m
//  QQfriends
//
//  Created by 基 on 2025/8/22.
//

#import "CZGroupHeaderView.h"
#import "czgroup.h"
#import "CZfriends.h"

@implementation CZGroupHeaderView
+(instancetype)groupHeaderViewWithTableView:(UITableView *)tableView{
    static NSString *ID=@"header_ID";
    CZGroupHeaderView *headerView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headerView==nil) {
        headerView= [[CZGroupHeaderView alloc]initWithReuseIdentifier:ID];
    }
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self==[super initWithReuseIdentifier:reuseIdentifier]) {
        UILabel *lblText= [[UILabel alloc]init];
        [self.contentView addSubview:lblText];
        self.lblText=lblText;
        UIButton *button= [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
        [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        self.button=button;
    }
    return self;
}
-(void)buttonClick{
    self.group.visible=!self.group.isVisible;
    if ([self.delegate respondsToSelector:@selector(groupHeaderViewClickTitleButton:)]) {
        [self.delegate groupHeaderViewClickTitleButton:self];
    }
}
- (void)didMoveToSuperview{
    if (self.group.visible) {
        self.button.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.button.imageView.transform=CGAffineTransformMakeRotation(0);
    }
}
- (void)setGroup:(CZgroup *)group{
    _group=group;
    [self.button setTitle:group.name forState:UIControlStateNormal];
    self.lblText.text= [NSString stringWithFormat:@"%d / %ld",group.online,group.friends.count];
    if (self.group.visible) {
        self.button.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.button.imageView.transform=CGAffineTransformMakeRotation(0);
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.button.frame=self.bounds;
    CGFloat lblW=100;
    CGFloat lblH=self.bounds.size.height;
    CGFloat lblX=self.bounds.size.width-10-lblW;
    CGFloat lblY=0;
    self.lblText.frame=CGRectMake(lblX, lblY, lblW, lblH);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
