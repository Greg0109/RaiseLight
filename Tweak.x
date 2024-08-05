@interface SBLockScreenManager : NSObject
+ (id)sharedInstance;
- (void)tapToWakeControllerDidRecognizeWakeGesture:(id)arg1;
- (void)lockScreenViewControllerRequestsUnlock;
-(void)_wakeScreenForTapToWake;
-(id)_liftToWakeManager;
-(void)_setLiftToWakeManager:(id)arg1 ;
@end

@interface SBUIFlashlightController : NSObject
+(id)sharedInstance;
-(NSInteger)level;
@end

@interface SBLiftToWakeManager : NSObject
-(void)liftToWakeController:(id)arg1 didObserveTransition:(long long)arg2 deviceOrientation:(long long)arg3 ;
@end

%hook SBLiftToWakeManager
-(void)liftToWakeController:(id)arg1 didObserveTransition:(long long)arg2 deviceOrientation:(long long)arg3 {
	if(([[NSClassFromString(@"SBUIFlashlightController") sharedInstance] level] > 0)) {
    } else {
		%orig;
	}
}
%end

%hook SBLockScreenManager

- (void)_setLiftToWakeManager:(id)arg1 {
	if(([[NSClassFromString(@"SBUIFlashlightController") sharedInstance] level] > 0)) {
    } else {
		%orig;
	}
}

-(void)_wakeScreenForTapToWake {
	if(([[NSClassFromString(@"SBUIFlashlightController") sharedInstance] level] > 0)) {
    } else {
		%orig;
	}
}

%end