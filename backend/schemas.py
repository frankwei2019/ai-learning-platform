from pydantic import BaseModel
from typing import Optional, List
from datetime import datetime


class ChapterBase(BaseModel):
    title: str
    video_url: Optional[str] = None
    content: Optional[str] = None
    order_index: int = 0


class ChapterCreate(ChapterBase):
    course_id: int


class ChapterResponse(ChapterBase):
    id: int
    class Config:
        from_attributes = True


class QuestionBase(BaseModel):
    type: str
    question: str
    options: Optional[List[str]] = None
    answer: str
    explanation: Optional[str] = None


class QuestionCreate(QuestionBase):
    chapter_id: int


class QuestionResponse(QuestionBase):
    id: int
    class Config:
        from_attributes = True


class CourseBase(BaseModel):
    title: str
    category: Optional[str] = None
    description: Optional[str] = None
    order_index: int = 0


class CourseCreate(CourseBase):
    pass


class CourseResponse(CourseBase):
    id: int
    chapters: List[ChapterResponse] = []
    class Config:
        from_attributes = True


class ProgressBase(BaseModel):
    user_id: str
    chapter_id: int
    completed: bool = False
    score: int = 0


class ProgressCreate(ProgressBase):
    pass


class ProgressResponse(ProgressBase):
    updated_at: Optional[datetime] = None
    class Config:
        from_attributes = True
