//
//  CZmessageCell.h
//  QQ
//
//  Created by 基 on 2025/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CZmessageFrame;
@interface CZmessageCell : UITableViewCell
@property (nonatomic,strong)CZmessageFrame *messageFrame;
+(instancetype)messageCellWithTableView:(UITableView *)tableview;
@end

NS_ASSUME_NONNULL_END
