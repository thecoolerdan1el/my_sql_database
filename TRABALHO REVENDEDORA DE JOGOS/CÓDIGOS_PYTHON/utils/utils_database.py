from models import *

def create_db():
    Base.metadata.drop_all(bind=engine)
    Base.metadata.create_all(bind=engine)