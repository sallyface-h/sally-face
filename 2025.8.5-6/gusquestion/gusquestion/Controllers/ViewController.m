//
//  ViewController.m
//  gusquestion
//
//  Created by 基 on 2025/8/7.
//

#import "ViewController.h"
#import "CZqusetions.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *questions;
@property(nonatomic,assign)int index;
@property(nonatomic, assign) NSInteger tipIndex;
@property (weak, nonatomic) IBOutlet UIButton *next;
- (IBAction)buttonNext;
- (IBAction)bigImage:(id)sender;
- (IBAction)iconBigImage;
- (IBAction)buttonTip;

@property (weak, nonatomic) IBOutlet UIButton *buttonScore;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *buttonIcon;
@property (weak, nonatomic) IBOutlet UIButton *cover;
@property(nonatomic,assign)CGRect iconFrame;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;
@property (weak, nonatomic) IBOutlet UIButton *tipButton;



@end

@implementation ViewController
-(NSArray *)questions{
    if (_questions==nil){
        NSString *path= [[NSBundle mainBundle]pathForResource:@"question.plist" ofType:nil];
        NSArray *arrayDict= [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZqusetions *model = [CZqusetions questionWithDict:dict];
            [arrayModel addObject:model];
        }
        _questions=arrayModel;
    }
    return _questions;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.index=-1;
    [self buttonNext];
}

- (IBAction)buttonTip {
    [self addScore:-1000];
    CZqusetions *model = self.questions[self.index];
    UIButton *firstEmptyAnswerButton = nil;
    for (UIButton *answerButton in self.answerView.subviews) {
        if (answerButton.currentTitle == nil ) {
            firstEmptyAnswerButton = answerButton;
            break;
        }
    }
    if (!firstEmptyAnswerButton) {
        return;
    }
    if (self.tipIndex >= model.answer.length) {
        self.tipIndex = 0;
    }
    NSString *charToShow = [model.answer substringWithRange:NSMakeRange(self.tipIndex, 1)];
    for (UIButton *optionButton in self.optionsView.subviews) {
        if ([optionButton.currentTitle isEqualToString:charToShow] && !optionButton.hidden) {
            [self optionButtonClick:optionButton];
            self.tipIndex++;
            break;
        }
    }
}

- (IBAction)iconBigImage {
    if (self.cover==nil) {
        [self bigImage:nil];
    } else {
        [self smallImage];
    }
}

- (IBAction)bigImage:(id)sender {
    self.iconFrame=self.buttonIcon.frame;
    UIButton *binCover= [[UIButton alloc]init];
    binCover.frame=self.view.bounds;
    binCover.backgroundColor= [UIColor blackColor];
    binCover.alpha=0;
    [self.view addSubview:binCover];
    self.cover=binCover;
    [binCover addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.buttonIcon];
    CGFloat iconW=self.view.frame.size.width;
    CGFloat iconH=iconW;
    CGFloat iconX=0;
    CGFloat iconY=(self.view.frame.size.height-iconW)*0.5;
    [UIView animateWithDuration:1 animations:^{
        self.buttonIcon.frame=CGRectMake(iconX, iconY, iconW, iconH);
        binCover.alpha=0.7;
    }];
}
    - (IBAction)buttonNext {
        self.index++;
        self.tipIndex=0;
        if (self.index==self.questions.count) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"恭喜通关" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                self.index=-1;
                [self buttonNext];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self.index=-1;
                [self buttonNext];
            }]] ;
            [self presentViewController:alert animated:YES completion:nil];

            return;
        }
        CZqusetions *model= self.questions[self.index];
        self.optionsView.userInteractionEnabled = YES;
        [self settingDate:model];
        [self makeAnswerButton:model];
        [self makeOptionButton:model];
        
        
    }
-(void)smallImage{
    [UIView animateWithDuration:1 animations:^{
            self.buttonIcon.frame=self.iconFrame;
            self.cover.alpha=0;
        }completion:^(BOOL finished){
            [self.cover removeFromSuperview];
            self.cover=nil;
        }];
}
-(void)settingDate:(CZqusetions *)model{
    self.label.text=[NSString stringWithFormat:@"%d/%ld",_index+1,_questions.count];
    [self.buttonIcon setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    self.next.enabled=(self.index!=_questions.count-1);
}
-(void)makeAnswerButton:(CZqusetions *)model{
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger len= model.answer.length;
    CGFloat margin=10;
    CGFloat answerIconW=35;
    CGFloat answerIconH=35;
    CGFloat answerIconY=0;
    CGFloat marginLeft=(self.answerView.frame.size.width-(answerIconW*len)-margin*(len-1))/2;
    for (int i=0; i<len; i++) {
        UIButton *answerButton= [[UIButton alloc] init];
        [answerButton setBackgroundImage:[UIImage imageNamed:@"bin"] forState:UIControlStateNormal];
        CGFloat answerIconX=marginLeft+i*(answerIconW+margin);
        answerButton.frame=CGRectMake(answerIconX, answerIconY, answerIconW, answerIconH);
        [answerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.answerView addSubview:answerButton];
        [answerButton addTarget:self action:@selector(answerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)answerButtonClick:(UIButton *)sender{
    self.optionsView.userInteractionEnabled = YES;
    [self answerButtonTitleColor:[UIColor blackColor]];
    for (UIButton *optionButton in self.optionsView.subviews) {
        if (optionButton.tag==sender.tag) {
            optionButton.hidden=NO;
            break;
        }
    }
    [sender setTitle:nil forState:UIControlStateNormal];
}
-(void)makeOptionButton:(CZqusetions *)model{
    [self.optionsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSArray *words = model.options;
    CGFloat buttonW=35;
    CGFloat buttonH=35;
    CGFloat margin=10;
    int num=7;
    CGFloat marginLeft=(self.optionsView.frame.size.width-(num*buttonW)-(num-1)*margin)/2;
    for (int i=0; i<words.count; i++) {
        UIButton *optionButton= [[UIButton alloc]init];
        optionButton.tag=i;
        [optionButton setBackgroundImage:[UIImage imageNamed:@"bin1"] forState:UIControlStateNormal];
        [optionButton setTitle:words[i] forState:UIControlStateNormal];
        [optionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        int colIdx=i%num;
        int rowIdc=i/num;
        CGFloat buttonX=marginLeft+colIdx*(buttonW+margin);
        CGFloat buttonY=rowIdc*(buttonH+margin);
        optionButton.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [self.optionsView addSubview:optionButton];
        [optionButton addTarget:self action:@selector(optionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)optionButtonClick:(UIButton *)sender{
    sender.hidden=YES;
    NSString *text=sender.currentTitle;
    for (UIButton *answerButton in self.answerView.subviews) {
        if (answerButton.currentTitle==nil) {
            [answerButton setTitle:text forState:UIControlStateNormal];
            answerButton.tag=sender.tag;
            break;
        }
    }
    BOOL isFull=YES;
    NSMutableString *mutaString= [NSMutableString string];
    for (UIButton *ansButton in self.answerView.subviews) {
        if (ansButton.currentTitle==nil) {
            isFull=NO;
            break;
        }else{
            [mutaString appendString:ansButton.currentTitle];
        }
    }
    if (isFull){
        self.optionsView.userInteractionEnabled=NO;
        CZqusetions *model=self.questions[self.index];
        if ([model.answer isEqualToString:mutaString]) {
            [self answerButtonTitleColor:[UIColor blueColor]];
            [self addScore:100];
            [self performSelector:@selector(buttonNext)withObject:nil afterDelay:1.5];
        } else {
            [self answerButtonTitleColor:[UIColor redColor]];
        }
    }
}
-(void)answerButtonTitleColor:(UIColor *)Color{
    for (UIButton *answerButton in self.answerView.subviews) {
        [answerButton setTitleColor:Color forState:UIControlStateNormal];
    }
}
-(void)addScore:(int)score{
    NSString *str=self.buttonScore.currentTitle;
    int currentScore=str.intValue;
    currentScore=currentScore+score;
    [self.buttonScore setTitle:[NSString stringWithFormat:@"%d",currentScore] forState:UIControlStateNormal];
}
@end
