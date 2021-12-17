from flask_sqlalchemy import SQLAlchemy
from flask import *
usr ='root'
passwd = 'admin'
server = 'localhost'
port = '3306'
app = Flask(__name__)
app.config['SECRET_KEY'] = '7110c8ae51a4b5af97be6534caef90e4bb9bdcb3380af008f90b23a5d1616bf319bc298105da20fe'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://renpesdev:RENPESdev-123@localhost:3306/renpes'
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://'+usr+':'+passwd+'@'+server+':'+port+'/renpes'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
from models import *

@app.route("/")
def index():
    return render_template("base.html")

