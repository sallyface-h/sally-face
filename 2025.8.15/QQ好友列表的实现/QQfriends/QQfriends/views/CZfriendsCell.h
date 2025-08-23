//
//  CZfriendsCell.h
//  QQfriends
//
//  Created by 基 on 2025/8/21.
//

#import <UIKit/UIKit.h>
@class CZfriends;
NS_ASSUME_NONNULL_BEGIN

@interface CZfriendsCell : UITableViewCell
@property (nonatomic,strong)CZfriends *friendModel;
+(instancetype)friendsWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END

