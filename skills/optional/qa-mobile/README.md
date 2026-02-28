# QA Mobile

Guidelines for quality assurance on mobile applications — React Native and native iOS/Android.

## Mobile QA Principles

- **Test on real devices** — emulators/simulators miss critical issues: thermal throttling, real gestures, permission dialogs, notch/punch-hole layouts, hardware keyboards
- **Both platforms** — iOS and Android behave differently; a passing test on one is not a pass on both
- **Device matrix** — cover at least: small screen (SE/compact), large screen, old OS (n-2), new OS
- **Network conditions** — test offline, slow (3G), and rapid network switches
- **Background / foreground transitions** — apps are suspended and resumed; state must survive

## Test Layers for Mobile

```
E2E (Detox / Appium)       — full user flow on real device / emulator
                               (few, slow, high value for critical paths)

Component tests (Jest/RTL)  — React Native components in isolation
                               (moderate, catch rendering regressions)

Unit tests (Jest/bun test)  — business logic, hooks, utility functions
                               (many, fast, same as web)
```

## Critical Test Areas

### Permissions

```
[ ] Permission requested with rationale dialog shown first
[ ] App handles denied permission gracefully (no crash, helpful message)
[ ] App handles "limited" permission (iOS photos partial access)
[ ] Permission state persists after app restart
[ ] Android: "don't ask again" state handled (redirect to settings)
[ ] iOS: blocked permission redirects to Settings
```

### Navigation and Back Button

```
[ ] Android hardware back button works on every screen
[ ] Deep links resolve to correct screen
[ ] Navigation state survives background/foreground
[ ] Modal dismisses correctly (swipe on iOS, back on Android)
[ ] Stack doesn't accumulate duplicate screens on repeated navigation
```

### Offline Behaviour

```
[ ] App launches without network (no white screen / crash)
[ ] Cached data shown when offline
[ ] Clear error message when network required but absent
[ ] Pending writes queued and synced on reconnect
[ ] Transitions between offline → online work correctly
```

### Performance

```
[ ] Initial load < 3s on mid-range device (Pixel 4 / iPhone 11 tier)
[ ] List scrolling at 60fps (use FlatList, not ScrollView with map)
[ ] Images load progressively; no layout shift
[ ] No JavaScript thread jank during animations (run animations on native thread)
[ ] Memory: no leak after 10+ navigations (profile with Xcode Instruments / Android Profiler)
```

### Accessibility

```
[ ] All interactive elements have accessible labels
[ ] Screen reader (VoiceOver / TalkBack) can reach and activate all controls
[ ] Text scales with system font size setting
[ ] Tap targets >= 44x44pt (iOS) / 48x48dp (Android)
[ ] Colour contrast >= 4.5:1 for text
```

## Device Matrix

| Category | iOS | Android |
|----------|-----|---------|
| Small | iPhone SE (4.7") | Pixel 4a (5.8") |
| Standard | iPhone 15 (6.1") | Pixel 8 (6.2") |
| Large | iPhone 15 Plus (6.7") | Pixel 8 Pro (6.7") |
| Tablet | iPad (10th gen) | Pixel Tablet |
| Old OS | iOS 16 | Android 12 |
| Latest | iOS 18 | Android 15 |

Minimum device coverage for a release: small + standard on both platforms, latest + n-1 OS.

## Detox E2E Testing (React Native)

```ts
// Example Detox test
describe('Login flow', () => {
  beforeEach(async () => {
    await device.reloadReactNative()
  })

  it('logs in with valid credentials', async () => {
    await element(by.id('email-input')).typeText('user@example.com')
    await element(by.id('password-input')).typeText('password123')
    await element(by.id('login-button')).tap()
    await expect(element(by.id('home-screen'))).toBeVisible()
  })

  it('shows error for invalid credentials', async () => {
    await element(by.id('email-input')).typeText('bad@example.com')
    await element(by.id('password-input')).typeText('wrong')
    await element(by.id('login-button')).tap()
    await expect(element(by.text('Invalid credentials'))).toBeVisible()
  })
})
```

Detox requirements:
- `testID` props on interactive elements (keeps tests stable through UI changes)
- Run on CI with emulator (fast) and physical device matrix (release gate)
- Detox simulator resets between `describe` blocks, not between `it` blocks by default

## React Native Component Testing

```ts
// Jest + React Native Testing Library
import { render, fireEvent } from '@testing-library/react-native'
import LoginScreen from '../LoginScreen'

test('submit button disabled when email is empty', () => {
  const { getByTestId } = render(<LoginScreen onLogin={jest.fn()} />)
  expect(getByTestId('login-button')).toBeDisabled()
})

test('calls onLogin when form is valid', () => {
  const onLogin = jest.fn()
  const { getByTestId } = render(<LoginScreen onLogin={onLogin} />)
  fireEvent.changeText(getByTestId('email-input'), 'a@b.com')
  fireEvent.changeText(getByTestId('password-input'), 'pass')
  fireEvent.press(getByTestId('login-button'))
  expect(onLogin).toHaveBeenCalledWith({ email: 'a@b.com', password: 'pass' })
})
```

## App Store / Play Store Release Checklist

```
[ ] Tested on physical iOS device (not just simulator)
[ ] Tested on physical Android device (not just emulator)
[ ] Release build tested (not just debug) — some issues only appear in release
[ ] Safe area insets applied on all screens (notch, dynamic island, gesture bar)
[ ] All permission strings filled in Info.plist / AndroidManifest.xml
[ ] App runs on minimum supported OS version
[ ] Splash screen → home transition is smooth
[ ] No console errors in production logs
[ ] Analytics / crash reporting configured and verified
[ ] Privacy manifest (iOS 17+) updated if using required APIs
[ ] App size within acceptable range (< 50MB download for typical apps)
[ ] Push notification registration flow works end-to-end
```
