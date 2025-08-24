//
//  CZAppCell.m
//  APP
//
//  Created by 基 on 2025/8/23.
//

#import "CZAppCell.h"
#import "CZApp.h"
@interface CZAppCell()
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
@property (weak, nonatomic) IBOutlet UIButton *downLoad;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

- (IBAction)buttonDownloadClick;



@end

@implementation CZAppCell
- (void)setApps:(CZApp *)apps{
    self.imgView.image= [UIImage imageNamed:apps.icon];
    self.lblName.text=apps.name;
    self.lblInfo.text= [NSString stringWithFormat:@"大小：%@ |下载量：%@",apps.size,apps.download];
    self.downLoad.backgroundColor=[UIColor greenColor];
    if (apps.isdownLoaded) {
        self.downLoad.enabled=NO;
    } else {
        self.downLoad.enabled=YES;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)buttonDownloadClick {
    self.downLoad.enabled=NO;
    self.apps.isdownLoaded=YES;
    if ([self.delegate respondsToSelector:@selector(appCellDidClickDownLoadButton:)]) {
        [self.delegate appCellDidClickDownLoadButton:self];
    }
}
@end
