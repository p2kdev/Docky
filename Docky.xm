#import "Docky.h"

NSDictionary *prefs = nil;

int columns = 5;
bool ipx = false;
CGFloat heightMultiplier = 1.75;

bool dpkgInvalid = NO;
bool enabled = YES;
bool fiveIcons = YES;
bool infinitePaging = NO;
bool infiniteScrollbar = YES;
bool infiniteSnap = YES;
bool infiniteReset = YES;
CGFloat infiniteSpacing = 10;
NSInteger dockMode = 1; // 0 - regular, 1 - double, 2 - expandable, 3 - infinite
NSInteger forceStyle = 1; // 0 - no, 1 - ipx, 2 - ipold
CGFloat backgroundAlpha = 1.0;

SBDockView *dockView = nil;
UIScrollView *dockScrollView = nil;
CGSize iconSize = CGSizeZero;

@implementation DCKScrollViewDelegate

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat iconWidth = (iconSize.width > 0) ? iconSize.width + infiniteSpacing : 10;
    NSInteger index = floor((targetContentOffset->x - infiniteSpacing) / iconWidth);

    if (((targetContentOffset->x - infiniteSpacing) - (floor(targetContentOffset->x / iconWidth) * iconWidth)) > iconWidth/2) {
        index++;
    }

    targetContentOffset->x = index * iconWidth + infiniteSpacing;
}

@end

%group Docky

%hook SBDockView

%property (nonatomic, retain) UIPanGestureRecognizer *dckGestureRecognizer;
%property (nonatomic, retain) UIScrollView *dckScrollView;
%property (nonatomic, retain) DCKScrollViewDelegate *dckScrollViewDelegate;

-(id)initWithDockListView:(UIView *)dockListView forSnapshot:(BOOL)arg2 {
    %orig;

    if (dockMode == 2) {
        self.dckGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dckGesture:)];
        self.dckGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
        [self addGestureRecognizer:self.dckGestureRecognizer];
    }

    else if (dockMode == 3) {
	    //UIView *backgroundView = MSHookIvar<UIView *>(self, "_backgroundView");
        self.dckScrollView = [[UIScrollView alloc] initWithFrame:[self bounds]];
        [self addSubview:self.dckScrollView];
        [dockListView removeFromSuperview];
        [self.dckScrollView addSubview:dockListView];
        dockScrollView = self.dckScrollView;

        if (infiniteSnap && !infinitePaging) {
            self.dckScrollViewDelegate = [DCKScrollViewDelegate alloc];
            self.dckScrollView.delegate = self.dckScrollViewDelegate;
        }

        self.dckScrollView.pagingEnabled = infinitePaging;
        self.dckScrollView.showsHorizontalScrollIndicator = infiniteScrollbar;
        self.dckScrollView.showsVerticalScrollIndicator = infiniteScrollbar;
        self.dckScrollView.layer.masksToBounds = YES;
        self.dckScrollView.translatesAutoresizingMaskIntoConstraints = NO;

        UIView *anchorView = self;
        //if (ipx) anchorView = backgroundView;

        [NSLayoutConstraint activateConstraints:@[
            [self.dckScrollView.topAnchor constraintEqualToAnchor:anchorView.topAnchor constant:0],
            [self.dckScrollView.bottomAnchor constraintEqualToAnchor:anchorView.bottomAnchor constant:0],
            [self.dckScrollView.leadingAnchor constraintEqualToAnchor:anchorView.leadingAnchor constant:0],
            [self.dckScrollView.trailingAnchor constraintEqualToAnchor:anchorView.trailingAnchor constant:0],
        ]];

    }

    dockView = self;

	[self setBackgroundAlpha:1];

    return self;
}

-(void)_updateCornerRadii {
    %orig;

    if (dockMode == 3) {
	    UIView *backgroundView = MSHookIvar<UIView *>(self, "_backgroundView");
        self.dckScrollView.layer.continuousCorners = backgroundView.layer.continuousCorners;
        self.dckScrollView.layer.cornerRadius = backgroundView.layer.cornerRadius;
        return;
    }
}

-(void)setBackgroundAlpha:(double)alpha {
    %orig(alpha * backgroundAlpha);
}

-(double)dockHeight {
    if (dockMode == 1) return %orig * heightMultiplier;
    return %orig;
}

-(CGRect)dockListViewFrame {
    if (dockMode == 3) return CGRectMake(0, [self dockHeightPadding], 10000, [self dockHeight]);
    return %orig;
}

-(void)layoutSubviews {
    %orig;

    if (dockMode == 0 || dockMode == 3) return;
    if (self.frame.size.height < 10) return;

	UIView *backgroundView = MSHookIvar<UIView *>(self, "_backgroundView");
    CGRect oldFrame = backgroundView.frame;
    backgroundView.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, self.frame.size.height - oldFrame.origin.x);

	UIView *iconListView = MSHookIvar<UIView *>(self, "_iconListView");
    iconListView.clipsToBounds = YES;
    CGRect otherFrame = iconListView.frame;
    iconListView.frame = CGRectMake(0, 0, otherFrame.size.width, self.frame.size.height - oldFrame.origin.x);
	[self setBackgroundAlpha:1];
}

%new
-(void)dckGesture:(UIPanGestureRecognizer *)recognizer {
    if (dockMode != 2) return;

    CGPoint translation = [recognizer translationInView:self];
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        bool visible = YES;

        CGFloat height = [self dockHeight];
        if (self.frame.origin.y > height) {
            visible = NO;
        }

        CGPoint velocity = [recognizer velocityInView:self];
        if (velocity.y > 5) {
            visible = NO;
        } else if (velocity.y < -5) {
            visible = YES;
        }

        [self dckVisible:visible];
    } else {
        [self dckHeight:self.frame.size.height - translation.y];
    }

    [recognizer setTranslation:CGPointZero inView:self];
}

%new
-(void)dckHeight:(CGFloat)height {
    [self.superview bringSubviewToFront:self];


	UIView *backgroundView = MSHookIvar<UIView *>(self, "_backgroundView");
    CGRect oldFrame = backgroundView.frame;

    UIView *iconListView = MSHookIvar<UIView *>(self, "_iconListView");
    CGRect otherFrame = iconListView.frame;

    backgroundView.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, height - oldFrame.origin.x);
    iconListView.frame = CGRectMake(otherFrame.origin.x, 0, otherFrame.size.width, height - oldFrame.origin.x);
    self.frame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height - height, self.frame.size.width, height);
}

%new
-(void)dckVisible:(BOOL)visible {
    if (dockMode != 2) return;

    CGFloat height = [self dockHeight];
    if (visible) {
        height *= heightMultiplier;
    }

    [UIView animateWithDuration:0.4
            delay:0.0
            usingSpringWithDamping:0.55
            initialSpringVelocity:0.1
            options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self dckHeight:height];
    } completion:NULL];
}

%end

%hook SBIconModel
- (id)initWithStore:(id)arg applicationDataSource:(id)arg2
{
    id x = %orig(arg, arg2);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveNotification:) name:@"DockyResetIconViews" object:nil];
    return x;
}

%new
- (void)recieveNotification:(NSNotification *)notification
{
    @try {
        [self layout];
    }
    @catch (NSException *exception) {
        NSLog(@"SBICONMODEL CRASH: %@", exception);
    }
}
%end
%hook SBIconController

-(unsigned long long)maxIconCountForDock {
    return [%c(SBRootFolderDockIconListView) maxIcons];
}

%end

%hook UITraitCollection

-(CGFloat)displayCornerRadius {
    CGFloat ret = %orig;
    if (forceStyle > 0) {
        ret = (forceStyle == 1) ? 6 : 0;
    }

    ipx = ret > 0;

    return ret;
}
-(NSInteger)userInterfaceStyle
{
	return %orig;
}
%end

%hook SBDockIconListView

-(void)updateEditingStateAnimated:(BOOL)animated {
    %orig;

    if (dockMode == 2 && [self isEditing]) {
        [dockView dckVisible:YES];
    }
}

+(unsigned long long)iconColumnsForInterfaceOrientation:(long long)arg1 {
    if (arg1 > 1) return (dockMode == 1 || dockMode == 2) ? 2 : 1;

    if (dockMode == 3) return 100;
    return (fiveIcons) ? 5 : 4;
}

-(void)setMinimumNumberOfIconsToDistributeEvenlyToEdges:(unsigned long long)arg1 {
    %orig(0);
}

+(unsigned long long)iconRowsForInterfaceOrientation:(long long)arg1 {
    if (arg1 > 1) {
        if (dockMode == 3) return 100;
        return (fiveIcons) ? 5 : 4;
    }

    return (dockMode == 1 || dockMode == 2) ? 2 : 1;
}

-(void)setFrame:(CGRect)frame {
    if (dockMode != 3) {
        %orig;
        return;
    }

    %orig(CGRectMake(0, frame.origin.y, 10000, frame.size.height));
}

+(unsigned long long)maxVisibleIconRowsInterfaceOrientation:(long long)arg1 {
    return [%c(SBRootFolderDockIconListView) iconRowsForInterfaceOrientation:arg1];
}

+(unsigned long long)maxIcons {
    if (dockMode == 3) return 100;
    return 1 + ((fiveIcons) ? 5 : 4) * ((dockMode == 0) ? 1 : 2);
}

-(BOOL)allowsAddingIconCount:(unsigned long long)arg1 {
    if (dockMode == 3) return YES;
    if (dockMode != 0) {
        int count = [[self icons] count];
        return ((arg1 + count) <= ((fiveIcons ? 5 : 4) * 2)+1);
    }

    return %orig;
}

+(unsigned long long)maxVisibleIcons {
    return [%c(SBRootFolderDockIconListView) maxIcons];
}

-(double)_additionalHorizontalInsetToCenterIcons {
    return 0;
}

-(double)_additionalVerticalInsetToCenterIcons {
    return 0;
}

-(unsigned long long)columnAtPoint:(CGPoint)arg1 {
    if (dockMode != 3) return %orig;
    CGSize size = CGSizeMake(60,60);

    if (infinitePaging) {
        int page = ceil(arg1.x/dockScrollView.frame.size.width);
        int max = (fiveIcons) ? 5 : 4;
        CGFloat offset = (dockScrollView.frame.size.width - max * (size.width + infiniteSpacing))/2;
        CGFloat x = offset * ((page - 1)*2 + 1);

        return (arg1.x - x - infiniteSpacing/2)/(size.width + infiniteSpacing);
    } else {
        return (arg1.x - infiniteSpacing)/(size.width + infiniteSpacing);
    }
}

-(unsigned long long)rowAtPoint:(CGPoint)arg1 {
    if (dockMode == 0) return %orig;
    if (dockMode == 3) return 0;

    CGFloat div = arg1.y/[%c(SBRootFolderDockIconListView) defaultHeight];
    return (div < 1) ? 1 : 0;
}

-(CGRect)boundsForLayout {
    if (dockMode != 3) return %orig;

    CGFloat height = 92; //todo find a proper value

    int count = [[self icons] count];

    // NSString *msg = [NSString stringWithFormat:@"Icon Count - %d",count];
    // UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Docky" message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    // [alertView show];

    CGSize size = CGSizeMake(60,60);
    CGFloat width = count * (size.width + infiniteSpacing) + infiniteSpacing*2;

    if (infinitePaging) {
        int max = (fiveIcons) ? 5 : 4;
        width = dockScrollView.frame.size.width * ((count%max == 0) ? ceil(count/max) : ceil(count/max + 1));
    }

    CGRect newFrame = CGRectMake(0, 0, width, height);
    dockScrollView.contentSize = CGSizeMake(width, height);

    return newFrame;
}

-(CGPoint)originForIconAtCoordinate:(SBIconCoordinate)arg1 numberOfIcons:(NSUInteger)arg2 {
    if (dockMode == 0 && !fiveIcons) return %orig;

    CGSize size = CGSizeMake(60,60);
    iconSize = size;

    if (dockMode == 3) {
        CGPoint orig = %orig;
        CGFloat x = infiniteSpacing;

        if (infinitePaging) {
            int max = (fiveIcons) ? 5 : 4;
            CGFloat offset = (dockScrollView.frame.size.width - max * (size.width + infiniteSpacing))/2;
            x = offset * (ceil((arg1.col - 1)/max)*2 + 1);
        }

        return CGPointMake(((size.width + infiniteSpacing) * (arg1.col - 1)) + x + infiniteSpacing/2, orig.y);
    }



    CGFloat top = [%c(SBRootFolderDockIconListView) defaultHeight] - size.height * 1.2;

    CGFloat x = (size.width + (fiveIcons ? 5 : 20)) * (arg1.col - 1) + (fiveIcons ? 25 : 35);
    CGFloat y = (size.height + [dockView dockHeightPadding]/2 + 15) * (arg1.row - 1) + top;

    if (ipx) {
        top = [%c(SBRootFolderDockIconListView) defaultHeight] - [dockView dockHeightPadding] - size.height * 1.2;
        y = (size.height + [dockView dockHeightPadding] + 2 + 15) * (arg1.row - 1) + top;
    }

    return CGPointMake(x, y);
}
-(CGFloat)verticalIconPadding
{
    return 10;
}

-(CGFloat)effectiveSpacing
{
    return 40;
}

%end

%hook SBLockScreenManager
  -(void)lockUIFromSource:(int)arg1 withOptions:(id)arg2
  {
    %orig;
    if (infiniteReset)
      [dockScrollView setContentOffset:CGPointZero animated:YES];
  }
%end


%end

%group iOS13

@interface SBIconListGridLayoutConfiguration : NSObject
@property (nonatomic, assign) NSString *iconLocation;
- (NSUInteger)numberOfPortraitRows;
- (NSUInteger)numberOfPortraitColumns;
- (NSString *)locationIfKnown;
@end
%hook SBIconListGridLayoutConfiguration

%property (nonatomic, assign) NSString *iconLocation;

%new
- (NSString *)locationIfKnown
{
    if (self.iconLocation) return self.iconLocation;
    // Guess if it hasn't been set
    else
    {
        if ([self numberOfPortraitRows] <= 2)
        {
            self.iconLocation =  @"SBIconLocationDock";
        }
        else if ([self numberOfPortraitRows] == 3 && [self numberOfPortraitColumns] == 3)
        {
            self.iconLocation =  @"SBIconLocationFolder";
        }
        else
        {
            self.iconLocation =  @"SBIconLocationRoot";
        }
    }
    return self.iconLocation;
}

- (NSUInteger)numberOfPortraitRows
{
	NSUInteger x = %orig;

    if (x == 1 && dockMode == 3) return 100;
    if (x==1) return 2;
    return x;
}

- (NSUInteger)numberOfPortraitColumns
{
    if (([self numberOfPortraitRows]<=2 || [self numberOfPortraitRows] == 100) && dockMode == 3) return 100;
    return [self numberOfPortraitRows]<=2 ? (fiveIcons ? 5 : %orig) : %orig;
}


%end

%end


#define kIdentifier @"me.nepeta.docky"
#define kSettingsChangedNotification (CFStringRef)@"me.nepeta.docky/ReloadPrefs"
#define kSettingsPath @"/var/mobile/Library/Preferences/me.nepeta.docky.plist"

static void *observer = NULL;

static void reloadPrefs()
{
	if ([NSHomeDirectory() isEqualToString:@"/var/mobile"])
    {
		CFArrayRef keyList = CFPreferencesCopyKeyList((CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

		if (keyList)
        {
			prefs = (NSDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keyList, (CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost));

			if (!prefs)
            {
				prefs = [NSDictionary new];
			}
			CFRelease(keyList);
		}
	}
    else
    {
		prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
	}
}




static BOOL boolValueForKey(NSString *key, BOOL defaultValue)
{
	return (prefs && [prefs objectForKey:key]) ? [[prefs objectForKey:key] boolValue] : defaultValue;
}

static void preferencesChanged()
{
	CFPreferencesAppSynchronize((CFStringRef)kIdentifier);
	reloadPrefs();

    enabled = boolValueForKey(@"Enabled", YES);
    fiveIcons = boolValueForKey(@"FiveIcons", YES);
    dockMode = [[prefs objectForKey:@"DockMode"] intValue];
    forceStyle = [[prefs objectForKey:@"ForceStyle"] intValue];
    backgroundAlpha = [[prefs objectForKey:@"BackgroundAlpha"] floatValue];
    infinitePaging = boolValueForKey(@"InfinitePaging", YES);
    infiniteScrollbar = boolValueForKey(@"InfiniteScrollbar", YES);
    infiniteSnap = boolValueForKey(@"InfiniteSnap", YES);
    infiniteReset = boolValueForKey(@"InfiniteReset", YES);
    infiniteSpacing = [[prefs objectForKey:@"InfiniteSpacing"] floatValue];

	[[NSNotificationCenter defaultCenter] postNotificationName:@"HPResetIconViews" object:nil];
}


%ctor{
    preferencesChanged();


    CFNotificationCenterAddObserver(
        CFNotificationCenterGetDarwinNotifyCenter(),
        &observer,
		(CFNotificationCallback)preferencesChanged,
        (CFStringRef)@"me.nepeta.docky/ReloadPrefs",
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately
    );

    %init(Docky);
    %init(iOS13);
}
