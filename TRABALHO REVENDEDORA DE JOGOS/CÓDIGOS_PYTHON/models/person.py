from models import Base, Site
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, DATE, ForeignKey
from sqlalchemy.dialects.mysql import MEDIUMINT
from datetime import date

class Person(Base):
    
    __tablename__="person"

    id_person: Mapped[int] = mapped_column(MEDIUMINT(unsigned=True),
                                            autoincrement=True,
                                            primary_key=True,
                                            unique=True)
    phone_number: Mapped[str] = mapped_column(VARCHAR(15), nullable=False)
    name: Mapped[str] = mapped_column(VARCHAR(60),nullable=False)
    email: Mapped[str] = mapped_column(VARCHAR(45), nullable=False, unique=True)
    birth_date: Mapped[date] = mapped_column(DATE, nullable=False)
    site_cnpj: Mapped[int] = mapped_column(MEDIUMINT(14), ForeignKey(Site.cnpj), nullable=False)

