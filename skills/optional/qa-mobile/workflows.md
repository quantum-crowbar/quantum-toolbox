# QA Mobile — Workflows

## Pre-Release Test Pass

### Phase 1: Automated (CI)

```
[ ] Unit tests pass (jest/bun test)
[ ] Component tests pass (React Native Testing Library)
[ ] TypeScript compiles without errors
[ ] Lint passes
[ ] Detox E2E tests pass on iOS simulator
[ ] Detox E2E tests pass on Android emulator
```

### Phase 2: Physical Device (manual)

```
[ ] Install release build (not debug) on physical iOS device
[ ] Install release build on physical Android device
[ ] Walk through all critical user flows
[ ] Test background/foreground transition mid-flow
[ ] Test with slow network (Developer Settings > Network Link Conditioner)
[ ] Test offline launch and recovery
[ ] Test on small screen device
[ ] Verify safe areas (notch, home bar, status bar)
```

### Phase 3: Edge Cases

```
[ ] Low memory condition (older device or force low memory in Dev Settings)
[ ] Interrupted flow: call received mid-checkout, app backgrounded
[ ] Airplane mode → flight mode off → verify sync
[ ] System font size: extra large accessibility setting
[ ] Dark mode (if supported)
[ ] Rotation (portrait / landscape, if applicable)
```

## Bug Report Template

```
**Device:** iPhone 15 Pro / Android Pixel 8
**OS Version:** iOS 18.1 / Android 15
**App Version:** 2.3.1 (build 145)
**Build Type:** Release / Debug

**Steps to reproduce:**
1. Open app
2. Navigate to...
3. Tap...

**Expected:** [what should happen]
**Actual:** [what actually happens]

**Frequency:** Always / Intermittent (x/10 attempts)

**Attachments:** [screenshot, screen recording, crash log]
```

## Performance Profiling Workflow

### iOS (Xcode Instruments)

```
1. Product → Profile (Cmd+I)
2. Select "Time Profiler" for CPU / "Allocations" for memory
3. Run the slow or leaky user flow
4. Identify top call stacks consuming CPU or memory
5. Look for unexpected allocations not being freed after screen pop
```

### Android (Android Profiler)

```
1. Run → Profiler in Android Studio
2. CPU: record method trace around the slow action
3. Memory: capture heap dump after navigation loop
4. Look for growing allocation count = leak
```

### React Native JS thread

```ts
// Performance monitor overlay (debug builds)
import { PerformanceObserver } from 'react-native'

// In Flipper: enable React Native Performance plugin
// Look for: JS FPS drops during scroll/animation, render count spikes
```

Signs of JS thread jank:
- Animations stutter when a list is loading data
- Scroll FPS drops during network activity
- Fix: move animations to native thread with `useNativeDriver: true`

## Platform-Specific Checklist

### iOS

```
[ ] Safe area insets (useSafeAreaInsets hook from react-native-safe-area-context)
[ ] Status bar style set per screen (StatusBar component)
[ ] Keyboard avoiding view tested with hardware keyboard + software keyboard
[ ] Haptic feedback where appropriate
[ ] Large title navigation bar (if using iOS-style nav)
[ ] Privacy manifest updated for required reason APIs (iOS 17+)
```

### Android

```
[ ] Back button handled (useFocusEffect + BackHandler or React Navigation built-in)
[ ] Edge-to-edge display (status bar + nav bar overlap)
[ ] Elevation shadows (not iOS shadow props)
[ ] Permission rationale dialog shown before first request
[ ] Adaptive icon provided (foreground + background layers)
[ ] Target SDK = latest - 1 minimum (Google Play requirement)
```

## Accessibility Audit Workflow

```
1. Enable VoiceOver (iOS) / TalkBack (Android)
2. Navigate entire critical flow using screen reader only
3. Verify: every interactive element is reachable and announces correctly
4. Enable large text (Accessibility → Display & Text Size → Larger Text)
5. Verify: no text truncates or overflows at 2× scale
6. Check colour contrast with Accessibility Inspector (Xcode) or any contrast checker
```

## CI Device Matrix Strategy

| Phase | Devices | Trigger |
|-------|---------|---------|
| PR check | iOS simulator + Android emulator | Every PR |
| Release candidate | Physical iOS + Physical Android (standard size) | Pre-release tag |
| Full matrix | Small + standard + tablet, old + new OS | Monthly / major release |

Use cloud device farms (BrowserStack, AWS Device Farm, Firebase Test Lab) for the full matrix — cheaper than maintaining a physical lab.
