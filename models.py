from flask_login import UserMixin
from sqlalchemy.sql.schema import ForeignKey
from werkzeug.security import generate_password_hash, check_password_hash
from app import db

class Seccion(db.Model):
    __tablename__ = 'tbl_seccion'
    id_seccion = db.relationship(db.Integer, primary_key=True)
    seccion = db.Column(db.String(80), nullable=False)

    def __repr__ (self):
        return f'<Seccion {self.seccion}>'
    def save(self):
        if not self.id_seccion:
            db.session.add(self)
        db.session.commit()
    @staticmethod
    def get_seccion(id_seccion):
        return Seccion.query.get(id_seccion)
    def get_all():
        return Seccion.query.all()

class Nivel(db.Mmodel):
    __tablename__ = 'tbl_nivel'
    id_nivel = db.Column(db.Integer, primary_key=True)
    nivel = db.Column(db.String(25), nullable=False)
    
    def __repr__ (self):
        return f'<Nivel {self.nivel}>'
    def save(self):
        if not self.id_nivel:
            db.session.add(self)
        db.session.commit()
    @staticmethod
    def get_nivel(id_nivel):
        return Seccion.query.get(id_nivel)
    def get_all():
        return Nivel.query.all()

class Grado(db.Model):
    __tablename__ = 'tbl_grado'
    id_grado = db.Column(db.Integer, primary_key=True)
    nombre_grado = db.Column(db.String(25), primary_key=True)
    id_seccion = db.Column(db.Integer, ForeignKey('Seccion.id_seccion'))
    


