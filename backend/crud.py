from sqlalchemy.orm import Session
from typing import List
import models, schemas


def get_courses(db: Session) -> List[models.Course]:
    return db.query(models.Course).order_by(models.Course.order_index).all()


def get_course(db: Session, course_id: int) -> models.Course:
    return db.query(models.Course).filter(models.Course.id == course_id).first()


def create_course(db: Session, course: schemas.CourseCreate) -> models.Course:
    db_course = models.Course(**course.dict())
    db.add(db_course)
    db.commit()
    db.refresh(db_course)
    return db_course


def get_chapters(db: Session, course_id: int) -> List[models.Chapter]:
    return db.query(models.Chapter).filter(
        models.Chapter.course_id == course_id
    ).order_by(models.Chapter.order_index).all()


def get_chapter(db: Session, chapter_id: int) -> models.Chapter:
    return db.query(models.Chapter).filter(models.Chapter.id == chapter_id).first()


def create_chapter(db: Session, chapter: schemas.ChapterCreate) -> models.Chapter:
    db_chapter = models.Chapter(**chapter.dict())
    db.add(db_chapter)
    db.commit()
    db.refresh(db_chapter)
    return db_chapter


def get_questions(db: Session, chapter_id: int) -> List[models.Question]:
    return db.query(models.Question).filter(
        models.Question.chapter_id == chapter_id
    ).all()


def create_question(db: Session, question: schemas.QuestionCreate) -> models.Question:
    db_question = models.Question(**question.dict())
    db.add(db_question)
    db.commit()
    db.refresh(db_question)
    return db_question


def get_progress(db: Session, user_id: str) -> List[models.Progress]:
    return db.query(models.Progress).filter(
        models.Progress.user_id == user_id
    ).all()


def update_progress(db: Session, progress: schemas.ProgressCreate) -> models.Progress:
    existing = db.query(models.Progress).filter(
        models.Progress.user_id == progress.user_id,
        models.Progress.chapter_id == progress.chapter_id
    ).first()
    
    if existing:
        existing.completed = progress.completed
        existing.score = progress.score
    else:
        existing = models.Progress(**progress.dict())
        db.add(existing)
    
    db.commit()
    db.refresh(existing)
    return existing
