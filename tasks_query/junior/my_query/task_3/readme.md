# Задача : "Найти дубли клиентов по emai"
Для решения задачи достаточно использовать таблицу CUSTOMERS
![CUSTOMERS COLUMN INFORM](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tables.png/customers_column.png)
![CUSTOMERS TABLE DATA](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tables.png/customers_data.png)
## Ход решения
<p>Для вывода информации о дубликатах (в постановке не указано вывести id клиента или его ФИ) возьмем поле email и стандартную функцию подсчета КОЛИЧЕСТВА - COUNT(email) c GROUP BY и HAVING COUNT(email) > 1</p>
  
![Запрос+вывод результат](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_3/quary_result.png/task_3_result.png)
![Explain plan](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_3/explain_plan.png/task_3_var1_explan.png)

<p>Далее, если мы хотим посмотреть пользователей с одинаковыми email, выведем через CTE 2 запроса и соединим их по равентсву: table1.email = table2.email.</p>

![Вывод ID клиентов](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_3/quary_result.png/task3_var2_result.png)
<p></p>

![Explain plan](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_3/explain_plan.png/task_3_var2_explan.png)

<p><b>Если id клиента поставить в первый запрос(сверху), мы получим количество полей, равное количеству строк ID клиентов(так как id индивидуальный номер и он не группируется в данной таблице).</b></p 
                                                                                                                                                                                   
 ![Testing](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_3/testing/testing_inform_client.png)
 
А с учетом группировки COUNT(email)>1 не выдаст никакого результата.</b></p>.

![Testing](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_3/testing/testing_2.png)

