from models import Base, Order
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT, ForeignKey
class Payment_Method(Base):
    __tablename__="payment_method"

    code: Mapped[int] = mapped_column(INT, nullable=False, unique=True,
                                      primary_key=True)
    name: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)
    id_order: Mapped[str] = mapped_column(INT, ForeignKey(Order.id_order))