#/usr/bin/python3
from enum import unique
from flask_login import UserMixin
from sqlalchemy.sql.schema import ForeignKey
from sqlalchemy import UniqueConstraint
from werkzeug.security import generate_password_hash, check_password_hash
from app import db
from datetime import datetime

class Alumno(db.Model): #Class Alumno En GT se toma el código proporcionado por el MINEDUC, Sin embargo se puede modificar a gusto, o según el requerimiento del país
    __tablename__ = 'tbl_alumno' #tabla en la BD
    id_alumno = db.Column(db.Integer, primary_key=True)#campos
    nombres = db.Column(db.String(100), nullable = False)#campos
    apellidos = db.Column(db.String(100), nullable = False)#campos
    codigo = db.Column(db.String(25), nullable=False)#campos
    carnet = db.Column(db.String(20),nullable=False)#Carnet estudiantil (Se puede llenar automáticamente)
    fecha_nac = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
    id_encargado = db.Column(db.Integer, db.ForeignKey('tbl_encargado.id_encargado'), nullable=False) #campo y llave foránea
    encargado = db.relationship('Encargado', backref=db.backref('tbl_alumno', lazy=True))#relacion hecha en Modelo
    
    def __repr__(self):
        return '<Alumno %r>' %self.nombres+' '+self.apellidos
        
    def save(self):#para guardar en la BD
        if not self.id_alumno:
            db.session.add(self)
        db.session.commit()
    #métodos para consultas
    @staticmethod
    def get_by_apellidos(apellidos):
        return Alumno.query.get(apellidos)
    def get_by_codigo(codigo):
        return Alumno.query.get(codigo)
    def get_by_carnet(carnet):
        return Alumno.query.get(carnet)
    def get_all():
        return Alumno.query.all()
    

class Encargado(db.Model): #El encargado debe ser el tutor o padre de familia responsable, para estudiantes mayores de edad o por madurez se puede asignar a el mismo. 
    __tablename__ = 'tbl_encargado' #tabla en la BD
    id_encargado =db.Column(db.Integer, primary_key=True)#campos
    nombres = db.Column(db.String(100), nullable=False)#campos
    apellidos = db.Column(db.String(100), nullable=False)#campos
    cui = db.Column(db.String(13), nullable=False)#en GT se le llama CUI (Código Único de Identificación), Equivalentes: No. DPI, DNI etc. (Puede ser pasaporte, modificar a los registros del país)
    direccion = db.Column(db.String(100), nullable=False)#campos
    telefono = db.Column(db.String(10), nullable=False)#campos 
    
    def __repr__(self):
        return'<Encargado: %r>'% self.nombres+' '+self.apellidos
    
    def save(self):
        if not self.id_encargado:
            db.session.add(self)
        db.session.commit()
    
    @staticmethod
    def get_by_apellidos(apellidos):
        return Encargado.query.get(apellidos)
    def get_by_cui(cui):
        return Encargado.query.get(cui)
    def get_all():
        return Encargado.query.all()

#En GT se manejan los siguientes Niveles (Preescolar o PrePrimaria, Primaria, Medio(Secundaria) y Diversificado)
#Preprimaria abarca todos los niveles preescolares.
#Primaria va del 1r Grado hasta el 6to
#Medio es: 1ro, 2do y 3ro Básico (7mo, 8vo y 9no en otros paises)
#Diversificado: es 4to, 5to y en algunos casos 6to seguido del nombre de la Carrera 
class Grado(db.Model):
    __tablename__ = 'tbl_grado'
    id_grado = db.Column(db.Integer, primary_key=True)
    grado = db.Column(db.String(25), nullable=False)
    id_seccion = db.Column(db.Integer, db.ForeignKey('tbl_seccion.id_seccion'), nullable=False)
    seccion = db.relationship('Seccion', backref=db.backref('tbl_seccion', lazy=True))
    id_carrera =db.Column(db.Integer, db.ForeignKey('tbl_carrera.id_carrera'), nullable=False)
    carrera = db.relationship('Carrera', backref=db.backref('tbl_carrera', lazy=True))
    id_nivel = db.Column(db.Integer, db.ForeignKey('tbl_nivel.id_nivel'), nullable=False)
    nivel = db.relationship('Nivel', backref=db.backref('tbl_nivel', lazy=True))
    
    def __repr__(self):
        return '<Grado: %r>' %self.grado
        
    def save(self):
        if not self.id_grado:
            db.session.add(self)
        db.session.commit()
    @staticmethod
    def get_by_grado(grado):
        return Grado.query.get(grado)
    def get_all():
        return Grado.query.all()

class Seccion(db.Model):
    __tablename__ = 'tbl_seccion'
    id_seccion = db.Column(db.Integer, primary_key=True)
    seccion = db.Column(db.String(2),nullable=False)
    
    def __repr__(self):
        return '<Seccion: %r>' %self.seccion
    
    
    def save(self):
        if not self.id_seccion:
            db.session.add(self)
        db.session.commit()
    @staticmethod
    def get_all():
        return Seccion.query.all()

class Carrera(db.Model):
    __tablename__ = 'tbl_carrera'
    id_carrera = db.Column(db.Integer, primary_key=True)
    descripcion = db.Column(db.String(50), nullable = False)
    
    def __repr__(self):
        return '<Carrera: %r>' %self.descripcion
    
    
    def save(self):
        if not self.id_carrera:
            db.session.add(self)
        db.session.commit()
    @staticmethod
    def get_all():
        return Carrera.query.all()
        
class Nivel(db.Model):
    __tablename__ = 'tbl_nivel'
    id_nivel = db.Column(db.Integer, primary_key = True)
    nivel = db.Column(db.String(25), nullable=False)
    
    def __repr__(self):
        return '<Nivel: %r>' %self.nivel
    
    
    def save(self):
        if not self.id_nivel:
            db.session.add(self)
        db.session.commit()
    @staticmethod 
    def get_all():
        return Nivel.query.all()

class Usuario(db.Model):
    __tablename__ = 'tbl_usuario'
    id_usuario = db.Column(db.Integer, primary_key = True)
    usuario = db.Column(db.String(25), nullable = False, unique=True )
    email = db.Column(db.String(256), unique = True) 
    passwd = db.Column(db.String(128), nullable = False)
    is_admin = db.Column(db.Boolean, default = False)
    
    def __repr__(self):
        return '<Usuario: %r>' %self.usuario
    
    def set_password(self,passwd):
        self.passwd = generate_password_hash(passwd)
    
    def check_password(self, passwd):
        return check_password_hash(self.passwd, passwd)
    
    def save(self):
        if not self.id_usuario:
            db.session.add(self)
        db.session.commit()
    
    @staticmethod
    def get_by_id(id_usuario):
        return Usuario.query.get(id_usuario)
    def get_by_email(email):
        return Usuario.query.get(email)
    
