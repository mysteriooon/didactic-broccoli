import psycopg2.extras
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from db import get_db
import db
import db_queries
import lgota_processor

app = Flask(__name__)
db.init_app(app)


@app.route('/')
def hello_world():  # put application's code here
    return render_template("soc_calc.html")


@app.route('/form', methods=['POST'])
def soc_calc_form():
    lgotas = lgota_processor.process(request.form)
    return render_template("soc_calc-form.html", lgotas=lgotas)


@app.route('/form', methods=['GET'])
def soc_calc_form_get():
    return redirect("/", code=302)


@app.route('/registry')
def registry():
    return render_template("registry.html")


@app.route("/dashboard")
def dashboard():
    cursor = get_db().cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    cursor.execute("""
    SELECT coalesce(round(avg(income)), 0) as inc, s
FROM generate_series(20, 70, 10) s
         LEFT JOIN (
    SELECT money.inc                                  as income,
           date_part('year', age(now(), p.birthdate)) as age
    FROM people p
             LEFT JOIN (SELECT MAX(make_date(year := year::integer, month := month::integer, day := 1)),
                               MAX(summary_income) as inc,
                               passport
                        FROM fns
                        GROUP BY passport) as money on money.passport = p.passport
    WHERE p.gender = 1
) as p ON p.age >= s.s AND p.age < s.s + 10
GROUP BY s
ORDER BY s
    """)
    men_stats = cursor.fetchall()

    cursor = get_db().cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    cursor.execute("""
    SELECT coalesce(round(avg(income)), 0) as inc, s
FROM generate_series(20, 70, 10) s
         LEFT JOIN (
    SELECT money.inc                                  as income,
           date_part('year', age(now(), p.birthdate)) as age
    FROM people p
             LEFT JOIN (SELECT MAX(make_date(year := year::integer, month := month::integer, day := 1)),
                               MAX(summary_income) as inc,
                               passport
                        FROM fns
                        GROUP BY passport) as money on money.passport = p.passport
    WHERE p.gender = 0
) as p ON p.age >= s.s AND p.age < s.s + 10
GROUP BY s
ORDER BY s
    """)
    women_stats = cursor.fetchall()

    cursor = get_db().cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    cursor.execute("""
    SELECT count(*) as count, m.lon as lon, m.lat as lat, m.name as name
    FROM people p
             LEFT JOIN (SELECT MAX(make_date(year := year::integer, month := month::integer, day := 1)),
                               MAX(summary_income) as inc,
                               passport
                        FROM fns
                        GROUP BY passport) as money on money.passport = p.passport
            LEFT JOIN municipalities m on m.id = p.municipality_id
    WHERE money.inc < 10465.0
    GROUP BY m.id
    """)
    geo_stats = cursor.fetchall()
    return render_template("dashboard.html",
                           men_stats=men_stats,
                           women_stats=women_stats,
                           geo_stats=geo_stats,
                           total=db_queries.get_poor_count(),
                           gender_stats=db_queries.get_poor_gender_stats())


@app.route("/registry_item")
def registry_item():
    cursor = get_db().cursor(cursor_factory=psycopg2.extras.RealDictCursor)
    age_from = request.args.get('age_from')
    if age_from == None:
        age_from = 0
    else:
        age_from = str(age_from)
    age_to = request.args.get('age_to')
    if age_to == None:
        age_to = 9999
    else:
        age_to = str(age_to)
    gender = request.args.get('gender')
    if gender == None:
        gender = None
    else:
        gender = str(gender)
    municipality = request.args.get('municipality')
    if municipality == None:
        municipality = None
    else:
        municipality = str(municipality)
    req = """SELECT (p.family_name || ' ' || p.first_name || ' ' || p.patronymic) as fio,
       p.snils as snils,
       r.estate as estate,
       pfr.disabled_person as med_disabled,
       pfr.disabled_group as med_group,
       child.children as child_count,
       money.inc as income,
       ((money.inc / (COALESCE(child.children, 0) + 1)) / 10465) as coef,
       date_part('year', age(now(), p.birthdate)) as age
FROM people p
    LEFT JOIN rosregistry r on p.passport = r.passport
    LEFT JOIN pfr on pfr.snils = p.snils
    LEFT JOIN (SELECT count(child_birthcert) as children, parent_passport FROM children GROUP BY parent_passport) as child on child.parent_passport = p.passport
    LEFT JOIN (SELECT MAX(make_date(year := year::integer, month := month::integer, day := 1)), MAX(summary_income) as inc, passport FROM fns GROUP BY passport) as money on money.passport = p.passport
WHERE 
    date_part('year', age(now(), p.birthdate)) > %s AND date_part('year', age(now(), p.birthdate)) < %s
"""

    args = (age_from, age_to)
    if gender != None:
        req += "AND p.gender = %s"
        args += (gender,)
    if municipality != None:
        req += "AND p.municipality_id = %s"
        args += (municipality,)

    cursor.execute(req, args)
    records = cursor.fetchall()
    return render_template("registry_item.html", data=records)


if __name__ == '__main__':
    app.run()
