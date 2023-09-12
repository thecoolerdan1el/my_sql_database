from urllib.parse import quote
from sqlalchemy_utils import database_exists, create_database
from sqlalchemy import create_engine
from sqlalchemy.orm import Session, DeclarativeBase


USER="test"
PASSWD=quote('password')
SERVER='localhost'
PORT=3306
DATABASE="games_store.database"
''
instance = f"mysql+pymysql://{USER}:{PASSWD}@{SERVER}:{PORT}/{DATABASE}"

if not database_exists(url=instance):
    create_database(url=instance)

engine = create_engine(url=instance, echo=True)
session = Session(bind=engine, autocommit=False, autoflush=True)

class Base(DeclarativeBase):
    pass



from models.games_site import Site
from models.genre import Game_Genre
from models.midias_site import Midia
from models.person import Person 
from models.client import Client
from models.order import Order
from models.product_details import Product
from models.items_order_details import Items_Order
from models.employee_details import Employee
from models.payment_method import Payment_Method
from models.bank_details import Bank_Details
from models.payment_employee import Payment_Employee


