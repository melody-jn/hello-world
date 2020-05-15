from flask import Response, Flask, request


app = Flask(__name__)


@app.route('/1xx')
def rsp_1xx():
    rsp_code = '100'
    if request.args.get('code') and str.isnumeric(str(request.args.get('code'))) and int(request.args.get('code')) > 99 and int(request.args.get('code')) < 102:
        rsp_code = request.args.get('code')
    return Response("Response Code: {rsp_code}".format(rsp_code=rsp_code), int(rsp_code))


@app.route('/2xx')
def rsp_2xx():
    rsp_code = '200'
    if request.args.get('code') and str.isnumeric(str(request.args.get('code'))) and int(request.args.get('code')) > 199 and int(request.args.get('code')) < 207:
        rsp_code = request.args.get('code')
    return Response("Response Code: {rsp_code}".format(rsp_code=rsp_code), int(rsp_code))


@app.route('/3xx')
def rsp_3xx():
    rsp_code = '300'
    if request.args.get('code') and str.isnumeric(str(request.args.get('code'))) and int(request.args.get('code')) > 299 and int(request.args.get('code')) < 309:
        rsp_code = request.args.get('code')
    return Response("Response Code: {rsp_code}".format(rsp_code=rsp_code), int(rsp_code))


@app.route('/4xx')
def rsp_4xx():
    rsp_code = '400'
    if request.args.get('code') and str.isnumeric(str(request.args.get('code'))) and int(request.args.get('code')) > 399 and int(request.args.get('code')) < 418:
        rsp_code = request.args.get('code')
    return Response("Response Code: {rsp_code}".format(rsp_code=rsp_code), int(rsp_code))


@app.route('/5xx')
def rsp_5xx():
    rsp_code = '500'
    if request.args.get('code') and str.isnumeric(str(request.args.get('code'))) and int(request.args.get('code')) > 499 and int(request.args.get('code')) < 506:
        rsp_code = request.args.get('code')
    return Response("Response Code: {rsp_code}".format(rsp_code=rsp_code), int(rsp_code))


@app.route('/')
def index():
    return Response("alb metrics test", 200)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

