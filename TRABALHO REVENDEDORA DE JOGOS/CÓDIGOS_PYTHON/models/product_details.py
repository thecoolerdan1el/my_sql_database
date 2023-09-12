from models import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT



class Product(Base):
    __tablename__="product"

    id: Mapped[int] = mapped_column(INT, nullable=False,
                                    primary_key=True,
                                    unique=True,
                                    autoincrement=True)
    name: Mapped[str] = mapped_column(VARCHAR(50), nullable= False)
    description: Mapped[str] = mapped_column(VARCHAR(200), nullable= False)
    genre: Mapped[str] = mapped_column(VARCHAR(30), nullable= False)


