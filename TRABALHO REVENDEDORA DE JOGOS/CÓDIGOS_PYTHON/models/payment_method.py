from models import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT, ForeignKey
class Payment_Method(Base):
    __tablename__="payment_method"

    code: Mapped[int] = mapped_column(INT, nullable=False, unique=True,
                                      primary_key=True)
    name: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)
    shopping_cart_id_cart: Mapped[int] = mapped_column(INT)