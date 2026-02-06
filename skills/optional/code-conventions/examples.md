# Code Conventions Examples

Concrete examples of good and bad conventions.

---

## Naming Examples

### Variables

```typescript
// ❌ Bad: Unclear, abbreviated, or misleading
const d = new Date();
const temp = users.filter(u => u.active);
const data = fetchUsers();  // What kind of data?
const flag = true;          // What does this flag mean?
const list = [];            // List of what?

// ✅ Good: Clear, descriptive, intention-revealing
const createdAt = new Date();
const activeUsers = users.filter(user => user.isActive);
const userProfiles = fetchUsers();
const isEmailVerified = true;
const pendingOrders = [];
```

### Functions

```typescript
// ❌ Bad: Vague, doesn't indicate what it does
function process(data) { }
function handle(event) { }
function doStuff() { }
function calc(a, b) { }

// ✅ Good: Verb + noun, clear action
function validateUserInput(formData) { }
function handleFormSubmission(event) { }
function calculateOrderTotal(items, discount) { }
function sendWelcomeEmail(user) { }
```

### Booleans

```typescript
// ❌ Bad: Not obviously boolean
const active = true;
const email = true;
const admin = false;

// ✅ Good: Reads like a question/statement
const isActive = true;
const hasVerifiedEmail = true;
const isAdmin = false;
const canEditPosts = true;
const shouldRetry = false;
```

### Classes

```typescript
// ❌ Bad: Vague, doesn't indicate purpose
class Manager { }
class Helper { }
class Utils { }
class Data { }

// ✅ Good: Specific, describes responsibility
class UserAuthenticationService { }
class OrderPriceCalculator { }
class EmailTemplateRenderer { }
class DatabaseConnectionPool { }
```

---

## File Organization Examples

### Import Order

```typescript
// ❌ Bad: Random order, hard to scan
import { UserService } from './services/user';
import React from 'react';
import { validateEmail } from './utils';
import axios from 'axios';
import { User } from './types';
import lodash from 'lodash';

// ✅ Good: Grouped and ordered
// 1. External libraries (alphabetical)
import axios from 'axios';
import lodash from 'lodash';
import React from 'react';

// 2. Internal modules (by type or feature)
import { User } from './types';
import { UserService } from './services/user';
import { validateEmail } from './utils';
```

### File Structure

```typescript
// ❌ Bad: Mixed concerns, no clear organization
export function UserProfile({ userId }) {
  const API_URL = 'https://api.example.com';

  function formatDate(date) { return date.toLocaleDateString(); }

  const [user, setUser] = useState(null);

  interface User { id: string; name: string; }

  useEffect(() => { /* fetch */ }, []);

  const handleClick = () => { };

  return <div>...</div>;
}

// ✅ Good: Clear sections, logical flow
// Types
interface User {
  id: string;
  name: string;
  createdAt: Date;
}

interface UserProfileProps {
  userId: string;
}

// Constants
const API_URL = 'https://api.example.com';

// Component
export function UserProfile({ userId }: UserProfileProps) {
  // State
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  // Effects
  useEffect(() => {
    fetchUser(userId);
  }, [userId]);

  // Handlers
  const handleRefresh = () => {
    fetchUser(userId);
  };

  // Render
  if (isLoading) return <Spinner />;
  return <div>...</div>;
}

// Helpers (private to this file)
function formatDate(date: Date): string {
  return date.toLocaleDateString();
}
```

---

## Comment Examples

### Good Comments

```typescript
// Explains WHY, not what
// Using regex instead of includes() for case-insensitive matching
// across all browsers including IE11
const hasMatch = pattern.test(input);

// Documents non-obvious business rule
// Orders over $100 get free shipping per marketing campaign Q4-2024
// See: https://internal.docs/shipping-promo
const FREE_SHIPPING_THRESHOLD = 100;

// Warns about gotchas
// WARNING: This API returns dates in local timezone, not UTC
// Always convert to UTC before storing
const orderDate = convertToUTC(apiResponse.created_at);

// TODO with context
// TODO(ticket-123): Refactor to use new PaymentService
// Blocked until PaymentService v2 is deployed
const payment = legacyProcessPayment(order);
```

### Bad Comments

```typescript
// ❌ Obvious - the code already says this
// Increment counter by 1
counter++;

// ❌ Outdated - code changed, comment didn't
// Returns user's full name
function getDisplayName(user) {
  return user.nickname || user.email;  // Actually returns nickname or email
}

// ❌ Commented-out code - just delete it
// function oldImplementation() {
//   // ... 50 lines of dead code
// }

// ❌ Journal entries - that's what git is for
// Modified by John on 2024-01-15
// Fixed by Sarah on 2024-02-20
// Refactored by Mike on 2024-03-10
```

---

## Error Handling Examples

### Good Error Handling

```typescript
// Specific error types
class ValidationError extends Error {
  constructor(
    message: string,
    public field: string,
    public code: string
  ) {
    super(message);
    this.name = 'ValidationError';
  }
}

class NotFoundError extends Error {
  constructor(resource: string, id: string) {
    super(`${resource} with id ${id} not found`);
    this.name = 'NotFoundError';
  }
}

// Clear error propagation
async function getUser(id: string): Promise<User> {
  try {
    const response = await api.get(`/users/${id}`);
    return response.data;
  } catch (error) {
    if (error.response?.status === 404) {
      throw new NotFoundError('User', id);
    }
    // Re-throw with context
    throw new Error(`Failed to fetch user ${id}`, { cause: error });
  }
}

// Handling at boundaries
app.get('/users/:id', async (req, res) => {
  try {
    const user = await getUser(req.params.id);
    res.json(user);
  } catch (error) {
    if (error instanceof NotFoundError) {
      res.status(404).json({ error: error.message });
    } else if (error instanceof ValidationError) {
      res.status(400).json({ error: error.message, field: error.field });
    } else {
      logger.error('Unexpected error', { error });
      res.status(500).json({ error: 'Internal server error' });
    }
  }
});
```

### Bad Error Handling

```typescript
// ❌ Swallowing errors
try {
  await saveUser(user);
} catch (e) {
  // This hides bugs!
}

// ❌ Catching too broadly
try {
  const user = await getUser(id);
  const orders = await getOrders(user.id);
  const total = calculateTotal(orders);
} catch (e) {
  // Which operation failed? No idea.
  console.log('Something went wrong');
}

// ❌ Exposing internals to users
catch (error) {
  res.json({ error: error.stack });  // Security risk!
}

// ❌ Using exceptions for flow control
function findUser(id) {
  try {
    return users.find(u => u.id === id) || throw new Error();
  } catch {
    return null;  // Just return null directly!
  }
}
```

---

## Function Examples

### Good Functions

```typescript
// Single responsibility, clear purpose
function calculateSubtotal(items: CartItem[]): number {
  return items.reduce((sum, item) => sum + item.price * item.quantity, 0);
}

function applyDiscount(subtotal: number, discountPercent: number): number {
  return subtotal * (1 - discountPercent / 100);
}

function calculateTax(amount: number, taxRate: number): number {
  return amount * taxRate;
}

// Clear parameters, reasonable defaults
function createUser(
  email: string,
  options: {
    name?: string;
    role?: 'user' | 'admin';
    sendWelcomeEmail?: boolean;
  } = {}
): User {
  const { name = '', role = 'user', sendWelcomeEmail = true } = options;
  // ...
}
```

### Bad Functions

```typescript
// ❌ Too many responsibilities
function processOrder(order) {
  // Validates order
  // Calculates prices
  // Applies discounts
  // Charges payment
  // Updates inventory
  // Sends confirmation email
  // Updates analytics
  // ... 200 lines later
}

// ❌ Too many parameters
function createUser(
  email,
  password,
  firstName,
  lastName,
  phone,
  address,
  city,
  state,
  zip,
  country,
  role,
  department,
  managerId,
  startDate
) { }

// ❌ Side effects hidden in name
function getUser(id) {
  const user = db.findUser(id);
  user.lastAccessed = new Date();  // Unexpected mutation!
  db.save(user);                    // Unexpected write!
  analytics.track('user_viewed');   // Unexpected side effect!
  return user;
}
```

---

## Configuration Examples

### ESLint Configuration

```javascript
// .eslintrc.js
module.exports = {
  root: true,
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
  ],
  rules: {
    // Enforce conventions
    'camelcase': 'error',
    'no-unused-vars': 'off',  // Use TypeScript's version
    '@typescript-eslint/no-unused-vars': 'error',
    '@typescript-eslint/explicit-function-return-type': ['error', {
      allowExpressions: true,
    }],

    // Code quality
    'no-console': ['warn', { allow: ['warn', 'error'] }],
    'eqeqeq': 'error',
    'no-var': 'error',
    'prefer-const': 'error',
  },
};
```

### Prettier Configuration

```json
// .prettierrc
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5",
  "printWidth": 100,
  "bracketSpacing": true,
  "arrowParens": "avoid"
}
```

### TypeScript Configuration

```json
// tsconfig.json (strict conventions)
{
  "compilerOptions": {
    "strict": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true
  }
}
```
