def process(form):
    ret = []
    try:
        if int(form['revenue']) < 10465 and int(form['child']) < 1:
            ret.append(
                {'name': 'Материальная помощь в трудной жизненной ситуации', 'desc': 'Малоимущие одиноко проживающие'})
    except ValueError:
        pass
    if "health_pregnant" in form and form['health_pregnant'] == 'true':
        ret.append(
            {'name': 'Единовременное пособие беременным', 'desc': 'Для безработных женщин'})
    if "health_disability" in form and form['health_disability'] == 'true':
        ret.append(
            {'name': ' Льготы инвалидам на лекарства', 'desc': 'Инвалиды I группы; неработающие инвалиды II группы'})
    if "health_disease" in form and form['health_disease'] == 'true':
        ret.append(
            {'name': 'Льготные лекарства', 'desc': 'Системные хронические тяжелые заболевания кожи'})
    return ret
