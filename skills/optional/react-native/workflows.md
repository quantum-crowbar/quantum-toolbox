# React Native — Workflows

## Pre-Release Checklist

```
[ ] Tested on physical iOS device (not just simulator)
[ ] Tested on physical Android device (not just emulator)
[ ] Safe area insets applied on all screens
[ ] Permissions requested with rationale, all states handled
[ ] FlatList used for all dynamic lists
[ ] No inline styles in render methods
[ ] Images have explicit width/height
[ ] Back button handled on Android
[ ] App runs in release mode (not just debug) — check for warnings
[ ] Hermes enabled (Android/iOS)
```

## Platform Behaviour Differences to Always Check

| Feature | iOS | Android |
|---------|-----|---------|
| Keyboard behaviour | Pushes content up | Resizes view |
| Back navigation | Swipe gesture | Back button |
| Permission retry | Limited (blocked = Settings) | Can retry until "don't ask again" |
| Status bar | Overlaps content | Does not overlap |
| Shadow | `shadow*` props | `elevation` prop |
| Font rendering | SF Pro | Roboto |

## Performance Investigation Steps

1. Enable Flipper (debug) — check JS thread FPS
2. Look for unnecessary re-renders with React DevTools
3. Profile with Systrace for native thread bottlenecks
4. Check `FlatList` `renderItem` — is it memoized?
5. Check image loading — are remote images cached?

## New Architecture Migration (RN 0.71+)

- Enable with `newArchEnabled=true` in gradle.properties / Podfile
- Fabric renderer + Turbo Modules replace bridge
- Test all native modules for new arch compatibility
- Codegen required for typed native modules
