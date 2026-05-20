from pydantic_settings import BaseSettings
from functools import lru_cache


@lru_cache()
def get_settings():
    return Settings()


class Settings(BaseSettings):
    DATABASE_URL: str = "mysql+pymysql://root:password@localhost:3306/ai_learning"
    SECRET_KEY: str = "your-secret-key-change-in-production"

    class Config:
        env_file = ".env"
