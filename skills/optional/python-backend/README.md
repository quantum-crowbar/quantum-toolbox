# Python Backend

Guidelines for building backend services in Python.

## Core Principles

- **Type hints everywhere** — annotate all function signatures; `mypy --strict` as CI gate
- **Explicit over magic** — favour straightforward imports and explicit configuration
- **Async when IO-bound** — FastAPI + async SQLAlchemy for web services; sync for scripts
- **Modern Python** — 3.11+ minimum; use dataclasses, match statements, tomllib, pathlib

## Project Layout

```
src/
  app/
    api/          # Route handlers
    core/         # Config, lifespan, middleware
    models/       # SQLAlchemy / Pydantic models
    services/     # Business logic (no framework dependencies)
    repositories/ # Data access layer
  tests/
pyproject.toml    # Single config file (uv/poetry)
```

## Framework

**FastAPI** is the default for new services:

```python
from fastapi import FastAPI, Depends, HTTPException, status

app = FastAPI()

@app.get('/users/{user_id}', response_model=UserResponse)
async def get_user(user_id: str, db: AsyncSession = Depends(get_db)) -> UserResponse:
    user = await user_service.get(db, user_id)
    if not user:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND)
    return UserResponse.model_validate(user)
```

## Data Validation — Pydantic v2

```python
from pydantic import BaseModel, field_validator

class CreateUserRequest(BaseModel):
    email: str
    name: str

    @field_validator('email')
    @classmethod
    def validate_email(cls, v: str) -> str:
        if '@' not in v:
            raise ValueError('Invalid email')
        return v.lower()
```

- `model_validate()` for ORM objects (replaces `.from_orm()`)
- `model_dump()` for serialisation (replaces `.dict()`)

## Database — SQLAlchemy 2.x Async

```python
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select

async def get_user(session: AsyncSession, user_id: str) -> User | None:
    result = await session.execute(select(User).where(User.id == user_id))
    return result.scalar_one_or_none()
```

- Always use async sessions for FastAPI
- Alembic for migrations — never `create_all()` in production
- Repository pattern: keep SQLAlchemy out of business logic

## Configuration

```python
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    database_url: str
    secret_key: str
    debug: bool = False

    model_config = SettingsConfigDict(env_file='.env')

settings = Settings()
```

## Dependency Management

- **uv** for new projects — fast, reproducible, replaces pip + venv
- `pyproject.toml` only — no `setup.py`, no `requirements.txt` in new projects
- Pin versions in `pyproject.toml` lock file (`uv.lock`)

## Error Handling

```python
# ✓ Custom exception hierarchy
class AppError(Exception):
    def __init__(self, message: str, code: str) -> None:
        self.message = message
        self.code = code

class NotFoundError(AppError): ...
class ValidationError(AppError): ...

# ✓ FastAPI exception handler
@app.exception_handler(NotFoundError)
async def not_found_handler(request: Request, exc: NotFoundError) -> JSONResponse:
    return JSONResponse(status_code=404, content={'error': exc.code, 'message': exc.message})
```

## Async Pitfalls

- Never call blocking IO in async functions — use `asyncio.to_thread()` for blocking calls
- `httpx.AsyncClient` for async HTTP — not `requests`
- Database connections are not thread-safe — never share across threads

## Testing

- `pytest` + `pytest-asyncio` for async tests
- `httpx.AsyncClient` with `app=app` for integration tests (no running server needed)
- Factory fixtures with `factory_boy` or plain fixture functions
- Use `pytest-cov` for coverage; aim for service layer >80%
