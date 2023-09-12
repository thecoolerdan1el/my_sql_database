from models import Base, Site
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy import VARCHAR, ForeignKey, INT
from sqlalchemy.dialects.mysql import MEDIUMINT


class Midia(Base):

    __tablename__="midia"

    id: Mapped[int] = mapped_column(INT, nullable=False,
                                    unique=True,
                                    autoincrement=True,
                                    primary_key=True)
    image: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)
    videos: Mapped[str] = mapped_column(VARCHAR(45), nullable=False)
    documents: Mapped[str] = mapped_column(VARCHAR(45), nullable=False, unique=True)
    site_adress: Mapped[str] = mapped_column(VARCHAR(50), nullable=False)
    site_cnpj: Mapped[int] = mapped_column(MEDIUMINT(14), ForeignKey(Site.cnpj))