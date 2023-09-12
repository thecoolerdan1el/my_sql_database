from models import Base, Client
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import INT, DATETIME, FLOAT, ForeignKey
from datetime import date

class Order(Base):
    __tablename__="order"

    id_order: Mapped[int] = mapped_column(INT, nullable=False,
                                          autoincrement=True,
                                          primary_key=True,
                                          unique=True)
    date_order: Mapped[date] = mapped_column(DATETIME, nullable=False)
    value: Mapped[float] = mapped_column(FLOAT, nullable=False)
    id_client: Mapped[int] = mapped_column(INT, ForeignKey(Client.id_client))
                                           
