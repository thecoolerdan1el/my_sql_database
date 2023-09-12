from models import Base, Person
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT, ForeignKey
from sqlalchemy.dialects.mysql import MEDIUMINT

class Employee(Base):

    __tablename__="employee"

    id_employee: Mapped[int] = mapped_column(MEDIUMINT, unique=True,
                                             nullable=False,
                                             primary_key=True,
                                             autoincrement=True)
    salary: Mapped[int] = mapped_column(VARCHAR(10), nullable=True)
    person_id_person: Mapped[int] = mapped_column(MEDIUMINT(unsigned=True),
                                                  ForeignKey(Person.id_person)),
                                               
    