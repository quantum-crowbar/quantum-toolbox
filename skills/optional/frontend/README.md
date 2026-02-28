# Frontend

Guidelines for building frontend web applications — component architecture, performance, accessibility, and CSS.

## Core Principles

- **Semantic HTML first** — use the right element before reaching for ARIA
- **Progressive enhancement** — core functionality works without JS; JS enhances
- **Accessible by default** — WCAG AA compliance is not optional
- **Performance budget** — set and enforce limits on bundle size, LCP, CLS, INP
- **Component ownership** — each component is self-contained; no leaking styles or state

## Framework Conventions

### React

```tsx
// Prefer function components with typed props
interface ButtonProps {
  label: string
  onClick: () => void
  variant?: 'primary' | 'secondary'
  disabled?: boolean
}

export function Button({ label, onClick, variant = 'primary', disabled = false }: ButtonProps) {
  return (
    <button
      className={styles[variant]}
      onClick={onClick}
      disabled={disabled}
      type="button"
    >
      {label}
    </button>
  )
}
```

Rules:
- `type="button"` on all buttons not submitting a form (prevents accidental form submission)
- Props interfaces defined above the component
- Default prop values in destructuring, not `defaultProps`
- No inline styles — use CSS modules, Tailwind, or styled-components consistently
- `key` prop on list items must be stable and unique (not array index for dynamic lists)

### State management

| Scope | Solution |
|-------|---------|
| Component-local | `useState`, `useReducer` |
| Shared across a subtree | `useContext` + `useReducer` |
| Server state (fetching, caching) | TanStack Query / SWR |
| Complex global client state | Zustand (prefer over Redux for new projects) |

Avoid global state for things that don't need to be global. Most state belongs at the component level.

### Data fetching

```tsx
// TanStack Query — server state the right way
import { useQuery, useMutation } from '@tanstack/react-query'

function UserProfile({ userId }: { userId: string }) {
  const { data, isLoading, error } = useQuery({
    queryKey: ['user', userId],
    queryFn: () => fetchUser(userId),
    staleTime: 5 * 60 * 1000,  // 5 min
  })

  if (isLoading) return <Skeleton />
  if (error) return <ErrorState error={error} />
  return <Profile user={data} />
}
```

## CSS Architecture

### CSS Modules (default for most projects)

```css
/* Button.module.css */
.primary {
  background: var(--color-brand-primary);
  color: var(--color-neutral-0);
  padding: var(--spacing-2) var(--spacing-4);
  border-radius: var(--radius-md);
  border: none;
  cursor: pointer;
}

.primary:hover {
  background: var(--color-brand-primary-hover);
}

.primary:focus-visible {
  outline: 2px solid var(--color-focus);
  outline-offset: 2px;
}
```

Rules:
- Use CSS custom properties (variables) for all design tokens
- Never use `!important` — it signals a specificity problem
- `:focus-visible` not `:focus` — shows focus ring only for keyboard navigation
- Avoid deep nesting (max 3 levels)

### Tailwind (utility-first)

```tsx
// Extract repeated utility groups into components, not strings
export function Card({ children }: { children: React.ReactNode }) {
  return (
    <div className="rounded-lg border border-neutral-200 bg-white p-6 shadow-sm">
      {children}
    </div>
  )
}
```

Tailwind rules:
- Use `@apply` sparingly — defeats the purpose
- Configure design tokens in `tailwind.config.ts` (don't hardcode values)
- `clsx` or `cva` for conditional class composition

## Performance

### Core Web Vitals targets

| Metric | Good | Needs improvement |
|--------|------|------------------|
| **LCP** (Largest Contentful Paint) | < 2.5s | 2.5–4s |
| **INP** (Interaction to Next Paint) | < 200ms | 200–500ms |
| **CLS** (Cumulative Layout Shift) | < 0.1 | 0.1–0.25 |

### Bundle optimisation

```ts
// vite.config.ts — code splitting
export default defineConfig({
  build: {
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          router: ['react-router-dom'],
        },
      },
    },
  },
})
```

```tsx
// Lazy load heavy routes and components
const Analytics = lazy(() => import('./pages/Analytics'))
const HeavyChart = lazy(() => import('./components/HeavyChart'))

// Always wrap lazy components in Suspense
<Suspense fallback={<Skeleton />}>
  <Analytics />
</Suspense>
```

### Image optimisation

```tsx
// Next.js — use next/image for automatic optimisation
import Image from 'next/image'

<Image
  src="/hero.jpg"
  width={1200}
  height={630}
  priority          // LCP image — don't lazy load
  alt="Team working in an office"
/>

// For user-generated content: provide width and height to prevent CLS
// Prefer WebP/AVIF over JPEG/PNG
// Use srcset for responsive images
```

## Accessibility in Code

```tsx
// Semantic HTML avoids most ARIA
<nav aria-label="Main navigation">
  <ul>
    <li><a href="/dashboard" aria-current="page">Dashboard</a></li>
    <li><a href="/settings">Settings</a></li>
  </ul>
</nav>

// Icon buttons must have accessible names
<button aria-label="Close dialog" onClick={onClose}>
  <XIcon aria-hidden="true" />
</button>

// Dynamic content announcements
<div aria-live="polite" aria-atomic="true">
  {statusMessage}
</div>

// Modal focus management
useEffect(() => {
  if (isOpen) {
    firstFocusableElement.current?.focus()
  }
}, [isOpen])
```

Keyboard interaction patterns:
- **Button** — `Enter` and `Space` activate
- **Link** — `Enter` activates
- **Modal** — focus trap inside; `Escape` closes; focus returns to trigger on close
- **Dropdown menu** — `Arrow` keys navigate; `Escape` closes
- **Tab panel** — `Arrow` keys switch tabs (roving tabindex pattern)

## Component Testing

```tsx
// React Testing Library — test behaviour, not implementation
import { render, screen, userEvent } from '@testing-library/react'

test('shows error when email is invalid', async () => {
  const user = userEvent.setup()
  render(<SignupForm onSubmit={jest.fn()} />)

  await user.type(screen.getByLabelText('Email'), 'not-an-email')
  await user.click(screen.getByRole('button', { name: 'Sign up' }))

  expect(screen.getByRole('alert')).toHaveTextContent('Enter a valid email address')
})
```

Rules:
- Query by accessible role or label — not by class or test ID
- Use `userEvent` over `fireEvent` — simulates real browser events
- Test what the user sees and does — not component internals
- `getByRole('button', { name: '...' })` checks accessible name — catches missing aria-labels

## Error Boundaries

```tsx
// Catch rendering errors; show a degraded UI instead of a blank screen
class ErrorBoundary extends Component<Props, State> {
  static getDerivedStateFromError(error: Error) {
    return { hasError: true, error }
  }

  componentDidCatch(error: Error, info: ErrorInfo) {
    reportError(error, info)
  }

  render() {
    if (this.state.hasError) {
      return this.props.fallback ?? <DefaultErrorFallback />
    }
    return this.props.children
  }
}

// Use at route boundaries and around heavyweight widgets
<ErrorBoundary fallback={<WidgetError />}>
  <ComplexDataViz />
</ErrorBoundary>
```
