from models import Base, Employee
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, DATETIME, ForeignKey, INT
from sqlalchemy.dialects.mysql import MEDIUMINT

class Payment_Employee(Base):

    __tablename__ = "payment_employee"

    id: Mapped[int] = mapped_column(INT, nullable=False,
                                    unique=True,
                                    autoincrement=True,
                                    primary_key=True)
    date: Mapped[date] = mapped_column(INT, nullable=False)
    amount: Mapped[str] = mapped_column(VARCHAR(15), nullable=False)
    discount: Mapped[str] = mapped_column(VARCHAR(15), nullable=False)
    payday: Mapped[date] = mapped_column(DATETIME, nullable=False)
    employee_id_employee: Mapped[int] = mapped_column(MEDIUMINT, ForeignKey(Employee.id_employee))
                                                      