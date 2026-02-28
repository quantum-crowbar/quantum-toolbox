# Frontend — Workflows

## Code Review Checklist

```
[ ] Semantic HTML used (no div-soup; correct heading hierarchy)
[ ] All interactive elements have accessible names
[ ] Focus management correct for modals, drawers, dynamic content
[ ] :focus-visible styles present on all interactive elements
[ ] No inline styles — design tokens used for all values
[ ] Images have alt text; decorative images have alt=""
[ ] Form inputs have associated labels (not just placeholder)
[ ] Error messages rendered in text (not colour alone)
[ ] key props on lists are stable identifiers (not array index)
[ ] Large components / routes lazy-loaded
[ ] Console errors and warnings absent in dev mode
[ ] Renders correctly in mobile viewport (375px min)
[ ] No direct DOM manipulation (use refs or state)
[ ] No memory leaks: event listeners / intervals cleaned up in useEffect return
```

## Performance Audit Workflow

### 1. Measure baseline

```bash
# Lighthouse CI
npx lhci autorun

# Bundle analyser
npx vite-bundle-visualizer    # Vite
npx source-map-explorer dist/static/js/*.js  # CRA
```

### 2. Identify worst offenders

```
Bundle size:
  - Large vendor chunks (unpinned imports pulling in full libraries)
  - Unused exports from tree-shakeable libraries
  - Unoptimised images in the bundle

Runtime:
  - Long tasks blocking the main thread (INP)
  - Layout shifts from unsized images or injected content (CLS)
  - Slow LCP — large image, render-blocking resource, slow TTFB
```

### 3. Fix patterns

| Problem | Fix |
|---------|-----|
| Large initial bundle | Code-split routes with `React.lazy` |
| Whole library imported | Named imports: `import { debounce } from 'lodash-es'` |
| LCP image loads late | `priority` / `fetchpriority="high"` / preload link |
| Layout shift from images | Explicit `width` + `height` on all `<img>` |
| Slow re-renders | `useMemo`, `useCallback`, `React.memo` where profiler confirms need |
| Main thread blocked | Move heavy work to `useTransition` or a web worker |

### 4. Set a budget

```ts
// vite.config.ts — fail CI if chunks exceed limit
build: {
  chunkSizeWarningLimit: 250,  // KB
}
```

## Accessibility Testing Sequence

```
1. axe DevTools (browser extension) — automated checks; fix all errors
2. Keyboard-only navigation — tab through every screen; test all interactions
3. Screen reader — VoiceOver (macOS/iOS) or NVDA (Windows/Android)
   - Navigate the critical user flow
   - Verify all content is announced correctly
   - Verify all interactions are operable
4. 200% zoom — verify no content loss or overlap
5. High contrast mode (Windows) — verify all UI is visible
6. Colour contrast — Colour Contrast Analyser on text and UI components
```

## New Component Checklist

```
[ ] Component name matches file name and design system entry
[ ] Props interface typed (TypeScript) with JSDoc for non-obvious props
[ ] All states handled: default, hover, focus, active, disabled, loading, error, empty
[ ] Accessible name provided (aria-label, aria-labelledby, or visible text)
[ ] Keyboard interaction matches ARIA authoring practice for component type
[ ] CSS uses design tokens, not hardcoded values
[ ] Unit test covers: default render, key interactions, error state
[ ] Added to Storybook (or equivalent) with all variants
[ ] Responsive behaviour verified at 375px, 768px, 1280px
```

## Debugging Common Issues

### Hydration mismatch (Next.js / SSR)

```tsx
// Cause: server renders different content from client
// Fix: ensure server and client have same initial state
// Common culprits: Date.now(), Math.random(), window checks

// Pattern for client-only rendering
const [mounted, setMounted] = useState(false)
useEffect(() => setMounted(true), [])
if (!mounted) return null
```

### Stale closures in useEffect

```tsx
// Bad — stale count in closure
useEffect(() => {
  const id = setInterval(() => console.log(count), 1000)
  return () => clearInterval(id)
}, [])  // missing count dependency

// Good — functional update avoids the closure
setCount(prev => prev + 1)

// Or — add count to deps
}, [count])
```

### Infinite re-renders

```tsx
// Cause: object/array created inline as dep triggers on every render
useEffect(() => { ... }, [{ id }])        // new object every render
useEffect(() => { ... }, [[id]])          // new array every render

// Fix: use primitive dep or useMemo
useEffect(() => { ... }, [id])            // primitive — stable
const options = useMemo(() => ({ id }), [id])
useEffect(() => { ... }, [options])
```
