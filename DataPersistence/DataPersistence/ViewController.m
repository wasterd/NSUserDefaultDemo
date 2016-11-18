//
//  ViewController.m
//  DataPersistence
//
//  Created by ya Liu on 2016/11/18.
//  Copyright © 2016年 wasterd. All rights reserved.
//
/**
 * NSUserDefault
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取沙盒目录的路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"%@",path);
    

}


- (IBAction)saveData:(id)sender {
    //获取一个NSUserDefaults引用：
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //保存数据
    [defaults setObject:self.usernameTextField.text forKey:@"username"];
    [defaults setObject:self.passwordTextField.text forKey:@"password"];
    [defaults setObject:[NSNumber numberWithInt:23] forKey:@"age"];
    //用归档来存储一个NSData对象
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[UIColor purpleColor]];
    [defaults setObject:data forKey:@"myColor"];
    //把数据同步到磁盘
    [defaults synchronize];
    
}
- (IBAction)getData:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //读取数据
    NSString *psd =    [defaults objectForKey:@"password"];
    NSString *name =  [defaults objectForKey:@"username"];
    //取出NSData对象
    NSData *color = [defaults objectForKey:@"myColor"];
    UIColor *myColor = [NSKeyedUnarchiver unarchiveObjectWithData:color];
    self.view.backgroundColor = myColor;
    
    NSLog(@"用户名:%@ 密码:%@",name,psd);
    
}
@end
