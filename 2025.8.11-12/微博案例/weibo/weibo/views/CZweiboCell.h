//
//  CZweiboCell.h
//  weibo
//
//  Created by 基 on 2025/8/16.
//

#import <UIKit/UIKit.h>
#import "CZweiboFrame.h"
NS_ASSUME_NONNULL_BEGIN


@interface CZweiboCell : UITableViewCell
@property (nonatomic, strong) CZweiboFrame *weiboFrame;
@property (nonatomic,weak)UIImageView *imageViewPicture;
@property (nonatomic,weak)UIImageView *imageViewVip;
@property (nonatomic,weak)UIImageView *imageViewIcon;
@property (nonatomic,weak)UILabel *lblName;
@property (nonatomic,weak)UILabel *lblText;
+(instancetype)weiboCellWithTableVIew:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
