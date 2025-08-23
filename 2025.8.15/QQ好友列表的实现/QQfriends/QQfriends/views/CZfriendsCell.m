//
//  CZfriendsCell.m
//  QQfriends
//
//  Created by 基 on 2025/8/21.
//

#import "CZfriendsCell.h"
#import "CZfriends.h"
@implementation CZfriendsCell

+(instancetype)friendsWithTableView:(UITableView *)tableView{
    static NSString *ID=@"friend_ID";
    CZfriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell= [[CZfriendsCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
-(void)setFriendModel:(CZfriends *)friendModel{
    _friendModel=friendModel;
    self.imageView.image=[UIImage imageNamed:friendModel.icon];
    self.textLabel.text=friendModel.name;
    self.detailTextLabel.text=friendModel.intro;
    self.textLabel.textColor=friendModel.isVip ?[UIColor redColor]:[UIColor blackColor];
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
