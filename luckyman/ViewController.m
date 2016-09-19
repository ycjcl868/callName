//  ViewController.m
//  Luckyman
//
//  Created by KylinKing on 16-09-11.
//  Copyright (c) 2016年 Xi'an. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectedNameLabel;
@property (nonatomic,strong) NSArray *dataSourceArray;//保存所有人的名字
@property (nonatomic,strong) NSTimer *timer;//定时器
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //把所有人的名字保存到一个数组里面
    self.dataSourceArray = @[@"101姜俐", @"102叶新玉", @"103",@"104王琼",@"105杨婷",@"106郭育华",@"107赵凡",@"108张琦",@"109祁丹阳",@"110唐福贵",@"111李昕昱",@"112朱宇轩",@"113王永康",@"114陶柏钢",@"117贾辉",@"118贾启龙",@"119杨朋威",@"120胡宝全",@"121杨盼",@"122卫鹏",@"123罗佳明",@"124吴迪",@"128王路丰",@"129王子童",@"130牟永昌",@"131王能",@"201朱馨锐",@"202代瑶",@"203许慧",@"204兰阳",@"205郭丽斌",@"206王小娟",@"207向雪莹",@"208窦晓熠",@"209付健",@"210张捷",@"211占晨",@"212卢杪华",@"213霍佳琦",@"214王文昊",@"215丁志豪",@"216王翅翎",@"217陈鑫",@"218王灿",@"220吴垚",@"221张平",@"222肖鹏",@"223彭凯",@"226吕江涛",@"227冯宇",@"228王波",@"229王程远",@"229金朝麟",@"230袁浩瑞",@"231王昊懿",@"307惠宁",@"308马宁",@"309霍信赤",@"311张津康",@"312韩泽",@"315吕超",@"316张凯",@"317王向阳",@"318伊扬贵",@"319杨润年",@"320马硕",@"321苏军",@"325刘楚石",@"327雷东格",@"328银家兴",@"330张真"];
}

- (void)didReceiveMemoryning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//响应按钮的点击事件
- (IBAction)buttonDidClicked:(UIButton *)sender {
    
    
    //切换按钮的标题
    if ([sender.titleLabel.text isEqualToString:@"开始"]) {
        //设置标题为stop
        [sender setTitle:@"结束" forState:UIControlStateNormal];
        
        //启动定时器
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(changeName) userInfo:nil repeats:YES];
    }else {
        
        //设置标题为Start
        [sender setTitle:@"开始"  forState:UIControlStateNormal];
        
        //关闭定时器
        [self.timer invalidate];
        
//        //保存当前的位置
//        CGRect rect = self.selectedNameLabel.frame;
//        
//        //移动位置到起始点
//        self.selectedNameLabel.center = _scroNameLabel.center;
        
        //添加动画
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        //获取当前选中的人
        self.scroNameLabel.text = _scroNameLabel.text;
//        self.scroNameLabel.frame  = rect;
        
        [UIView commitAnimations];
    }
}
//定时器触发之后 将来执行这个方法
-(void) changeName{
    //产生一个随机数
    int index = arc4random() % _dataSourceArray.count;
    
    //从数组里面去获取 index对应的人的名字
    NSString *tempName = [_dataSourceArray objectAtIndex:index];
    
    //将当前这个人的名字现实到滚动的label上
    self.scroNameLabel.text = tempName;
    
}
@end