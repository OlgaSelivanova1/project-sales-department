# Найти клиентов, которые не совершали покупок последние N дней
За n-дней возьмем - 30 дней
## Разбивка задачи
Для начала вычислим последние 30 дней используя стандартный оператор вычитания
![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_6/images/6_1.png)
<p>Далее, проверим, кто совершил покупки в эти дни(период)</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_6/images/6_2.png)
<p>Теперь выведем всех клиентов из таблицы customers</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_6/images/6_3.png)

<p>Теперь объединим запросы в единый, задав проверку на существование NOT EXISTS и найдем клиентов, которые не входят в заданный период(не совершали покупок).</p>
<p>Так как они не совершали покупок в этот отрезок, нет смысла пытаться вывести поле с датами. Для этого есть первый код.</p>
<p>Можно вывести дополнительную информацию о клиентах, например (*) или ник, емэйл, телефон </p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_6/images/6_4.png)
