//
//  CallbackBridge.h
//  ProQ
//
//  Created by tonyYo on 15/2/3.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#define CALLBACKBRIDGE(TAG,VALUE) if(self.backValue ){self.backValue(TAG,VALUE);}
@protocol CallbackBridge <NSObject>

@required
typedef void(^BackValue)(int tag,id value);
@property(nonatomic,strong)BackValue backValue;

@optional

@end
