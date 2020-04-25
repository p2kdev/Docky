#line 1 "Docky.xm"
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
NSInteger dockMode = 1; 
NSInteger forceStyle = 1; 
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class UITraitCollection; @class SBIconController; @class SBRootFolderDockIconListView; @class SBLockScreenManager; @class SBIconModel; @class SBDockView; @class SBIconListGridLayoutConfiguration; @class SBDockIconListView; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBRootFolderDockIconListView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBRootFolderDockIconListView"); } return _klass; }
#line 40 "Docky.xm"
static SBDockView* (*_logos_orig$Docky$SBDockView$initWithDockListView$forSnapshot$)(_LOGOS_SELF_TYPE_INIT SBDockView*, SEL, UIView *, BOOL) _LOGOS_RETURN_RETAINED; static SBDockView* _logos_method$Docky$SBDockView$initWithDockListView$forSnapshot$(_LOGOS_SELF_TYPE_INIT SBDockView*, SEL, UIView *, BOOL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Docky$SBDockView$_updateCornerRadii)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Docky$SBDockView$_updateCornerRadii(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Docky$SBDockView$setBackgroundAlpha$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$Docky$SBDockView$setBackgroundAlpha$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, double); static double (*_logos_orig$Docky$SBDockView$dockHeight)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static double _logos_method$Docky$SBDockView$dockHeight(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static CGRect (*_logos_orig$Docky$SBDockView$dockListViewFrame)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$Docky$SBDockView$dockListViewFrame(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Docky$SBDockView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Docky$SBDockView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Docky$SBDockView$dckGesture$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, UIPanGestureRecognizer *); static void _logos_method$Docky$SBDockView$dckHeight$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, CGFloat); static void _logos_method$Docky$SBDockView$dckVisible$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, BOOL); static SBIconModel* (*_logos_orig$Docky$SBIconModel$initWithStore$applicationDataSource$)(_LOGOS_SELF_TYPE_INIT SBIconModel*, SEL, id, id) _LOGOS_RETURN_RETAINED; static SBIconModel* _logos_method$Docky$SBIconModel$initWithStore$applicationDataSource$(_LOGOS_SELF_TYPE_INIT SBIconModel*, SEL, id, id) _LOGOS_RETURN_RETAINED; static void _logos_method$Docky$SBIconModel$recieveNotification$(_LOGOS_SELF_TYPE_NORMAL SBIconModel* _LOGOS_SELF_CONST, SEL, NSNotification *); static unsigned long long (*_logos_orig$Docky$SBIconController$maxIconCountForDock)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$Docky$SBIconController$maxIconCountForDock(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$Docky$UITraitCollection$displayCornerRadius)(_LOGOS_SELF_TYPE_NORMAL UITraitCollection* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$Docky$UITraitCollection$displayCornerRadius(_LOGOS_SELF_TYPE_NORMAL UITraitCollection* _LOGOS_SELF_CONST, SEL); static NSInteger (*_logos_orig$Docky$UITraitCollection$userInterfaceStyle)(_LOGOS_SELF_TYPE_NORMAL UITraitCollection* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$Docky$UITraitCollection$userInterfaceStyle(_LOGOS_SELF_TYPE_NORMAL UITraitCollection* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Docky$SBDockIconListView$updateEditingStateAnimated$)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Docky$SBDockIconListView$updateEditingStateAnimated$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, BOOL); static unsigned long long (*_logos_meta_orig$Docky$SBDockIconListView$iconColumnsForInterfaceOrientation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static unsigned long long _logos_meta_method$Docky$SBDockIconListView$iconColumnsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$Docky$SBDockIconListView$setMinimumNumberOfIconsToDistributeEvenlyToEdges$)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, unsigned long long); static void _logos_method$Docky$SBDockIconListView$setMinimumNumberOfIconsToDistributeEvenlyToEdges$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, unsigned long long); static unsigned long long (*_logos_meta_orig$Docky$SBDockIconListView$iconRowsForInterfaceOrientation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static unsigned long long _logos_meta_method$Docky$SBDockIconListView$iconRowsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static void (*_logos_orig$Docky$SBDockIconListView$setFrame$)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$Docky$SBDockIconListView$setFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, CGRect); static unsigned long long (*_logos_meta_orig$Docky$SBDockIconListView$maxVisibleIconRowsInterfaceOrientation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static unsigned long long _logos_meta_method$Docky$SBDockIconListView$maxVisibleIconRowsInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, long long); static unsigned long long (*_logos_meta_orig$Docky$SBDockIconListView$maxIcons)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_meta_method$Docky$SBDockIconListView$maxIcons(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$Docky$SBDockIconListView$allowsAddingIconCount$)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, unsigned long long); static BOOL _logos_method$Docky$SBDockIconListView$allowsAddingIconCount$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, unsigned long long); static unsigned long long (*_logos_meta_orig$Docky$SBDockIconListView$maxVisibleIcons)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_meta_method$Docky$SBDockIconListView$maxVisibleIcons(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static double (*_logos_orig$Docky$SBDockIconListView$_additionalHorizontalInsetToCenterIcons)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static double _logos_method$Docky$SBDockIconListView$_additionalHorizontalInsetToCenterIcons(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static double (*_logos_orig$Docky$SBDockIconListView$_additionalVerticalInsetToCenterIcons)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static double _logos_method$Docky$SBDockIconListView$_additionalVerticalInsetToCenterIcons(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_orig$Docky$SBDockIconListView$columnAtPoint$)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, CGPoint); static unsigned long long _logos_method$Docky$SBDockIconListView$columnAtPoint$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, CGPoint); static unsigned long long (*_logos_orig$Docky$SBDockIconListView$rowAtPoint$)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, CGPoint); static unsigned long long _logos_method$Docky$SBDockIconListView$rowAtPoint$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, CGPoint); static CGRect (*_logos_orig$Docky$SBDockIconListView$boundsForLayout)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$Docky$SBDockIconListView$boundsForLayout(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static CGPoint (*_logos_orig$Docky$SBDockIconListView$originForIconAtCoordinate$numberOfIcons$)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, SBIconCoordinate, NSUInteger); static CGPoint _logos_method$Docky$SBDockIconListView$originForIconAtCoordinate$numberOfIcons$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL, SBIconCoordinate, NSUInteger); static CGFloat (*_logos_orig$Docky$SBDockIconListView$verticalIconPadding)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$Docky$SBDockIconListView$verticalIconPadding(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$Docky$SBDockIconListView$effectiveSpacing)(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$Docky$SBDockIconListView$effectiveSpacing(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Docky$SBLockScreenManager$lockUIFromSource$withOptions$)(_LOGOS_SELF_TYPE_NORMAL SBLockScreenManager* _LOGOS_SELF_CONST, SEL, int, id); static void _logos_method$Docky$SBLockScreenManager$lockUIFromSource$withOptions$(_LOGOS_SELF_TYPE_NORMAL SBLockScreenManager* _LOGOS_SELF_CONST, SEL, int, id); 



__attribute__((used)) static UIPanGestureRecognizer * _logos_method$Docky$SBDockView$dckGestureRecognizer(SBDockView * __unused self, SEL __unused _cmd) { return (UIPanGestureRecognizer *)objc_getAssociatedObject(self, (void *)_logos_method$Docky$SBDockView$dckGestureRecognizer); }; __attribute__((used)) static void _logos_method$Docky$SBDockView$setDckGestureRecognizer(SBDockView * __unused self, SEL __unused _cmd, UIPanGestureRecognizer * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Docky$SBDockView$dckGestureRecognizer, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIScrollView * _logos_method$Docky$SBDockView$dckScrollView(SBDockView * __unused self, SEL __unused _cmd) { return (UIScrollView *)objc_getAssociatedObject(self, (void *)_logos_method$Docky$SBDockView$dckScrollView); }; __attribute__((used)) static void _logos_method$Docky$SBDockView$setDckScrollView(SBDockView * __unused self, SEL __unused _cmd, UIScrollView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Docky$SBDockView$dckScrollView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static DCKScrollViewDelegate * _logos_method$Docky$SBDockView$dckScrollViewDelegate(SBDockView * __unused self, SEL __unused _cmd) { return (DCKScrollViewDelegate *)objc_getAssociatedObject(self, (void *)_logos_method$Docky$SBDockView$dckScrollViewDelegate); }; __attribute__((used)) static void _logos_method$Docky$SBDockView$setDckScrollViewDelegate(SBDockView * __unused self, SEL __unused _cmd, DCKScrollViewDelegate * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Docky$SBDockView$dckScrollViewDelegate, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static SBDockView* _logos_method$Docky$SBDockView$initWithDockListView$forSnapshot$(_LOGOS_SELF_TYPE_INIT SBDockView* __unused self, SEL __unused _cmd, UIView * dockListView, BOOL arg2) _LOGOS_RETURN_RETAINED {
    _logos_orig$Docky$SBDockView$initWithDockListView$forSnapshot$(self, _cmd, dockListView, arg2);

    if (dockMode == 2) {
        self.dckGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dckGesture:)];
        self.dckGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
        [self addGestureRecognizer:self.dckGestureRecognizer];
    }

    else if (dockMode == 3) {
	    
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

static void _logos_method$Docky$SBDockView$_updateCornerRadii(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$Docky$SBDockView$_updateCornerRadii(self, _cmd);

    if (dockMode == 3) {
	    UIView *backgroundView = MSHookIvar<UIView *>(self, "_backgroundView");
        self.dckScrollView.layer.continuousCorners = backgroundView.layer.continuousCorners;
        self.dckScrollView.layer.cornerRadius = backgroundView.layer.cornerRadius;
        return;
    }
}

static void _logos_method$Docky$SBDockView$setBackgroundAlpha$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double alpha) {
    _logos_orig$Docky$SBDockView$setBackgroundAlpha$(self, _cmd, alpha * backgroundAlpha);
}

static double _logos_method$Docky$SBDockView$dockHeight(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (dockMode == 1) return _logos_orig$Docky$SBDockView$dockHeight(self, _cmd) * heightMultiplier;
    return _logos_orig$Docky$SBDockView$dockHeight(self, _cmd);
}

static CGRect _logos_method$Docky$SBDockView$dockListViewFrame(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (dockMode == 3) return CGRectMake(0, [self dockHeightPadding], 10000, [self dockHeight]);
    return _logos_orig$Docky$SBDockView$dockListViewFrame(self, _cmd);
}

static void _logos_method$Docky$SBDockView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$Docky$SBDockView$layoutSubviews(self, _cmd);

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


static void _logos_method$Docky$SBDockView$dckGesture$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPanGestureRecognizer * recognizer) {
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


static void _logos_method$Docky$SBDockView$dckHeight$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGFloat height) {
    [self.superview bringSubviewToFront:self];


	UIView *backgroundView = MSHookIvar<UIView *>(self, "_backgroundView");
    CGRect oldFrame = backgroundView.frame;

    UIView *iconListView = MSHookIvar<UIView *>(self, "_iconListView");
    CGRect otherFrame = iconListView.frame;

    backgroundView.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, height - oldFrame.origin.x);
    iconListView.frame = CGRectMake(otherFrame.origin.x, 0, otherFrame.size.width, height - oldFrame.origin.x);
    self.frame = CGRectMake(self.frame.origin.x, self.superview.frame.size.height - height, self.frame.size.width, height);
}


static void _logos_method$Docky$SBDockView$dckVisible$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL visible) {
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





static SBIconModel* _logos_method$Docky$SBIconModel$initWithStore$applicationDataSource$(_LOGOS_SELF_TYPE_INIT SBIconModel* __unused self, SEL __unused _cmd, id arg, id arg2) _LOGOS_RETURN_RETAINED {
    id x = _logos_orig$Docky$SBIconModel$initWithStore$applicationDataSource$(self, _cmd, arg, arg2);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveNotification:) name:@"DockyResetIconViews" object:nil];
    return x;
}



static void _logos_method$Docky$SBIconModel$recieveNotification$(_LOGOS_SELF_TYPE_NORMAL SBIconModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
    @try {
        [self layout];
    }
    @catch (NSException *exception) {
        NSLog(@"SBICONMODEL CRASH: %@", exception);
    }
}



static unsigned long long _logos_method$Docky$SBIconController$maxIconCountForDock(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [_logos_static_class_lookup$SBRootFolderDockIconListView() maxIcons];
}





static CGFloat _logos_method$Docky$UITraitCollection$displayCornerRadius(_LOGOS_SELF_TYPE_NORMAL UITraitCollection* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    CGFloat ret = _logos_orig$Docky$UITraitCollection$displayCornerRadius(self, _cmd);
    if (forceStyle > 0) {
        ret = (forceStyle == 1) ? 6 : 0;
    }

    ipx = ret > 0;

    return ret;
}

static NSInteger _logos_method$Docky$UITraitCollection$userInterfaceStyle(_LOGOS_SELF_TYPE_NORMAL UITraitCollection* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return _logos_orig$Docky$UITraitCollection$userInterfaceStyle(self, _cmd);
}




static void _logos_method$Docky$SBDockIconListView$updateEditingStateAnimated$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$Docky$SBDockIconListView$updateEditingStateAnimated$(self, _cmd, animated);

    if (dockMode == 2 && [self isEditing]) {
        [dockView dckVisible:YES];
    }
}

static unsigned long long _logos_meta_method$Docky$SBDockIconListView$iconColumnsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    if (arg1 > 1) return (dockMode == 1 || dockMode == 2) ? 2 : 1;

    if (dockMode == 3) return 100;
    return (fiveIcons) ? 5 : 4;
}

static void _logos_method$Docky$SBDockIconListView$setMinimumNumberOfIconsToDistributeEvenlyToEdges$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1) {
    _logos_orig$Docky$SBDockIconListView$setMinimumNumberOfIconsToDistributeEvenlyToEdges$(self, _cmd, 0);
}

static unsigned long long _logos_meta_method$Docky$SBDockIconListView$iconRowsForInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    if (arg1 > 1) {
        if (dockMode == 3) return 100;
        return (fiveIcons) ? 5 : 4;
    }

    return (dockMode == 1 || dockMode == 2) ? 2 : 1;
}

static void _logos_method$Docky$SBDockIconListView$setFrame$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect frame) {
    if (dockMode != 3) {
        _logos_orig$Docky$SBDockIconListView$setFrame$(self, _cmd, frame);
        return;
    }

    _logos_orig$Docky$SBDockIconListView$setFrame$(self, _cmd, CGRectMake(0, frame.origin.y, 10000, frame.size.height));
}

static unsigned long long _logos_meta_method$Docky$SBDockIconListView$maxVisibleIconRowsInterfaceOrientation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
    return [_logos_static_class_lookup$SBRootFolderDockIconListView() iconRowsForInterfaceOrientation:arg1];
}

static unsigned long long _logos_meta_method$Docky$SBDockIconListView$maxIcons(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (dockMode == 3) return 100;
    return 1 + ((fiveIcons) ? 5 : 4) * ((dockMode == 0) ? 1 : 2);
}

static BOOL _logos_method$Docky$SBDockIconListView$allowsAddingIconCount$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1) {
    if (dockMode == 3) return YES;
    if (dockMode != 0) {
        int count = [[self icons] count];
        return ((arg1 + count) <= ((fiveIcons ? 5 : 4) * 2)+1);
    }

    return _logos_orig$Docky$SBDockIconListView$allowsAddingIconCount$(self, _cmd, arg1);
}

static unsigned long long _logos_meta_method$Docky$SBDockIconListView$maxVisibleIcons(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [_logos_static_class_lookup$SBRootFolderDockIconListView() maxIcons];
}

static double _logos_method$Docky$SBDockIconListView$_additionalHorizontalInsetToCenterIcons(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return 0;
}

static double _logos_method$Docky$SBDockIconListView$_additionalVerticalInsetToCenterIcons(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return 0;
}

static unsigned long long _logos_method$Docky$SBDockIconListView$columnAtPoint$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1) {
    if (dockMode != 3) return _logos_orig$Docky$SBDockIconListView$columnAtPoint$(self, _cmd, arg1);
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

static unsigned long long _logos_method$Docky$SBDockIconListView$rowAtPoint$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGPoint arg1) {
    if (dockMode == 0) return _logos_orig$Docky$SBDockIconListView$rowAtPoint$(self, _cmd, arg1);
    if (dockMode == 3) return 0;

    CGFloat div = arg1.y/[_logos_static_class_lookup$SBRootFolderDockIconListView() defaultHeight];
    return (div < 1) ? 1 : 0;
}

static CGRect _logos_method$Docky$SBDockIconListView$boundsForLayout(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (dockMode != 3) return _logos_orig$Docky$SBDockIconListView$boundsForLayout(self, _cmd);

    CGFloat height = 92; 

    int count = [[self icons] count];

    
    
    

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

static CGPoint _logos_method$Docky$SBDockIconListView$originForIconAtCoordinate$numberOfIcons$(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBIconCoordinate arg1, NSUInteger arg2) {
    if (dockMode == 0 && !fiveIcons) return _logos_orig$Docky$SBDockIconListView$originForIconAtCoordinate$numberOfIcons$(self, _cmd, arg1, arg2);

    CGSize size = CGSizeMake(60,60);
    iconSize = size;

    if (dockMode == 3) {
        CGPoint orig = _logos_orig$Docky$SBDockIconListView$originForIconAtCoordinate$numberOfIcons$(self, _cmd, arg1, arg2);
        CGFloat x = infiniteSpacing;

        if (infinitePaging) {
            int max = (fiveIcons) ? 5 : 4;
            CGFloat offset = (dockScrollView.frame.size.width - max * (size.width + infiniteSpacing))/2;
            x = offset * (ceil((arg1.col - 1)/max)*2 + 1);
        }

        return CGPointMake(((size.width + infiniteSpacing) * (arg1.col - 1)) + x + infiniteSpacing/2, orig.y);
    }



    CGFloat top = [_logos_static_class_lookup$SBRootFolderDockIconListView() defaultHeight] - size.height * 1.2;

    CGFloat x = (size.width + (fiveIcons ? 5 : 20)) * (arg1.col - 1) + (fiveIcons ? 25 : 35);
    CGFloat y = (size.height + [dockView dockHeightPadding]/2 + 15) * (arg1.row - 1) + top;

    if (ipx) {
        top = [_logos_static_class_lookup$SBRootFolderDockIconListView() defaultHeight] - [dockView dockHeightPadding] - size.height * 1.2;
        y = (size.height + [dockView dockHeightPadding] + 2 + 15) * (arg1.row - 1) + top;
    }

    return CGPointMake(x, y);
}

static CGFloat _logos_method$Docky$SBDockIconListView$verticalIconPadding(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return 10;
}


static CGFloat _logos_method$Docky$SBDockIconListView$effectiveSpacing(_LOGOS_SELF_TYPE_NORMAL SBDockIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return 40;
}





  static void _logos_method$Docky$SBLockScreenManager$lockUIFromSource$withOptions$(_LOGOS_SELF_TYPE_NORMAL SBLockScreenManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1, id arg2) {
    _logos_orig$Docky$SBLockScreenManager$lockUIFromSource$withOptions$(self, _cmd, arg1, arg2);
    if (infiniteReset)
      [dockScrollView setContentOffset:CGPointZero animated:YES];
  }





static NSString * _logos_method$iOS13$SBIconListGridLayoutConfiguration$locationIfKnown(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); static NSUInteger (*_logos_orig$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitRows)(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); static NSUInteger _logos_method$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitRows(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); static NSUInteger (*_logos_orig$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitColumns)(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); static NSUInteger _logos_method$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitColumns(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST, SEL); 

@interface SBIconListGridLayoutConfiguration : NSObject
@property (nonatomic, assign) NSString *iconLocation;
- (NSUInteger)numberOfPortraitRows;
- (NSUInteger)numberOfPortraitColumns;
- (NSString *)locationIfKnown;
@end


__attribute__((used)) static NSString * _logos_method$iOS13$SBIconListGridLayoutConfiguration$iconLocation(SBIconListGridLayoutConfiguration * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$iOS13$SBIconListGridLayoutConfiguration$iconLocation); NSString * rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$iOS13$SBIconListGridLayoutConfiguration$setIconLocation(SBIconListGridLayoutConfiguration * __unused self, SEL __unused _cmd, NSString * rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(NSString *)]; objc_setAssociatedObject(self, (void *)_logos_method$iOS13$SBIconListGridLayoutConfiguration$iconLocation, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }



static NSString * _logos_method$iOS13$SBIconListGridLayoutConfiguration$locationIfKnown(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (self.iconLocation) return self.iconLocation;
    
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


static NSUInteger _logos_method$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitRows(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSUInteger x = _logos_orig$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitRows(self, _cmd);

    if (x == 1 && dockMode == 3) return 100;
    if (x==1) return 2;
    return x;
}


static NSUInteger _logos_method$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitColumns(_LOGOS_SELF_TYPE_NORMAL SBIconListGridLayoutConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (([self numberOfPortraitRows]<=2 || [self numberOfPortraitRows] == 100) && dockMode == 3) return 100;
    return [self numberOfPortraitRows]<=2 ? (fiveIcons ? 5 : _logos_orig$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitColumns(self, _cmd)) : _logos_orig$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitColumns(self, _cmd);
}







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


static __attribute__((constructor)) void _logosLocalCtor_7aa3cf6e(int __unused argc, char __unused **argv, char __unused **envp){
    preferencesChanged();


    CFNotificationCenterAddObserver(
        CFNotificationCenterGetDarwinNotifyCenter(),
        &observer,
		(CFNotificationCallback)preferencesChanged,
        (CFStringRef)@"me.nepeta.docky/ReloadPrefs",
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately
    );

    {Class _logos_class$Docky$SBDockView = objc_getClass("SBDockView"); MSHookMessageEx(_logos_class$Docky$SBDockView, @selector(initWithDockListView:forSnapshot:), (IMP)&_logos_method$Docky$SBDockView$initWithDockListView$forSnapshot$, (IMP*)&_logos_orig$Docky$SBDockView$initWithDockListView$forSnapshot$);MSHookMessageEx(_logos_class$Docky$SBDockView, @selector(_updateCornerRadii), (IMP)&_logos_method$Docky$SBDockView$_updateCornerRadii, (IMP*)&_logos_orig$Docky$SBDockView$_updateCornerRadii);MSHookMessageEx(_logos_class$Docky$SBDockView, @selector(setBackgroundAlpha:), (IMP)&_logos_method$Docky$SBDockView$setBackgroundAlpha$, (IMP*)&_logos_orig$Docky$SBDockView$setBackgroundAlpha$);MSHookMessageEx(_logos_class$Docky$SBDockView, @selector(dockHeight), (IMP)&_logos_method$Docky$SBDockView$dockHeight, (IMP*)&_logos_orig$Docky$SBDockView$dockHeight);MSHookMessageEx(_logos_class$Docky$SBDockView, @selector(dockListViewFrame), (IMP)&_logos_method$Docky$SBDockView$dockListViewFrame, (IMP*)&_logos_orig$Docky$SBDockView$dockListViewFrame);MSHookMessageEx(_logos_class$Docky$SBDockView, @selector(layoutSubviews), (IMP)&_logos_method$Docky$SBDockView$layoutSubviews, (IMP*)&_logos_orig$Docky$SBDockView$layoutSubviews);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIPanGestureRecognizer *), strlen(@encode(UIPanGestureRecognizer *))); i += strlen(@encode(UIPanGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Docky$SBDockView, @selector(dckGesture:), (IMP)&_logos_method$Docky$SBDockView$dckGesture$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(CGFloat), strlen(@encode(CGFloat))); i += strlen(@encode(CGFloat)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Docky$SBDockView, @selector(dckHeight:), (IMP)&_logos_method$Docky$SBDockView$dckHeight$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Docky$SBDockView, @selector(dckVisible:), (IMP)&_logos_method$Docky$SBDockView$dckVisible$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIPanGestureRecognizer *)); class_addMethod(_logos_class$Docky$SBDockView, @selector(dckGestureRecognizer), (IMP)&_logos_method$Docky$SBDockView$dckGestureRecognizer, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIPanGestureRecognizer *)); class_addMethod(_logos_class$Docky$SBDockView, @selector(setDckGestureRecognizer:), (IMP)&_logos_method$Docky$SBDockView$setDckGestureRecognizer, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIScrollView *)); class_addMethod(_logos_class$Docky$SBDockView, @selector(dckScrollView), (IMP)&_logos_method$Docky$SBDockView$dckScrollView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIScrollView *)); class_addMethod(_logos_class$Docky$SBDockView, @selector(setDckScrollView:), (IMP)&_logos_method$Docky$SBDockView$setDckScrollView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(DCKScrollViewDelegate *)); class_addMethod(_logos_class$Docky$SBDockView, @selector(dckScrollViewDelegate), (IMP)&_logos_method$Docky$SBDockView$dckScrollViewDelegate, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(DCKScrollViewDelegate *)); class_addMethod(_logos_class$Docky$SBDockView, @selector(setDckScrollViewDelegate:), (IMP)&_logos_method$Docky$SBDockView$setDckScrollViewDelegate, _typeEncoding); } Class _logos_class$Docky$SBIconModel = objc_getClass("SBIconModel"); MSHookMessageEx(_logos_class$Docky$SBIconModel, @selector(initWithStore:applicationDataSource:), (IMP)&_logos_method$Docky$SBIconModel$initWithStore$applicationDataSource$, (IMP*)&_logos_orig$Docky$SBIconModel$initWithStore$applicationDataSource$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Docky$SBIconModel, @selector(recieveNotification:), (IMP)&_logos_method$Docky$SBIconModel$recieveNotification$, _typeEncoding); }Class _logos_class$Docky$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$Docky$SBIconController, @selector(maxIconCountForDock), (IMP)&_logos_method$Docky$SBIconController$maxIconCountForDock, (IMP*)&_logos_orig$Docky$SBIconController$maxIconCountForDock);Class _logos_class$Docky$UITraitCollection = objc_getClass("UITraitCollection"); MSHookMessageEx(_logos_class$Docky$UITraitCollection, @selector(displayCornerRadius), (IMP)&_logos_method$Docky$UITraitCollection$displayCornerRadius, (IMP*)&_logos_orig$Docky$UITraitCollection$displayCornerRadius);MSHookMessageEx(_logos_class$Docky$UITraitCollection, @selector(userInterfaceStyle), (IMP)&_logos_method$Docky$UITraitCollection$userInterfaceStyle, (IMP*)&_logos_orig$Docky$UITraitCollection$userInterfaceStyle);Class _logos_class$Docky$SBDockIconListView = objc_getClass("SBDockIconListView"); Class _logos_metaclass$Docky$SBDockIconListView = object_getClass(_logos_class$Docky$SBDockIconListView); MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(updateEditingStateAnimated:), (IMP)&_logos_method$Docky$SBDockIconListView$updateEditingStateAnimated$, (IMP*)&_logos_orig$Docky$SBDockIconListView$updateEditingStateAnimated$);MSHookMessageEx(_logos_metaclass$Docky$SBDockIconListView, @selector(iconColumnsForInterfaceOrientation:), (IMP)&_logos_meta_method$Docky$SBDockIconListView$iconColumnsForInterfaceOrientation$, (IMP*)&_logos_meta_orig$Docky$SBDockIconListView$iconColumnsForInterfaceOrientation$);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(setMinimumNumberOfIconsToDistributeEvenlyToEdges:), (IMP)&_logos_method$Docky$SBDockIconListView$setMinimumNumberOfIconsToDistributeEvenlyToEdges$, (IMP*)&_logos_orig$Docky$SBDockIconListView$setMinimumNumberOfIconsToDistributeEvenlyToEdges$);MSHookMessageEx(_logos_metaclass$Docky$SBDockIconListView, @selector(iconRowsForInterfaceOrientation:), (IMP)&_logos_meta_method$Docky$SBDockIconListView$iconRowsForInterfaceOrientation$, (IMP*)&_logos_meta_orig$Docky$SBDockIconListView$iconRowsForInterfaceOrientation$);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(setFrame:), (IMP)&_logos_method$Docky$SBDockIconListView$setFrame$, (IMP*)&_logos_orig$Docky$SBDockIconListView$setFrame$);MSHookMessageEx(_logos_metaclass$Docky$SBDockIconListView, @selector(maxVisibleIconRowsInterfaceOrientation:), (IMP)&_logos_meta_method$Docky$SBDockIconListView$maxVisibleIconRowsInterfaceOrientation$, (IMP*)&_logos_meta_orig$Docky$SBDockIconListView$maxVisibleIconRowsInterfaceOrientation$);MSHookMessageEx(_logos_metaclass$Docky$SBDockIconListView, @selector(maxIcons), (IMP)&_logos_meta_method$Docky$SBDockIconListView$maxIcons, (IMP*)&_logos_meta_orig$Docky$SBDockIconListView$maxIcons);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(allowsAddingIconCount:), (IMP)&_logos_method$Docky$SBDockIconListView$allowsAddingIconCount$, (IMP*)&_logos_orig$Docky$SBDockIconListView$allowsAddingIconCount$);MSHookMessageEx(_logos_metaclass$Docky$SBDockIconListView, @selector(maxVisibleIcons), (IMP)&_logos_meta_method$Docky$SBDockIconListView$maxVisibleIcons, (IMP*)&_logos_meta_orig$Docky$SBDockIconListView$maxVisibleIcons);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(_additionalHorizontalInsetToCenterIcons), (IMP)&_logos_method$Docky$SBDockIconListView$_additionalHorizontalInsetToCenterIcons, (IMP*)&_logos_orig$Docky$SBDockIconListView$_additionalHorizontalInsetToCenterIcons);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(_additionalVerticalInsetToCenterIcons), (IMP)&_logos_method$Docky$SBDockIconListView$_additionalVerticalInsetToCenterIcons, (IMP*)&_logos_orig$Docky$SBDockIconListView$_additionalVerticalInsetToCenterIcons);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(columnAtPoint:), (IMP)&_logos_method$Docky$SBDockIconListView$columnAtPoint$, (IMP*)&_logos_orig$Docky$SBDockIconListView$columnAtPoint$);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(rowAtPoint:), (IMP)&_logos_method$Docky$SBDockIconListView$rowAtPoint$, (IMP*)&_logos_orig$Docky$SBDockIconListView$rowAtPoint$);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(boundsForLayout), (IMP)&_logos_method$Docky$SBDockIconListView$boundsForLayout, (IMP*)&_logos_orig$Docky$SBDockIconListView$boundsForLayout);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(originForIconAtCoordinate:numberOfIcons:), (IMP)&_logos_method$Docky$SBDockIconListView$originForIconAtCoordinate$numberOfIcons$, (IMP*)&_logos_orig$Docky$SBDockIconListView$originForIconAtCoordinate$numberOfIcons$);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(verticalIconPadding), (IMP)&_logos_method$Docky$SBDockIconListView$verticalIconPadding, (IMP*)&_logos_orig$Docky$SBDockIconListView$verticalIconPadding);MSHookMessageEx(_logos_class$Docky$SBDockIconListView, @selector(effectiveSpacing), (IMP)&_logos_method$Docky$SBDockIconListView$effectiveSpacing, (IMP*)&_logos_orig$Docky$SBDockIconListView$effectiveSpacing);Class _logos_class$Docky$SBLockScreenManager = objc_getClass("SBLockScreenManager"); MSHookMessageEx(_logos_class$Docky$SBLockScreenManager, @selector(lockUIFromSource:withOptions:), (IMP)&_logos_method$Docky$SBLockScreenManager$lockUIFromSource$withOptions$, (IMP*)&_logos_orig$Docky$SBLockScreenManager$lockUIFromSource$withOptions$);}
    {Class _logos_class$iOS13$SBIconListGridLayoutConfiguration = objc_getClass("SBIconListGridLayoutConfiguration"); { char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$iOS13$SBIconListGridLayoutConfiguration, @selector(locationIfKnown), (IMP)&_logos_method$iOS13$SBIconListGridLayoutConfiguration$locationIfKnown, _typeEncoding); }MSHookMessageEx(_logos_class$iOS13$SBIconListGridLayoutConfiguration, @selector(numberOfPortraitRows), (IMP)&_logos_method$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitRows, (IMP*)&_logos_orig$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitRows);MSHookMessageEx(_logos_class$iOS13$SBIconListGridLayoutConfiguration, @selector(numberOfPortraitColumns), (IMP)&_logos_method$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitColumns, (IMP*)&_logos_orig$iOS13$SBIconListGridLayoutConfiguration$numberOfPortraitColumns);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSString *)); class_addMethod(_logos_class$iOS13$SBIconListGridLayoutConfiguration, @selector(iconLocation), (IMP)&_logos_method$iOS13$SBIconListGridLayoutConfiguration$iconLocation, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSString *)); class_addMethod(_logos_class$iOS13$SBIconListGridLayoutConfiguration, @selector(setIconLocation:), (IMP)&_logos_method$iOS13$SBIconListGridLayoutConfiguration$setIconLocation, _typeEncoding); } }
}
