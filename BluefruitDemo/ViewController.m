//
//  ViewController.m
//  BluefruitDemo
//
//  Created by Angel Terziev on 7.11.18.
//  Copyright © 2018 Angel Terziev. All rights reserved.
//

#import "ViewController.h"

// It is important to import the next file in order to get access to the swift classes
#import "BluefruitDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickButton:(id)sender {
    NSLog(@"%s", __FUNCTION__);
    
    NSString * storyboardName = @"Main";
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (sb == nil) {
        NSLog(@"%s [Error] Could not load storyboard: %@", __FUNCTION__, storyboardName);
        return;
    }
    NSString * scannerViewControllerName = @"ScannerViewController";

    ScannerViewController* scannerViewController = [sb instantiateViewControllerWithIdentifier:scannerViewControllerName];
    if (scannerViewController == nil) {
        NSLog(@"%s [Error] Could not load view: %@", __FUNCTION__, scannerViewControllerName);
        return;
    }
    
    // Add scanner to tabs content viewcontroller
    scannerViewController.tabBarItem.title = NSLocalizedString(@"main_tabbar_centralmode", nil);
    scannerViewController.tabBarItem.image = [UIImage imageNamed: @"tab_centralmode_icon"];

    [self presentViewController:scannerViewController animated:YES completion:^{
        NSLog(@"%s [Success] Did present view : %@", __FUNCTION__, scannerViewControllerName);
    }];
}

@end
