# Todo Workflow Examples

Concrete examples of the todo workflow in action.

---

## Example 1: Full Autonomous Mode

### User Request

```
User: "Add email validation to the signup form. Use todo workflow."
```

### Execution

```
Agent: Starting todo workflow in autonomous mode.

=== Pre-Work Checks ===
✓ Branch: feature/signup-validation
✓ Tests: 42/42 passing
✓ Working directory: clean

=== Todo List ===
1. [ ] Create email validation utility function
2. [ ] Create validation utility tests
3. [ ] Add validation to signup form
4. [ ] Update form error display

=== Executing ===

[1/4] Create email validation utility function
  → Creating src/utils/validation.ts
  → Writing validateEmail function
  → Running linter... ✓
  → Running type check... ✓
  → Staged: src/utils/validation.ts
  → Committed: feat(validation): add email validation utility

[2/4] Create validation utility tests
  → Creating src/utils/validation.test.ts
  → Writing test cases (valid, invalid, edge cases)
  → Running tests... 45/45 passing ✓
  → Staged: src/utils/validation.test.ts
  → Committed: test(validation): add email validation tests

[3/4] Add validation to signup form
  → Modifying src/components/SignupForm.tsx
  → Importing validateEmail
  → Adding validation on blur
  → Running tests... 45/45 passing ✓
  → Staged: src/components/SignupForm.tsx
  → Committed: feat(signup): add email validation to form

[4/4] Update form error display
  → Modifying src/components/SignupForm.tsx
  → Adding error message display
  → Running tests... 45/45 passing ✓
  → Staged: src/components/SignupForm.tsx
  → Committed: feat(signup): add validation error display

=== Complete ===
✓ 4/4 items completed
✓ 45 tests passing
✓ 4 commits made

Commits:
  abc1234 feat(validation): add email validation utility
  def5678 test(validation): add email validation tests
  ghi9012 feat(signup): add email validation to form
  jkl3456 feat(signup): add validation error display
```

---

## Example 2: Semi-Autonomous with Code Review

### User Request

```
User: "Refactor the user service to use dependency injection.
       Use todo workflow, review code changes."
```

### Execution

```
Agent: Starting todo workflow with code review checkpoints.

=== Pre-Work Checks ===
✓ Branch: refactor/user-service-di
✓ Tests: 78/78 passing
✓ Working directory: clean

=== Todo List ===
1. [ ] Create UserRepository interface
2. [ ] Update UserService to accept repository
3. [ ] Update UserService tests with mock repository
4. [ ] Update dependency injection container

=== Executing ===

[1/4] Create UserRepository interface
  → Creating src/repositories/UserRepository.ts
  → Defining interface with CRUD methods
  → Running type check... ✓

  ┌─────────────────────────────────────────────────┐
  │ REVIEW CHECKPOINT: Item 1                       │
  ├─────────────────────────────────────────────────┤
  │ Changes Made:                                   │
  │ - src/repositories/UserRepository.ts (created) │
  │                                                 │
  │ Interface defines:                              │
  │ - findById(id: string): Promise<User | null>   │
  │ - findByEmail(email: string): Promise<User>    │
  │ - create(data: CreateUserDTO): Promise<User>   │
  │ - update(id: string, data: UpdateUserDTO)      │
  │ - delete(id: string): Promise<void>            │
  │                                                 │
  │ Proposed Commit:                                │
  │ refactor(user): add UserRepository interface   │
  └─────────────────────────────────────────────────┘

User: "continue"

  → Committed: refactor(user): add UserRepository interface

[2/4] Update UserService to accept repository
  → Modifying src/services/UserService.ts
  → Adding constructor injection
  → Updating methods to use repository
  → Running tests... 78/78 passing ✓

  ┌─────────────────────────────────────────────────┐
  │ REVIEW CHECKPOINT: Item 2                       │
  ├─────────────────────────────────────────────────┤
  │ Changes Made:                                   │
  │ - src/services/UserService.ts (modified)       │
  │                                                 │
  │ Key changes:                                    │
  │ - Constructor now accepts UserRepository       │
  │ - Direct DB calls replaced with repository     │
  │ - All existing tests still pass                │
  │                                                 │
  │ Proposed Commit:                                │
  │ refactor(user): inject repository into service │
  └─────────────────────────────────────────────────┘

User: "The findByEmail should throw if not found, not return null"

  → Updating UserRepository interface
  → Updating UserService implementation
  → Running tests... 78/78 passing ✓

  [Updated checkpoint shown]

User: "continue"

  → Committed: refactor(user): inject repository into service

[3/4] Update UserService tests with mock repository
  ...

[4/4] Update dependency injection container
  ...

=== Complete ===
✓ 4/4 items completed
✓ 82 tests passing (4 new)
✓ 4 commits made
```

---

## Example 3: Dry Run Mode

### User Request

```
User: "Add authentication middleware. Use todo workflow --dry-run"
```

### Execution

```
Agent: [DRY RUN MODE - No changes will be made]

=== Pre-Work Checks (Simulated) ===
→ Would check branch (currently: main)
  ⚠️ Would warn: on main branch
→ Would run tests
→ Would check working directory

=== Todo List (Planned) ===
1. [ ] Create auth middleware function
2. [ ] Create auth middleware tests
3. [ ] Add middleware to protected routes
4. [ ] Update route documentation

=== Simulated Execution ===

[1/4] Create auth middleware function
  → Would create: src/middleware/auth.ts
  → Would create: src/middleware/auth.test.ts
  → Would run: npm test
  → Would commit: "feat(auth): add authentication middleware"

[2/4] Create auth middleware tests
  → Would create: src/middleware/auth.test.ts
  → Would write: 8 test cases
  → Would run: npm test
  → Would commit: "test(auth): add middleware tests"

[3/4] Add middleware to protected routes
  → Would modify: src/routes/api.ts
  → Would modify: src/routes/admin.ts
  → Would run: npm test
  → Would commit: "feat(routes): add auth middleware to protected routes"

[4/4] Update route documentation
  → Would modify: docs/api.md
  → Would add: authentication requirements section
  → Would commit: "docs(api): document authentication requirements"

=== Dry Run Summary ===
Items: 4
Files to create: 2
Files to modify: 3
Commits planned: 4

[END DRY RUN - No files were changed]

Run workflow for real? (yes/no)
```

---

## Example 4: With Dependencies

### User Request

```
User: "Add a caching layer to the API. Use todo workflow."
```

### Execution

```
Agent: Starting todo workflow in autonomous mode.

=== Pre-Work Checks ===
✓ Branch: feature/api-caching
✓ Tests: 120/120 passing
✓ Working directory: clean

=== Todo List ===
1. [ ] Create CacheService interface
2. [ ] Implement RedisCacheService (depends: 1)
3. [ ] Create cache decorator (depends: 1)
4. [ ] Add caching to UserService (depends: 2, 3)
5. [ ] Add cache invalidation on write (depends: 4)

=== Executing ===

[1/5] Create CacheService interface
  → Creating src/services/cache/CacheService.ts
  → Defining get, set, delete, clear methods
  → Running type check... ✓
  → Committed: feat(cache): add CacheService interface

[2/5] Implement RedisCacheService
  ✓ Dependency met: item 1 completed
  → Creating src/services/cache/RedisCacheService.ts
  → Implementing CacheService interface
  → Creating src/services/cache/RedisCacheService.test.ts
  → Running tests... 125/125 passing ✓
  → Committed: feat(cache): implement Redis cache service

[3/5] Create cache decorator
  ✓ Dependency met: item 1 completed
  → Creating src/decorators/cached.ts
  → Implementing @Cached() decorator
  → Creating src/decorators/cached.test.ts
  → Running tests... 130/130 passing ✓
  → Committed: feat(cache): add @Cached decorator

[4/5] Add caching to UserService
  ✓ Dependencies met: items 2, 3 completed
  → Modifying src/services/UserService.ts
  → Adding @Cached() to read methods
  → Running tests... 130/130 passing ✓
  → Committed: feat(user): add caching to user service

[5/5] Add cache invalidation on write
  ✓ Dependency met: item 4 completed
  → Modifying src/services/UserService.ts
  → Adding cache.delete() on create/update/delete
  → Running tests... 130/130 passing ✓
  → Committed: feat(user): add cache invalidation

=== Complete ===
✓ 5/5 items completed
✓ 130 tests passing (10 new)
✓ 5 commits made
```

---

## Example 5: Batch Commits

### User Request

```
User: "Add user profile feature. Use todo workflow --batch"
```

### Execution

```
Agent: Starting todo workflow with batch commits.

=== Pre-Work Checks ===
✓ Branch: feature/user-profile
✓ Tests: 50/50 passing
✓ Working directory: clean

=== Todo List ===
[batch: user-profile-model]
1. [ ] Create UserProfile model
2. [ ] Create UserProfile migration
3. [ ] Create UserProfile repository

[batch: user-profile-api]
4. [ ] Create UserProfile service
5. [ ] Create UserProfile controller
6. [ ] Add UserProfile routes

[no batch]
7. [ ] Add UserProfile tests
8. [ ] Update API documentation

=== Executing ===

[1/8] Create UserProfile model
  → Creating src/models/UserProfile.ts
  → Deferring commit (batch: user-profile-model)

[2/8] Create UserProfile migration
  → Creating src/migrations/create_user_profiles.ts
  → Deferring commit (batch: user-profile-model)

[3/8] Create UserProfile repository
  → Creating src/repositories/UserProfileRepository.ts
  → Batch complete: user-profile-model
  → Staged: 3 files
  → Committed: feat(profile): add UserProfile model, migration, repository

[4/8] Create UserProfile service
  → Creating src/services/UserProfileService.ts
  → Deferring commit (batch: user-profile-api)

[5/8] Create UserProfile controller
  → Creating src/controllers/UserProfileController.ts
  → Deferring commit (batch: user-profile-api)

[6/8] Add UserProfile routes
  → Modifying src/routes/api.ts
  → Batch complete: user-profile-api
  → Staged: 3 files
  → Committed: feat(profile): add UserProfile service, controller, routes

[7/8] Add UserProfile tests
  → Creating tests for all new components
  → Running tests... 68/68 passing ✓
  → Committed: test(profile): add UserProfile tests

[8/8] Update API documentation
  → Modifying docs/api.md
  → Committed: docs(api): add UserProfile endpoints

=== Complete ===
✓ 8/8 items completed
✓ 68 tests passing (18 new)
✓ 4 commits made (batched from 8 items)

Commits:
  abc1234 feat(profile): add UserProfile model, migration, repository
  def5678 feat(profile): add UserProfile service, controller, routes
  ghi9012 test(profile): add UserProfile tests
  jkl3456 docs(api): add UserProfile endpoints
```

---

## Example 6: Handling Failures

### Scenario: Test Failure

```
[3/5] Update payment validation
  → Modifying src/services/PaymentService.ts
  → Running tests... FAILED

  ❌ 2 tests failing:
  - PaymentService.validate should reject expired cards
  - PaymentService.validate should reject invalid CVV

  Attempt 1/3: Fixing validation logic...
  → Running tests... FAILED (same errors)

  Attempt 2/3: Checking test expectations...
  → Running tests... FAILED (same errors)

  Attempt 3/3: Reviewing specification...
  → Running tests... 120/120 passing ✓

  → Committed: fix(payment): correct card validation logic
```

### Scenario: Unrecoverable Failure

```
[2/4] Add database index
  → Running migration... FAILED

  ❌ Migration failed:
  - Error: relation "users" does not exist

  This requires manual intervention.

  ┌─────────────────────────────────────────────────┐
  │ WORKFLOW STOPPED                                │
  ├─────────────────────────────────────────────────┤
  │ Completed: 1/4 items                            │
  │ Failed: Item 2 - Add database index             │
  │ Pending: 2 items                                │
  │                                                 │
  │ Error: Database table missing                   │
  │                                                 │
  │ Options:                                        │
  │ a) Fix manually and continue                    │
  │ b) Skip this item                               │
  │ c) Abort workflow                               │
  └─────────────────────────────────────────────────┘

User: "skip this item, I'll handle the migration separately"

  → Skipping item 2
  → Continuing with item 3...
```

---

## Example 7: Critical Items

### User Request

```
User: "Update authentication system. Use todo workflow, review critical"
```

### Execution

```
=== Todo List ===
1. [ ] Update password hashing algorithm
2. [ ] Migrate existing password hashes [critical]
3. [ ] Update login flow
4. [ ] Update session management [critical]
5. [ ] Add login audit logging

=== Executing ===

[1/5] Update password hashing algorithm
  → Modifying src/utils/password.ts
  → Running tests... ✓
  → Committed: feat(auth): upgrade to bcrypt with higher rounds

[2/5] Migrate existing password hashes [critical]
  → Creating src/migrations/rehash_passwords.ts
  → Running tests... ✓

  ┌─────────────────────────────────────────────────┐
  │ REVIEW CHECKPOINT: Critical Item 2              │
  ├─────────────────────────────────────────────────┤
  │ ⚠️ CRITICAL: This modifies user authentication │
  │                                                 │
  │ Changes Made:                                   │
  │ - Migration to rehash all user passwords        │
  │ - Backward compatible (old hashes still work)   │
  │ - Rehash on next successful login               │
  │                                                 │
  │ Risk Assessment:                                │
  │ - Users won't be locked out                     │
  │ - Gradual migration on login                    │
  │ - Rollback: revert migration, keep old hashes   │
  └─────────────────────────────────────────────────┘

User: "continue"

[3/5] Update login flow
  → (no review - not critical)
  → Committed: feat(auth): update login flow

[4/5] Update session management [critical]
  → Modifying src/services/SessionService.ts

  ┌─────────────────────────────────────────────────┐
  │ REVIEW CHECKPOINT: Critical Item 4              │
  ├─────────────────────────────────────────────────┤
  │ ⚠️ CRITICAL: This affects user sessions        │
  │                                                 │
  │ Changes Made:                                   │
  │ - Session token now includes refresh rotation   │
  │ - Old sessions remain valid until expiry        │
  │ - New sessions use improved token format        │
  └─────────────────────────────────────────────────┘

User: "continue"

[5/5] Add login audit logging
  → (no review - not critical)
  → Committed: feat(auth): add login audit logging

=== Complete ===
```

---

## Example 8: Resume After Interrupt

### Initial Session

```
[2/5] Implement search service
  → Creating src/services/SearchService.ts
  → Running tests... ✓

  [REVIEW CHECKPOINT]
  ...

User: [closes terminal / loses connection]
```

### Resume Session

```
User: "continue todo workflow"

Agent: Resuming todo workflow from saved state.

=== State Recovered ===
Branch: feature/search
Completed: 2/5 items
Last checkpoint: Item 2 review
Mode: review code changes

=== Validation ===
✓ Branch still exists
✓ Previous commits intact
✓ No conflicting changes
✓ Tests still passing

=== Resuming ===

[Showing checkpoint for item 2 again]

User: "continue"

[3/5] Add search to API routes
  → ...
```
