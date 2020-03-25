from flask import Flask
from flask import url_for, escape, render_template
from flask_sqlalchemy import SQLAlchemy
import os
import sys
import click
from flask import request, url_for, redirect, flash
import datetime as dt
import pandas as pd
from twitterscraper import query_tweets

WIN = sys.platform.startswith('win')
if WIN:  # 如果是 Windows 系统，使用三个斜线
    prefix = 'sqlite:///'
else:  # 否则使用四个斜线
    prefix = 'sqlite:////'


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////' + os.path.join(app.root_path, 'data.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'dev'  # 等同于 app.secret_key = 'dev'
db = SQLAlchemy(app)


@app.cli.command()  # 注册为命令
@click.option('--drop', is_flag=True, help='Create after drop.')  # 设置选项
def initdb(drop):
    """Initialize the database."""
    if drop:  # 判断是否输入了选项
        db.drop_all()
    db.create_all()
    click.echo('Initialized database.')  # 输出提示信息


@app.cli.command()
def forge():
    """Generate fake data."""
    db.create_all()

    # 全局的两个变量移动到这个函数内
    tweets = [{'text': ''}]

    for t in tweets:
        tweet = Tweet(text=t['text'])
        db.session.add(tweet)

    db.session.commit()
    click.echo('Done.')


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':  # 判断是否是 POST 请求
        keyword = request.form.get('keyword')  # 传入表单对应输入字段的 name 值

        begin_year = request.form.get('begin_year')
        begin_month = request.form.get('begin_month')
        begin_day = request.form.get('begin_day')

        end_year = request.form.get('end_year')
        end_month = request.form.get('end_month')
        end_day = request.form.get('end_day')

        tweet_texts = search_filter(keyword, int(begin_year), int(begin_month), int(begin_day),
                                    int(end_year), int(end_month), int(end_day))

        # 保存表单数据到数据库
        for tweet_text in tweet_texts:
            tweet = Tweet(text=tweet_text)
            db.session.add(tweet)


        db.session.commit()  # 提交数据库会话
        flash('Item created.')  # 显示成功创建的提示
        return redirect(url_for('index'))  # 重定向回主页

    tweets = Tweet.query.all()
    return render_template('index.html', tweets=tweets)


class Tweet(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.Text)


def search_filter(keyword, begin_year, begin_month, begin_day, end_year, end_month, end_day):

    tweets = query_tweets(keyword, begindate=dt.date(begin_year, begin_month, begin_day),
                          enddate=dt.date(end_year, end_month, end_day), limit=10, lang='english')

    df = pd.DataFrame(t.__dict__ for t in tweets)

    df.to_pickle('{}.pkl'.format(keyword))

    df = pd.read_pickle('{}.pkl'.format(keyword))

    return df['text']
