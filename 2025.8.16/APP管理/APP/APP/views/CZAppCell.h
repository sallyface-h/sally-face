//
//  CZAppCell.h
//  APP
//
//  Created by 基 on 2025/8/23.
//

#import <UIKit/UIKit.h>
@class CZApp;
@class CZAppCell;
NS_ASSUME_NONNULL_BEGIN
@protocol CZAppCellDelegate <NSObject>

-(void)appCellDidClickDownLoadButton:(CZAppCell *)appCell;

@end

@interface CZAppCell : UITableViewCell
@property (nonatomic,weak)id <CZAppCellDelegate>delegate;
@property (nonatomic,strong)CZApp *apps;
@end

NS_ASSUME_NONNULL_END
