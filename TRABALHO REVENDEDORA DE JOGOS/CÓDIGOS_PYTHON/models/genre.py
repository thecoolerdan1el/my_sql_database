from models import Base
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, INT


class Game_Genre(Base):

    __tablename__="game_genre"

    id: Mapped[int] = mapped_column(INT, primary_key=True,
                                          unique=True,
                                          nullable=False,
                                          autoincrement=True)
    name: Mapped[int] = mapped_column(VARCHAR(45), nullable=False)