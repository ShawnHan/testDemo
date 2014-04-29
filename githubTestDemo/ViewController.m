//
//  ViewController.m
//  githubTestDemo
//
//  Created by Shawn on 14-4-24.
//  Copyright (c) 2014年 hanlong. All rights reserved.
//

#import "ViewController.h"
#import "WelcomeViewController.h"
#import "GHWalkThroughView.h"

static NSString * const sampleDesc1 = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque tincidunt laoreet diam, id suscipit ipsum sagittis a. ";

static NSString * const sampleDesc2 = @" Suspendisse et ultricies sem. Morbi libero dolor, dictum eget aliquam quis, blandit accumsan neque. Vivamus lacus justo, viverra non dolor nec, lobortis luctus risus.";

static NSString * const sampleDesc3 = @"In interdum scelerisque sem a convallis. Quisque vehicula a mi eu egestas. Nam semper sagittis augue, in convallis metus";

static NSString * const sampleDesc4 = @"Praesent ornare consectetur elit, in fringilla ipsum blandit sed. Nam elementum, sem sit amet convallis dictum, risus metus faucibus augue, nec consectetur tortor mauris ac purus.";

static NSString * const sampleDesc5 = @"Sed rhoncus arcu nisl, in ultrices mi egestas eget. Etiam facilisis turpis eget ipsum tempus, nec ultricies dui sagittis. Quisque interdum ipsum vitae ante laoreet, id egestas ligula auctor";

@interface ViewController () <GHWalkThroughViewDataSource>
@property (nonatomic, strong) GHWalkThroughView* ghView ;

@property (nonatomic, strong) NSArray* descStrings;

@property (nonatomic, strong) UILabel* welcomeLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    detailButton.frame = CGRectMake(80, 100, 100, 40);
    [detailButton setTitle:@"gotodetail" forState:UIControlStateNormal];
    [detailButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [detailButton addTarget:self action:@selector(gotoDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:detailButton];
    
    UIButton *welComeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    welComeButton.frame = CGRectMake(80, 200, 100, 40);
    [welComeButton setTitle:@"welcome" forState:UIControlStateNormal];
    [welComeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [welComeButton addTarget:self action:@selector(gotoWelcome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:welComeButton];
    
    _ghView = [[GHWalkThroughView alloc] initWithFrame:self.navigationController.view.bounds];
    [_ghView setDataSource:self];
    [_ghView setWalkThroughDirection:GHWalkThroughViewDirectionVertical];
    
    UILabel* welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    welcomeLabel.text = @"Welcome";
    welcomeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40];
    welcomeLabel.textColor = [UIColor whiteColor];
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    self.welcomeLabel = welcomeLabel;

    self.descStrings = [NSArray arrayWithObjects:sampleDesc1,sampleDesc2, sampleDesc3, sampleDesc4, sampleDesc5, nil];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)gotoDetail
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    WelcomeViewController *welView = [[WelcomeViewController alloc] init];
    [self.navigationController pushViewController:welView animated:YES];
}
-(void)gotoWelcome
{
    self.ghView.isfixedBackground = NO;
    
    [_ghView setFloatingHeaderView:self.welcomeLabel];
    [self.ghView setWalkThroughDirection:GHWalkThroughViewDirectionHorizontal];
    [self.ghView showInView:self.navigationController.view animateDuration:0.3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GHDataSource

-(NSInteger) numberOfPages
{
    return 5;
}

- (void) configurePage:(GHWalkThroughPageCell *)cell atIndex:(NSInteger)index
{
    cell.title = [NSString stringWithFormat:@"This is page %d", index+1];
    cell.titleImage = [UIImage imageNamed:[NSString stringWithFormat:@"title%d", index+1]];
    cell.desc = [self.descStrings objectAtIndex:index];
}
- (UIImage*) bgImageforPage:(NSInteger)index
{
    NSString* imageName =[NSString stringWithFormat:@"bg_0%d.jpg", index+1];
    UIImage* image = [UIImage imageNamed:imageName];
    return image;
}


@end
