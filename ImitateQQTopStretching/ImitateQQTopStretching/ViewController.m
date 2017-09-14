//
//  ViewController.m
//  ImitateQQTopStretching
//
//  Created by 众力金融 on 2017/9/12.
//  Copyright © 2017年 众力金融. All rights reserved.
//

#import "ViewController.h"
#import "QQTopStretchingCell.h"
#import "UINavigationBar+ChangeBackgroundImage.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 头视图 */
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, assign) CGRect customaryFrame;

@end

@implementation ViewController

static const CGFloat backGroupHeight = 264;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"个人中心";
    [self SetUpheaderView];
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar hr_star];
    //该页面呈现时手动调用计算导航栏此时应当显示的颜色
    [self scrollViewDidScroll:self.tableView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar hr_reset];
}

- (void)SetUpheaderView {
   
     self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.headerImageView];
    self.customaryFrame = self.headerImageView.frame;
}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, self.view.frame.size.width, backGroupHeight)];
        _headerImageView.image = [UIImage imageNamed:@"BGimage"];
    }
    return _headerImageView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * const CellIdentifier  = @"QQTopStretchingCell";
    QQTopStretchingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"数据%ld",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat alpha = 0.0;
    if (offsetY > 0) {  //往上移动
        CGRect frame = self.customaryFrame;
        frame.origin.y = self.customaryFrame.origin.y - offsetY;
        self.headerImageView.frame = frame;
        //计算透明度
        alpha =  MIN(1.0f, scrollView.contentOffset.y / backGroupHeight);
    }else{ //往下移动
         CGRect frame = self.customaryFrame;
         frame.size.height = self.customaryFrame.size.height - offsetY;
         frame.size.width = frame.size.height / (self.customaryFrame.size.height / self.customaryFrame.size.width);
         frame.origin.x = (self.customaryFrame.size.width - frame.size.width) / 2;
         self.headerImageView.frame = frame;
         alpha = 0.0;
    }
    
    if (alpha > 0.5) {
        [self.navigationController.navigationBar hr_titleColor:[UIColor redColor]];
    }else{
        [self.navigationController.navigationBar hr_titleColor:[UIColor whiteColor]];
    }
    

    [self.navigationController.navigationBar hr_setBackgroundImage:[UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1] withAlpha:alpha];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
