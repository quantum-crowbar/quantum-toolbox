# React Native

Guidelines for building cross-platform mobile apps with React Native.

## Core Principles

- **Platform-aware but not platform-duplicated** — shared logic, platform-specific UI only where necessary
- **Performance is a feature** — mobile CPUs throttle; the JS thread is not free
- **Test on real devices** — simulator != device for touch, camera, push notifications, background behaviour
- **Follow store guidelines** — App Store and Play Store have different rules; know both

## Project Structure

```
src/
  components/       # Shared UI components
  screens/          # Screen-level components
  navigation/       # React Navigation config
  hooks/            # Custom hooks (useCamera, usePermissions, etc.)
  services/         # API clients, native module wrappers
  utils/            # Pure utility functions
  platform/         # Platform-specific implementations
    ios/
    android/
```

## Navigation

- Use React Navigation (v6+) — the standard
- Define typed navigation params with TypeScript:
  ```ts
  type RootStackParams = {
    Home: undefined
    Profile: { userId: string }
  }
  ```
- Never use `useNavigation()` in deeply nested components — pass navigation as prop or use context

## Performance

### The JS Thread

- Heavy computation blocks UI — offload to `InteractionManager.runAfterInteractions()` or worklets
- `FlatList` over `ScrollView` for any list longer than ~20 items
- `keyExtractor` must return a stable unique key
- `getItemLayout` on FlatList when item height is fixed — prevents remeasure

### Images

- Always specify width/height — prevents layout shift
- Use `resizeMode="cover"` or `"contain"` explicitly
- `react-native-fast-image` for cached remote images

### Re-renders

- `React.memo()` on list items that receive objects — reference equality
- `useCallback` and `useMemo` for expensive computations passed as props
- Avoid inline object/function creation in JSX: `style={styles.container}` not `style={{ flex: 1 }}`

## Platform-Specific Code

```ts
import { Platform } from 'react-native'

// ✓ Inline
const paddingTop = Platform.OS === 'ios' ? 44 : 24

// ✓ Platform file extension (auto-resolved)
// Button.ios.tsx   — loaded on iOS
// Button.android.tsx — loaded on Android
// Button.tsx       — fallback

// ✓ Platform.select
const shadow = Platform.select({
  ios: { shadowColor: '#000', shadowOpacity: 0.1 },
  android: { elevation: 4 },
})
```

## Permissions

- Request permissions just-in-time, not at app start
- Explain why before requesting: show rationale UI first
- Handle all states: `granted`, `denied`, `blocked`, `limited` (iOS camera)
- On Android, `denied` can be asked again; `blocked` opens Settings

## iOS Specifics

- Safe area insets — always use `useSafeAreaInsets()` or `SafeAreaView`
- Keyboard avoiding — `KeyboardAvoidingView` with `behavior="padding"` on iOS
- App Store review: no use of private APIs, no dynamic code loading, no misleading UI
- Background modes declared in Info.plist must match actual usage

## Android Specifics

- Back button — intercept with `BackHandler` or React Navigation's back action handler
- Play Store: target API level must be current year's requirement (check annually)
- Adaptive icons required for API 26+
- `android:exported` must be set explicitly on activities/services/receivers (API 31+)

## Native Modules

- Prefer JSI (new architecture) for new modules — synchronous, no bridge overhead
- Use Turbo Modules when available
- Legacy bridge modules still work — don't rewrite working modules just for new arch

## Testing

- Jest + React Native Testing Library for component tests
- `@testing-library/react-native` `fireEvent` for interactions
- Detox for E2E on real simulators/emulators
- Never mock `Platform.OS` in unit tests — use the real value or test both paths
