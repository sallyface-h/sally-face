//
//  CZGroupHeaderView.h
//  QQfriends
//
//  Created by 基 on 2025/8/22.
//

#import <UIKit/UIKit.h>
@class CZgroup;
NS_ASSUME_NONNULL_BEGIN
@class CZGroupHeaderView;
@protocol CZGroupHeaderViewDelegate <NSObject>

-(void)groupHeaderViewClickTitleButton:(CZGroupHeaderView *)groupHeaderView;

@end

@interface CZGroupHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong)CZgroup *group;
@property (nonatomic,weak)UILabel *lblText;
@property (nonatomic,weak)UIButton *button;
@property (nonatomic,weak)id <CZGroupHeaderViewDelegate>delegate;
+(instancetype)groupHeaderViewWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
