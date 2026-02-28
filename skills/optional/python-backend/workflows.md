# Python Backend — Workflows

## Code Review Checklist

```
[ ] All functions have type hints (params + return type)
[ ] No Any imports unless explicitly justified
[ ] Async functions don't call blocking IO
[ ] Database access only in repository layer
[ ] Pydantic models used at API boundary (not ORM models directly)
[ ] Alembic migration exists for any schema change
[ ] Secrets come from environment (not hardcoded)
[ ] Custom exception types (not bare Exception)
[ ] pytest-asyncio tests for all async code paths
```

## FastAPI Patterns

```python
# Lifespan for startup/shutdown
from contextlib import asynccontextmanager

@asynccontextmanager
async def lifespan(app: FastAPI):
    # startup
    await db.connect()
    yield
    # shutdown
    await db.disconnect()

app = FastAPI(lifespan=lifespan)

# Dependency injection pattern
async def get_current_user(token: str = Depends(oauth2_scheme)) -> User:
    ...

@app.get('/me')
async def me(user: User = Depends(get_current_user)) -> UserResponse:
    return UserResponse.model_validate(user)
```

## Migration Workflow

```bash
# Create new migration
alembic revision --autogenerate -m "add users table"

# Review the generated migration BEFORE applying
# Apply
alembic upgrade head

# Roll back
alembic downgrade -1
```

## Debugging Async Issues

- `asyncio.get_event_loop().set_debug(True)` to catch blocking calls
- `pytest-asyncio` mode must be set in `pyproject.toml`:
  ```toml
  [tool.pytest.ini_options]
  asyncio_mode = "auto"
  ```
- Slow test? Check for missing `await` on coroutines — they return a coroutine object, not the result

## Package Layout for uv

```toml
# pyproject.toml
[project]
name = "my-service"
version = "0.1.0"
requires-python = ">=3.11"
dependencies = [
    "fastapi>=0.111",
    "sqlalchemy[asyncio]>=2.0",
    "pydantic-settings>=2.0",
    "uvicorn[standard]>=0.29",
]

[tool.uv]
dev-dependencies = ["pytest", "pytest-asyncio", "httpx", "mypy"]
```
