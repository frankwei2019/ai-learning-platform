from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from typing import List

from database import engine, get_db, Base
import models, schemas
from crud import (
    get_courses, get_course, create_course,
    get_chapters, get_chapter, create_chapter,
    get_questions, create_question,
    get_progress, update_progress
)

# Create tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="AI Learning Platform API")

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Courses
@app.get("/api/courses", response_model=List[schemas.CourseResponse])
def list_courses(db: Session = Depends(get_db)):
    return get_courses(db)

@app.get("/api/courses/{course_id}", response_model=schemas.CourseResponse)
def get_course_detail(course_id: int, db: Session = Depends(get_db)):
    course = get_course(db, course_id)
    if not course:
        raise HTTPException(status_code=404, detail="Course not found")
    return course

@app.post("/api/courses", response_model=schemas.CourseResponse)
def create_new_course(course: schemas.CourseCreate, db: Session = Depends(get_db)):
    return create_course(db, course)

# Chapters
@app.get("/api/courses/{course_id}/chapters", response_model=List[schemas.ChapterResponse])
def list_chapters(course_id: int, db: Session = Depends(get_db)):
    return get_chapters(db, course_id)

@app.post("/api/chapters", response_model=schemas.ChapterResponse)
def create_new_chapter(chapter: schemas.ChapterCreate, db: Session = Depends(get_db)):
    return create_chapter(db, chapter)

# Questions
@app.get("/api/chapters/{chapter_id}/questions", response_model=List[schemas.QuestionResponse])
def list_questions(chapter_id: int, db: Session = Depends(get_db)):
    return get_questions(db, chapter_id)

@app.post("/api/questions", response_model=schemas.QuestionResponse)
def create_new_question(question: schemas.QuestionCreate, db: Session = Depends(get_db)):
    return create_question(db, question)

# Progress
@app.get("/api/progress/{user_id}", response_model=List[schemas.ProgressResponse])
def get_user_progress(user_id: str, db: Session = Depends(get_db)):
    return get_progress(db, user_id)

@app.post("/api/progress")
def save_progress(progress: schemas.ProgressCreate, db: Session = Depends(get_db)):
    return update_progress(db, progress)

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
