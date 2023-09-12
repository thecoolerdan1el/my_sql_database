from models import Base, Product
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import INT, ForeignKey, DECIMAL

class Items_Order(Base):

    __tablename__ = "items_order"


    id_order: Mapped[int] = mapped_column(INT, primary_key=True,
                                          unique=True,
                                          nullable=True)
    id_items_order: Mapped[int] = mapped_column(INT, primary_key=True,
                                                unique=True,
                                                nullable=True)
    product_value: Mapped[int] = mapped_column(DECIMAL(8.2), nullable=False)
    product_id: Mapped[int] = mapped_column(INT, ForeignKey(Product.product_id))
    