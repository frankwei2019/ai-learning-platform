from sqlalchemy import Column, Integer, String, Text, Boolean, ForeignKey, DateTime, JSON
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from database import Base


class Course(Base):
    __tablename__ = "courses"
    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(200), nullable=False)
    category = Column(String(50))
    description = Column(Text)
    order_index = Column(Integer, default=0)
    created_at = Column(DateTime, server_default=func.now())
    chapters = relationship("Chapter", back_populates="course", order_by="Chapter.order_index")


class Chapter(Base):
    __tablename__ = "chapters"
    id = Column(Integer, primary_key=True, index=True)
    course_id = Column(Integer, ForeignKey("courses.id"))
    title = Column(String(200))
    video_url = Column(String(500))
    content = Column(Text)
    order_index = Column(Integer, default=0)
    course = relationship("Course", back_populates="chapters")
    questions = relationship("Question", back_populates="chapter")


class Question(Base):
    __tablename__ = "questions"
    id = Column(Integer, primary_key=True, index=True)
    chapter_id = Column(Integer, ForeignKey("chapters.id"))
    type = Column(String(20))  # single/multi/judge/short
    question = Column(Text)
    options = Column(JSON)
    answer = Column(String(500))
    explanation = Column(Text)
    chapter = relationship("Chapter", back_populates="questions")


class Progress(Base):
    __tablename__ = "progress"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(String(100))
    chapter_id = Column(Integer, ForeignKey("chapters.id"))
    completed = Column(Boolean, default=False)
    score = Column(Integer, default=0)
    updated_at = Column(DateTime, server_default=func.now(), onupdate=func.now())
