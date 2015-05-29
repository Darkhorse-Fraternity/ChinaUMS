//
//  BankTableViewController.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "BankTableViewController.h"

#import "GetProdListEntity.h"
#import "BankTabelSceneModel.h"
#import "HudManage.h"
#import "UIImageView+MJWebCache.h"
#import "OrderSubmitViewController.h"
@interface BankTableViewController ()<ActionDelegate>
@property(nonatomic,strong)BankTabelSceneModel *sceneModel;
@end

@implementation BankTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择银行";
    self.sceneModel = [BankTabelSceneModel SceneModel];
    [self.sceneModel SEND_IQ_ACTION:self.sceneModel.request];
    self.sceneModel.action.aDelegaete = self;
    [HudManage hudWithNormalDownloadRequest:self.sceneModel.request andInView:self.view];
    // Do any additional setup after loading the view.
}

-(void)handleActionMsg:(Request *)msg
{
    if (msg.state == SuccessState) {
        
        self.dataArray = [GetProdListEntity arrayOfModelsFromDictionaries:[msg.output objectForKey:@"Data"]];
        if (self.dataArray.count > 0) {
            [self.tableView reloadData];
        }
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *Identify = @"CellIdentify";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identify];
    }
   
    GetProdListEntity *entity = self.dataArray[indexPath.section];
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100.f)];
    [imgView  setTYTImageURLInBaseURL:entity.IMG_PATH];
//    [imgView alignToView:cell];
    [cell addSubview:imgView];
    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OrderSubmitViewController *submit = MYSTORYBOARD(@"OrderSubmitViewController");
    submit.entity = self.dataArray[indexPath.section];
    
    
    [self.navigationController pushViewController:submit animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
