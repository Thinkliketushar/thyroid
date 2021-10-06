import numpy as np
from flask import Flask, request, render_template, url_for
import pickle
import joblib
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
with open('config.json', 'r') as c:
    params = json.load(c)["params"]


local_server = True
app = Flask(__name__)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

model = joblib.load("finalized_model.pkl")  
db = SQLAlchemy(app)
     
class Users(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(80), nullable=False)
    Age = db.Column(db.Integer, nullable=False)
    Gender = db.Column(db.Integer, nullable=False)
    on_thyroxine = db.Column(db.Integer, nullable=False)
    query_on_thyroxine = db.Column(db.Integer, nullable=False)
    on_antithyroid_medication = db.Column(db.Integer, nullable=False)
    sickness = db.Column(db.Integer, nullable=False)
    pregnant = db.Column(db.Integer, nullable=False)
    thyroid_surgery = db.Column(db.Integer, nullable=False)
    I131_treatment = db.Column(db.Integer, nullable=False)
    query_hypothyroid = db.Column(db.Integer, nullable=False)
    query_hyperthyroid = db.Column(db.Integer, nullable=False)
    lithium = db.Column(db.Integer, nullable=False)
    goitre = db.Column(db.Integer, nullable=False)
    tumor = db.Column(db.Integer, nullable=False)
    hypopituitary = db.Column(db.Integer, nullable=False)
    psych = db.Column(db.Integer, nullable=False)
    T3 = db.Column(db.Integer, nullable=False)
    TT4 = db.Column(db.Integer, nullable=False)
    T4U = db.Column(db.Integer, nullable=False)
    FTI = db.Column(db.Integer, nullable=False)
    referral_source = db.Column(db.Integer, nullable=False)


@app.route('/') 
def hello():  
    return render_template('Thyriod.html')
      
@app.errorhandler(404)
def not_found(e):
  return render_template("404.html")


@app.route('/predict', methods=['POST', 'GET'])
def predict():
    if(request.method=='POST'):
        input_features = [str(x) for x in request.form.values()]
        name = request.form.get('name')
        age = request.form.get('age')
        gender = request.form.get('gender')
        on_thyroxine =  request.form.get('options')
        query_on_thyroxine =  request.form.get('options1')
        on_antithyroid_medication =  request.form.get('options2')
        sickness =  request.form.get('sick')
        pregnant =  request.form.get('options4')
        thyroid_surgery =  request.form.get('options5')
        I131_treatment =  request.form.get('options6')
        query_hypothyroid =  request.form.get('options7')
        query_hyperthyroid =  request.form.get('options8')
        lithium =  request.form.get('options9')
        goitre =  request.form.get('options10')
        tumor =  request.form.get('options11')
        hypopituitary =  request.form.get('options12')
        psych =  request.form.get('options13')
        T3 =  request.form.get('num1')
        TT4 =  request.form.get('num2')
        T4U =  request.form.get('num3')
        FTI =  request.form.get('num4')
        referral_source =  request.form.get('Referral')

        entry = Users(Name=name, Age = age, Gender = gender, on_thyroxine = on_thyroxine, query_on_thyroxine = query_on_thyroxine,
        on_antithyroid_medication = on_antithyroid_medication,sickness=sickness, pregnant = pregnant, thyroid_surgery = thyroid_surgery,
        I131_treatment = I131_treatment, query_hypothyroid = query_hypothyroid, query_hyperthyroid = query_hyperthyroid,
        lithium = lithium, goitre = goitre, tumor = tumor, hypopituitary = hypopituitary,
        psych = psych, T3 = T3, TT4 = TT4, T4U = T4U, FTI = FTI, referral_source = referral_source)
        
        db.session.add(entry)
        db.session.commit()

        print(input_features)
        newl = input_features[1:]
        value = np.array(newl)
        predictions = model.predict([value])
        result = ''
        if predictions[0] == 0:
            result = 'Compensated hypothyroid'
        elif predictions[0] == 1:
            result = 'Negative'
        elif predictions[0] == 2:
            result = 'Primary hypothyroid'
        else:
            result = 'Primary hypothyroid'

        print(result)
        return render_template('Thyriod.html', Prediction_text = f"According to the prediction, Your Thyroid is:- {result}")
    else:
        miss = "Field is missing"
        return render_template('Thyriod.html',Prediction_text = f"{miss}")



          
if __name__ =='__main__':  
    app.run(host='0.0.0.0', port = 8080)  
