from typing import Any
from bson.objectid import ObjectId
from pymongo import MongoClient
import certifi
import bson
import ssl

client = MongoClient('mongodb+srv://qaninja:academy@cluster0.tb9kr.mongodb.net/Rocklov?retryWrites=true&w=majority', tlsCAFile=certifi.where())

db = client['rocklov']

def get_mongo_id(): 
    return bson.objectid.ObjectId()

def remove_user_by_email(user_email):
    users = db.users
    users.delete_many({'email': user_email})

def remove_equipo(equipo_name):
    equipos = db['equipos']
    equipos.delete_many({'name': equipo_name})
