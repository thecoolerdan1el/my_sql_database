from models import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR
from sqlalchemy.dialects.mysql import MEDIUMINT

class Site(Base):
    __tablename__="site"

    cnpj: Mapped[int] = mapped_column(MEDIUMINT(14), 
                                      unique=True, 
                                      primary_key=True, nullable=False)
    adress: Mapped[str] = mapped_column(VARCHAR(50), nullable=False)
    trading_name: Mapped[str] = mapped_column(VARCHAR(30), nullable=False)
    company_name: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)
    phone: Mapped[int] = mapped_column(MEDIUMINT(15), nullable=False)
    email: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)