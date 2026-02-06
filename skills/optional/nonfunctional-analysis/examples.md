# Nonfunctional Analysis Examples

Sample findings and recommendations.

---

## Testing Coverage Examples

### Example 1: Critical Path Without Tests

**Finding**: Payment processing endpoint has no test coverage.

**Evidence**:
```
src/routes/payments.ts
├── POST /api/payments/charge     ✗ No tests
├── POST /api/payments/refund     ✗ No tests
└── GET  /api/payments/:id        ✓ Tested
```

**Impact**: High - Payment failures may go undetected until production.

**Recommendation**:
```typescript
// tests/routes/payments.test.ts
describe('POST /api/payments/charge', () => {
  it('should process valid payment', async () => {
    const response = await request(app)
      .post('/api/payments/charge')
      .send({ amount: 1000, currency: 'USD', token: 'tok_valid' });

    expect(response.status).toBe(200);
    expect(response.body.status).toBe('succeeded');
  });

  it('should reject invalid payment token', async () => {
    const response = await request(app)
      .post('/api/payments/charge')
      .send({ amount: 1000, currency: 'USD', token: 'tok_invalid' });

    expect(response.status).toBe(400);
  });
});
```

---

### Example 2: Flaky Test Detection

**Finding**: Test relies on timing, causing intermittent failures.

**Evidence**:
```typescript
// src/services/__tests__/cache.test.ts:45
it('should expire after TTL', async () => {
  cache.set('key', 'value', { ttl: 100 });
  await sleep(150); // Flaky: timing-dependent
  expect(cache.get('key')).toBeUndefined();
});
```

**Impact**: Medium - CI failures cause developer friction.

**Recommendation**:
```typescript
it('should expire after TTL', async () => {
  const mockTime = jest.useFakeTimers();
  cache.set('key', 'value', { ttl: 100 });

  mockTime.advanceTimersByTime(150);

  expect(cache.get('key')).toBeUndefined();
  mockTime.useRealTimers();
});
```

---

### Example 3: Test Without Assertions

**Finding**: Test passes but verifies nothing meaningful.

**Evidence**:
```typescript
// src/utils/__tests__/format.test.ts:23
it('should format currency', () => {
  const result = formatCurrency(1000);
  console.log(result); // No assertion!
});
```

**Impact**: Low - False confidence in test coverage.

**Recommendation**:
```typescript
it('should format currency with dollar sign and commas', () => {
  expect(formatCurrency(1000)).toBe('$1,000.00');
  expect(formatCurrency(1000000)).toBe('$1,000,000.00');
  expect(formatCurrency(0.5)).toBe('$0.50');
});
```

---

## Configuration Audit Examples

### Example 1: Hardcoded Secret

**Finding**: API key hardcoded in source code.

**Evidence**:
```typescript
// src/services/stripe.ts:5
const stripe = new Stripe('sk_live_abc123xyz789...', {
  apiVersion: '2023-10-16'
});
```

**Impact**: Critical - Secret exposed in version control.

**Recommendation**:
```typescript
// src/services/stripe.ts
const stripe = new Stripe(process.env.STRIPE_SECRET_KEY, {
  apiVersion: '2023-10-16'
});

// .env.example
STRIPE_SECRET_KEY=sk_test_... # Replace with your key
```

---

### Example 2: Missing Configuration Validation

**Finding**: Application starts without validating required config.

**Evidence**:
```typescript
// src/config.ts
export const config = {
  databaseUrl: process.env.DATABASE_URL,
  redisUrl: process.env.REDIS_URL,
  jwtSecret: process.env.JWT_SECRET,
};

// No validation - undefined values will cause runtime errors
```

**Impact**: High - Application may start with missing config, fail later.

**Recommendation**:
```typescript
// src/config.ts
import { z } from 'zod';

const configSchema = z.object({
  databaseUrl: z.string().url(),
  redisUrl: z.string().url(),
  jwtSecret: z.string().min(32),
});

export const config = configSchema.parse({
  databaseUrl: process.env.DATABASE_URL,
  redisUrl: process.env.REDIS_URL,
  jwtSecret: process.env.JWT_SECRET,
});

// Now fails fast at startup with clear error
```

---

### Example 3: Inconsistent Environment Handling

**Finding**: Different config patterns across the codebase.

**Evidence**:
```typescript
// src/db.ts - Uses config object
import { config } from './config';
const db = connect(config.databaseUrl);

// src/cache.ts - Direct env access
const cache = connect(process.env.REDIS_URL);

// src/email.ts - Hardcoded fallback
const apiKey = process.env.SENDGRID_KEY || 'SG.default';
```

**Impact**: Medium - Maintenance burden, inconsistent behavior.

**Recommendation**:
```typescript
// Centralize all config access
// src/config.ts
export const config = {
  database: { url: process.env.DATABASE_URL },
  redis: { url: process.env.REDIS_URL },
  email: { apiKey: process.env.SENDGRID_KEY },
};

// All files import from config
import { config } from './config';
```

---

## Performance Hotspot Examples

### Example 1: N+1 Query

**Finding**: Database query inside loop creates N+1 problem.

**Evidence**:
```typescript
// src/services/order.ts:45
async function getOrdersWithProducts(userId: string) {
  const orders = await Order.findAll({ where: { userId } });

  // N+1: One query per order
  for (const order of orders) {
    order.products = await Product.findAll({
      where: { orderId: order.id }
    });
  }

  return orders;
}
```

**Impact**: High - O(n) database queries, severe at scale.

**Recommendation**:
```typescript
async function getOrdersWithProducts(userId: string) {
  // Single query with eager loading
  const orders = await Order.findAll({
    where: { userId },
    include: [{ model: Product }]
  });

  return orders;
}
```

---

### Example 2: Sequential Awaits

**Finding**: Independent async operations run sequentially.

**Evidence**:
```typescript
// src/controllers/dashboard.ts:23
async function getDashboardData(userId: string) {
  const user = await getUser(userId);           // 100ms
  const orders = await getOrders(userId);       // 150ms
  const notifications = await getNotifications(userId); // 80ms
  // Total: 330ms sequential

  return { user, orders, notifications };
}
```

**Impact**: Medium - Unnecessary latency.

**Recommendation**:
```typescript
async function getDashboardData(userId: string) {
  const [user, orders, notifications] = await Promise.all([
    getUser(userId),           // 100ms
    getOrders(userId),         // 150ms  } parallel
    getNotifications(userId),  // 80ms   }
  ]);
  // Total: 150ms (longest operation)

  return { user, orders, notifications };
}
```

---

### Example 3: Missing Await

**Finding**: Promise not awaited, operation may not complete.

**Evidence**:
```typescript
// src/services/audit.ts:34
async function processOrder(order: Order) {
  // Business logic...

  auditLog.save({ action: 'order_processed', orderId: order.id });
  // Missing await! Audit log may not be saved before function returns

  return order;
}
```

**Impact**: Medium - Data loss possible if process exits.

**Recommendation**:
```typescript
async function processOrder(order: Order) {
  // Business logic...

  await auditLog.save({ action: 'order_processed', orderId: order.id });

  return order;
}

// Or if fire-and-forget is intentional, handle errors:
auditLog.save({ ... }).catch(err => logger.error('Audit failed', err));
```

---

### Example 4: High Complexity Function

**Finding**: Function exceeds complexity thresholds.

**Evidence**:
```typescript
// src/services/pricing.ts:78
// Cyclomatic: 25, Cognitive: 38, Lines: 120
function calculatePrice(product, user, promotions, context) {
  let price = product.basePrice;

  if (user.isPremium) {
    if (context.isHoliday) {
      if (promotions.hasDiscount) {
        // Deep nesting continues...
      }
    }
  }
  // ... 100 more lines
}
```

**Impact**: High - Difficult to maintain, prone to bugs.

**Recommendation**:
```typescript
// Break into smaller functions
function calculatePrice(product, user, promotions, context) {
  const basePrice = getBasePrice(product);
  const userDiscount = getUserDiscount(user);
  const promoDiscount = getPromoDiscount(promotions, context);
  const contextAdjustment = getContextAdjustment(context);

  return applyDiscounts(basePrice, [
    userDiscount,
    promoDiscount,
    contextAdjustment
  ]);
}
```

---

## Code Health Examples

### Example 1: Code Duplication

**Finding**: Error handling duplicated across controllers.

**Evidence**:
```typescript
// src/controllers/user.ts:45
try {
  const user = await userService.create(data);
  res.json({ success: true, data: user });
} catch (error) {
  logger.error('User creation failed', error);
  if (error instanceof ValidationError) {
    res.status(400).json({ error: error.message });
  } else {
    res.status(500).json({ error: 'Internal server error' });
  }
}

// src/controllers/order.ts:67 - DUPLICATE
try {
  const order = await orderService.create(data);
  res.json({ success: true, data: order });
} catch (error) {
  logger.error('Order creation failed', error);
  if (error instanceof ValidationError) {
    res.status(400).json({ error: error.message });
  } else {
    res.status(500).json({ error: 'Internal server error' });
  }
}
```

**Impact**: Medium - Maintenance burden, inconsistent fixes.

**Recommendation**:
```typescript
// src/middleware/errorHandler.ts
export function asyncHandler(fn) {
  return (req, res, next) => {
    Promise.resolve(fn(req, res, next)).catch(next);
  };
}

export function errorHandler(err, req, res, next) {
  logger.error('Request failed', err);

  if (err instanceof ValidationError) {
    return res.status(400).json({ error: err.message });
  }

  res.status(500).json({ error: 'Internal server error' });
}

// Controllers become simple
router.post('/users', asyncHandler(async (req, res) => {
  const user = await userService.create(req.body);
  res.json({ success: true, data: user });
}));
```

---

### Example 2: Dead Code

**Finding**: Exported function not used anywhere.

**Evidence**:
```typescript
// src/utils/format.ts
export function formatCurrency(amount: number) { ... }  // Used
export function formatDate(date: Date) { ... }          // Used
export function formatPhoneNumber(phone: string) { ... } // NOT USED

// No imports of formatPhoneNumber found in codebase
```

**Impact**: Low - Minor code bloat.

**Recommendation**:
```typescript
// Remove unused export or mark as intentionally kept
// Option 1: Remove
// export function formatPhoneNumber(phone: string) { ... }

// Option 2: If needed for future/external use
/** @internal Reserved for future phone validation feature */
export function formatPhoneNumber(phone: string) { ... }
```

---

### Example 3: Technical Debt Marker

**Finding**: FIXME comment indicates known bug.

**Evidence**:
```typescript
// src/services/auth.ts:89
// FIXME: Race condition when multiple login attempts
// This has been here for 8 months
async function handleLogin(credentials) {
  const session = await getSession(credentials.userId);
  if (session) {
    await deleteSession(session.id);  // Race condition here
  }
  return createSession(credentials.userId);
}
```

**Impact**: High - Known bug affecting production reliability.

**Recommendation**:
```typescript
async function handleLogin(credentials) {
  // Use atomic operation to prevent race condition
  return await db.transaction(async (trx) => {
    await Session.destroy({
      where: { userId: credentials.userId },
      transaction: trx
    });
    return Session.create({
      userId: credentials.userId
    }, { transaction: trx });
  });
}
```

---

### Example 4: Naming Inconsistency

**Finding**: Mixed naming conventions in codebase.

**Evidence**:
```
src/
├── userService.ts      # camelCase
├── OrderService.ts     # PascalCase
├── payment_service.ts  # snake_case
├── email-service.ts    # kebab-case
└── AuthService.ts      # PascalCase
```

**Impact**: Low - Developer confusion, harder onboarding.

**Recommendation**:
```
# Standardize on one convention (e.g., kebab-case for files)
src/
├── user-service.ts
├── order-service.ts
├── payment-service.ts
├── email-service.ts
└── auth-service.ts

# Add lint rule to enforce
// .eslintrc
{
  "rules": {
    "unicorn/filename-case": ["error", { "case": "kebabCase" }]
  }
}
```

---

## Summary Finding Format

Each finding should follow this structure:

```markdown
### [Category]: [Brief Description]

**Finding**: [What was found]

**Evidence**:
```code
[Relevant code snippet with file location]
```

**Impact**: [Critical/High/Medium/Low] - [Why it matters]

**Recommendation**:
```code
[How to fix it]
```
```
