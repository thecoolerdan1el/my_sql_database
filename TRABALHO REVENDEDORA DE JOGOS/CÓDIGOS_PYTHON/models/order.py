from models import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import INT

class Order(Base):
    __tablename__="order"
    id_order: Mapped[int] = mapped_column(INT, nullable=False,
                                          autoincrement=True,
                                          primary_key=True,
                                          unique=True)
