#  Вывести топ-10 клиентов по сумме покупок
## Ход решения
<p>Для начала создадим вложенный запрос: сгруппируем клиентов и найдем их общую сумму всех покупок</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_8/scripts/images/8_1.png)
<p>Далее создадим второй вложенный вопрос, в котором проранжируем наши данные.</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_8/scripts/images/8_2.png)
</p>Стоит обратить внимание, что у клиентов могут быть одинаковые суммы покупок и чтобы они попали в результатирующий отбор, приходится брать решение для СУБД DB2,PostgreSQL.<p>
</p>Для ORACLE используется функция KEEP с агрегатной функцией, но в этом случае отбрасываются одинаковые вхождения по сумме.<p>
  
![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_8/scripts/images/8_3.png)
<p>Получилось 11 строк, потому что 2 клиента с одной суммой покупок получили 7 ранг</p>
<p>Если надо убрать 11 строку, то применим FETCH FIRST 10 ROWS ONLY</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_8/scripts/images/8_4.png)
![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_8/scripts/images/8_explain_plan.png)
