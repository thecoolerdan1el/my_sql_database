from models import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT, ForeignKey
from sqlalchemy.dialects.mysql import MEDIUMINT
from datetime import date

class Client(Base):

    __tablename__="client"

    id_client: Mapped[int] = mapped_column(INT, nullable=False,
                                           autoincrement=True,
                                           primary_key=True,
                                           unique=True)
    username: Mapped[str] = mapped_column(VARCHAR(20), nullable=False)
    password: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)
    email: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)