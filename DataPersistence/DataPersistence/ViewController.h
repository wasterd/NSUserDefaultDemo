//
//  ViewController.h
//  DataPersistence
//
//  Created by ya Liu on 2016/11/18.
//  Copyright © 2016年 wasterd. All rights reserved.
//

/**
 * NSUserDefault
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)saveData:(id)sender;
- (IBAction)getData:(id)sender;
@end

