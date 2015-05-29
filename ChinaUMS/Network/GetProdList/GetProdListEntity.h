//
//  GetProdListEntity.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/13.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "Model.h"

@interface GetProdListEntity : Model
@property(nonatomic,strong)NSNumber *PROD_ID;
@property(nonatomic,strong)NSString *PROD_NM;
@property(nonatomic,strong)NSString *CONTENT_NO;
@property(nonatomic,strong)NSString *IMG_PATH;
@end
