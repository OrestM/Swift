//
//  ObjectiveViewController.m
//  CompileObjcAndSwift
//
//  Created by Orest Mykha on 1/27/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import "ObjectiveViewController.h"
#import "CompileObjcAndSwift-Swift.h"

@interface ObjectiveViewController ()

@property (strong, nonatomic) ViewController *swiftVC;

@end

@implementation ObjectiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentSwiftVC:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.swiftVC = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    self.swiftVC.view.backgroundColor = [UIColor darkGrayColor];
    self.swiftVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:self.swiftVC animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
