from flask import Flask, jsonify, abort, make_response, request, Response
import pymysql
import json
import collections
import time
import heapq
import base64
import requests

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

db = pymysql.connect(
    host='localhost',
    user='root',
    passwd='password',
    database='eclipse'
)

@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Not found'}), 404)

@app.route('/WebApplication_Eclipse/api/worldeclipse/queryByDate/<year>/<month>/<day>', methods=['GET'])
def query_by_date(year, month, day):
    year = int(year)
    year1 = year;
    year2 = year + 1;
    if (year < 2001):
        year1 = 2001;
        year2 = 2002;
    elif (year > 2100):
        year1 = 2099;
        year2 = 2100;
    db.ping(reconnect=True)
    cursor = db.cursor()
    sql = "SELECT * FROM worldeclipse WHERE Year>={0} AND Year<={1}".format(year1, year2);
    cursor.execute(sql)
    results = cursor.fetchall()
    db.commit()
    returnedDate=[]
    for result in results:
        date = str (result[1] + '-' + result[2] + '-' + result[3])
        returnedDate.append(date)
    return jsonify(returnedDate)

@app.route('/WebApplication_Eclipse/api/postscripts', methods=['GET'])
def get_all_postscripts():
    returnedPostscripts = []
    db.ping(reconnect=True)
    cursor = db.cursor()
    sql = "SELECT * FROM postscripts";
    cursor.execute(sql)
    results = cursor.fetchall()
    fields = cursor.description
    db.commit()
    for result in results:
        dict = collections.defaultdict(list)
        for i in range(1,len(fields)):
            dict[fields[i][0]]=result[i]
        dict['PID'] = result[0]  # 数据库第一字段以非法字符开头，避免该情况
        dict[fields[1][0]]=float(result[1])  # 经度数据类型string改为float
        dict[fields[2][0]] = float(result[2])  # 纬度数据类型string改为float
        dict[fields[3][0]] = int(result[3])  # pUserID数据类型string改为int
        returnedPostscripts.append(dict)
    return jsonify(returnedPostscripts)

@app.route('/WebApplication_Eclipse/api/scenicspot', methods=['GET'])
def get_all_scenicspots():
    returnedScenicspot = []
    cursor = db.cursor()
    sql = "SELECT * FROM scenicspot";
    db.ping(reconnect=True)
    cursor.execute(sql)
    results = cursor.fetchall()
    fields = cursor.description
    db.commit()
    for result in results:
        dict = collections.defaultdict(list)
        for i in range(1,len(fields)):
            dict[fields[i][0]]=result[i]
        dict['SID'] = result[0]  # 数据库第一字段以非法字符开头，避免该情况
        dict[fields[4][0]]=float(result[4])  # 经度数据类型string改为float
        dict[fields[5][0]] = float(result[5])  # 纬度数据类型string改为float
        # 图片数据加载与录入
        filePathDirectory = './data/scenic_img/' + result[6]
        f = open(filePathDirectory, 'rb')
        base64_txt = base64.b64encode(f.read())
        dict['ImageData']= str(base64_txt,'utf-8')
        returnedScenicspot.append(dict)
    return jsonify(returnedScenicspot)

@app.route('/WebApplication_Eclipse/api/postscripts/uploadImage', methods=['POST'])
def post_postscripts_image():
    # to do
    return jsonify({"status": "ok"})

@app.route('/WebApplication_Eclipse/api/worldeclipse/queryInKuafu/<year>/<month>/<day>')
def query_in_kuafu(year, month, day):
    returnedKuafu = []
    year = int(year)
    year1 = year;
    year2 = year+1;
    if (year < 2001):
        year1 = 2001;
        year2 = 2002;
    elif (year > 2100):
        year1 = 2099;
        year2 = 2100;
    db.ping(reconnect=True)
    cursor = db.cursor()
    sql = "SELECT * FROM worldeclipse WHERE Year>={0} AND Year<={1}".format(year1,year2);
    cursor.execute(sql)
    results = cursor.fetchall()
    fields = cursor.description
    db.commit()
    for result in results:
        dict = collections.defaultdict(list)
        for i in range(1, len(fields)):
            dict[fields[i][0]] = result[i]
        dict['ID'] = result[0]  # 数据库第一字段以非法字符开头，避免该情况
        returnedKuafu.append(dict)
    return jsonify(returnedKuafu)

@app.route('/WebApplication_Eclipse/api/eclipsePointInfo/<date>/<lon>/<lat>')
def getPointInfo(date, lon, lat):
    r = requests.get('https://www.timeanddate.com/scripts/astroserver.php',params={
        'mode': 'localeclipsejson',
        'n': '@' + lat + ',' +lon,
        'iso': date,
        'zoom': 5,
        'mobile': 0
    }).json()
    return jsonify(r)

if __name__ == '__main__':
    app.run(debug=True)
