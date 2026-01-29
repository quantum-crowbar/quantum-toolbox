# Software Design Examples

Concrete examples of design principles in action.

---

## Single Responsibility Principle

### Before (Violates SRP)

```typescript
class UserService {
  createUser(data: UserData) {
    // Validate input
    if (!data.email.includes('@')) throw new Error('Invalid email');
    if (data.password.length < 8) throw new Error('Password too short');

    // Hash password
    const hashedPassword = bcrypt.hashSync(data.password, 10);

    // Save to database
    const user = this.db.insert('users', { ...data, password: hashedPassword });

    // Send welcome email
    this.sendEmail(data.email, 'Welcome!', 'Thanks for joining...');

    // Log analytics
    this.analytics.track('user_created', { userId: user.id });

    return user;
  }
}
```

### After (Follows SRP)

```typescript
class UserValidator {
  validate(data: UserData): ValidationResult {
    const errors = [];
    if (!data.email.includes('@')) errors.push('Invalid email');
    if (data.password.length < 8) errors.push('Password too short');
    return { isValid: errors.length === 0, errors };
  }
}

class PasswordHasher {
  hash(password: string): string {
    return bcrypt.hashSync(password, 10);
  }
}

class UserRepository {
  create(data: UserData): User {
    return this.db.insert('users', data);
  }
}

class UserService {
  constructor(
    private validator: UserValidator,
    private hasher: PasswordHasher,
    private repo: UserRepository,
    private events: EventEmitter
  ) {}

  createUser(data: UserData): User {
    const validation = this.validator.validate(data);
    if (!validation.isValid) throw new ValidationError(validation.errors);

    const user = this.repo.create({
      ...data,
      password: this.hasher.hash(data.password)
    });

    this.events.emit('user.created', user);
    return user;
  }
}

// Separate listeners handle email and analytics
eventEmitter.on('user.created', (user) => emailService.sendWelcome(user));
eventEmitter.on('user.created', (user) => analytics.track('user_created', user));
```

---

## Open/Closed Principle

### Before (Violates OCP)

```typescript
class PaymentProcessor {
  process(payment: Payment) {
    if (payment.type === 'credit_card') {
      return this.processCreditCard(payment);
    } else if (payment.type === 'paypal') {
      return this.processPayPal(payment);
    } else if (payment.type === 'crypto') {
      return this.processCrypto(payment);
    }
    // Must modify this class for every new payment type!
    throw new Error('Unknown payment type');
  }
}
```

### After (Follows OCP)

```typescript
interface PaymentStrategy {
  canHandle(type: string): boolean;
  process(payment: Payment): PaymentResult;
}

class CreditCardStrategy implements PaymentStrategy {
  canHandle(type: string) { return type === 'credit_card'; }
  process(payment: Payment) { /* ... */ }
}

class PayPalStrategy implements PaymentStrategy {
  canHandle(type: string) { return type === 'paypal'; }
  process(payment: Payment) { /* ... */ }
}

class PaymentProcessor {
  constructor(private strategies: PaymentStrategy[]) {}

  process(payment: Payment) {
    const strategy = this.strategies.find(s => s.canHandle(payment.type));
    if (!strategy) throw new Error('Unknown payment type');
    return strategy.process(payment);
  }

  // Adding new payment types doesn't require modifying this class
  addStrategy(strategy: PaymentStrategy) {
    this.strategies.push(strategy);
  }
}
```

---

## Dependency Inversion

### Before (Violates DIP)

```typescript
class OrderService {
  private mysqlDb = new MySQLDatabase();  // Concrete dependency
  private stripePayment = new StripeAPI();  // Concrete dependency

  createOrder(order: Order) {
    this.mysqlDb.insert('orders', order);  // Tightly coupled
    this.stripePayment.charge(order.total);  // Tightly coupled
  }
}
```

### After (Follows DIP)

```typescript
interface Database {
  insert(table: string, data: any): void;
}

interface PaymentGateway {
  charge(amount: number): PaymentResult;
}

class OrderService {
  constructor(
    private db: Database,          // Depends on abstraction
    private payment: PaymentGateway // Depends on abstraction
  ) {}

  createOrder(order: Order) {
    this.db.insert('orders', order);
    this.payment.charge(order.total);
  }
}

// Now easily swappable and testable
const orderService = new OrderService(
  new MySQLDatabase(),  // or PostgresDatabase, or MockDatabase
  new StripeGateway()   // or PayPalGateway, or MockGateway
);
```

---

## Factory Pattern Example

### Problem

Creating objects with complex setup or conditional logic.

### Solution

```typescript
interface Logger {
  log(message: string): void;
}

class ConsoleLogger implements Logger {
  log(message: string) { console.log(message); }
}

class FileLogger implements Logger {
  constructor(private path: string) {}
  log(message: string) { fs.appendFileSync(this.path, message + '\n'); }
}

class CloudLogger implements Logger {
  constructor(private endpoint: string) {}
  log(message: string) { fetch(this.endpoint, { body: message }); }
}

class LoggerFactory {
  static create(config: LogConfig): Logger {
    switch (config.type) {
      case 'console':
        return new ConsoleLogger();
      case 'file':
        return new FileLogger(config.path);
      case 'cloud':
        return new CloudLogger(config.endpoint);
      default:
        throw new Error(`Unknown logger type: ${config.type}`);
    }
  }
}

// Usage
const logger = LoggerFactory.create({ type: 'file', path: '/var/log/app.log' });
```

---

## Strategy Pattern Example

### Problem

Different algorithms needed for the same operation.

### Solution

```typescript
interface ShippingStrategy {
  calculate(order: Order): number;
}

class StandardShipping implements ShippingStrategy {
  calculate(order: Order) {
    return order.weight * 0.5;
  }
}

class ExpressShipping implements ShippingStrategy {
  calculate(order: Order) {
    return order.weight * 1.5 + 10;
  }
}

class FreeShipping implements ShippingStrategy {
  calculate(order: Order) {
    return 0;
  }
}

class OrderCalculator {
  constructor(private shippingStrategy: ShippingStrategy) {}

  calculateTotal(order: Order) {
    const subtotal = order.items.reduce((sum, item) => sum + item.price, 0);
    const shipping = this.shippingStrategy.calculate(order);
    return subtotal + shipping;
  }

  setShippingStrategy(strategy: ShippingStrategy) {
    this.shippingStrategy = strategy;
  }
}

// Usage
const calculator = new OrderCalculator(new StandardShipping());
calculator.calculateTotal(order);

// Change strategy at runtime
if (order.total > 100) {
  calculator.setShippingStrategy(new FreeShipping());
}
```

---

## Facade Pattern Example

### Problem

Complex subsystem with many components.

### Solution

```typescript
// Complex subsystems
class VideoDecoder { decode(file: string) { /* ... */ } }
class AudioDecoder { decode(file: string) { /* ... */ } }
class SubtitleParser { parse(file: string) { /* ... */ } }
class VideoRenderer { render(frames: Frame[]) { /* ... */ } }
class AudioPlayer { play(audio: Audio) { /* ... */ } }
class SubtitleOverlay { overlay(text: string) { /* ... */ } }

// Facade simplifies the interface
class MediaPlayer {
  private videoDecoder = new VideoDecoder();
  private audioDecoder = new AudioDecoder();
  private subtitleParser = new SubtitleParser();
  private videoRenderer = new VideoRenderer();
  private audioPlayer = new AudioPlayer();
  private subtitleOverlay = new SubtitleOverlay();

  play(mediaFile: string, subtitleFile?: string) {
    const video = this.videoDecoder.decode(mediaFile);
    const audio = this.audioDecoder.decode(mediaFile);

    this.videoRenderer.render(video.frames);
    this.audioPlayer.play(audio);

    if (subtitleFile) {
      const subtitles = this.subtitleParser.parse(subtitleFile);
      this.subtitleOverlay.overlay(subtitles);
    }
  }

  pause() { /* ... */ }
  stop() { /* ... */ }
}

// Simple usage
const player = new MediaPlayer();
player.play('movie.mp4', 'subtitles.srt');
```

---

## Layered Architecture Example

```
src/
├── presentation/        # Layer 1: UI/API
│   ├── api/
│   │   └── userController.ts
│   └── web/
│       └── UserPage.tsx
│
├── application/         # Layer 2: Use Cases
│   ├── createUser.ts
│   └── getUserProfile.ts
│
├── domain/              # Layer 3: Business Logic
│   ├── entities/
│   │   └── User.ts
│   └── services/
│       └── UserValidation.ts
│
└── infrastructure/      # Layer 4: External Services
    ├── database/
    │   └── UserRepository.ts
    └── email/
        └── EmailService.ts
```

**Dependency direction**: Presentation → Application → Domain ← Infrastructure

The domain layer has no dependencies on outer layers.
