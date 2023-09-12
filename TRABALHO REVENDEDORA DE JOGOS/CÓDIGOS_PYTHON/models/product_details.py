from models import Base, Midia, Game_Genre
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT, ForeignKey



class Product(Base):
    __tablename__="product"

    product_id: Mapped[int] = mapped_column(INT, nullable=False,
                                    primary_key=True,
                                    unique=True,
                                    autoincrement=True)
    name: Mapped[str] = mapped_column(VARCHAR(50), nullable= False)
    description: Mapped[str] = mapped_column(VARCHAR(200), nullable= False)
    id_genre: Mapped[str] = mapped_column(INT, ForeignKey(Game_Genre.id))
    id_midia: Mapped[str] = mapped_column(INT, ForeignKey(Midia.id))


