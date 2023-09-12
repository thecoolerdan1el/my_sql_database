from models import Base, Employee, Client
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT, ForeignKey


class Bank_Details(Base):

    __tablename__="bank_details"

    agency: Mapped[int] = mapped_column(INT, nullable=False,
                                        unique=True,
                                        primary_key=True)
    account_num: Mapped[str] = mapped_column(VARCHAR(15), nullable=False, unique=True)
    payment_type: Mapped[int] = mapped_column(INT, nullable=False)
    bank_name: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)
    employee_id_employee: Mapped[int] = mapped_column(ForeignKey(Employee.id_employee))
    client_id_client: Mapped[int] = mapped_column(ForeignKey(Client.id_client))