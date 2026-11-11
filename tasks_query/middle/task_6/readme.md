# Построить иерархию сотрудников: уровень, путь от руководителя.
<p>Для решения этой задачи применим CONNECT BY, а затем отформатируем вывод требуемым образом с помощью функции SYS_CONNECT_BY_PATH.</p>
<p>Результатирующую выборку отфильтруем по псевдостолбцу LEVEL</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/middle/task_6/images/tree_emp_injob.png)
<p>Я дополнила вывод с иерархией по отделам в соотвествии иерархии подчинения (ФИ) сотрудников</p>
<p>Полный вывод в в файле:
  
  [View raw](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/middle/task_6/records/all_rows_result.xlsx)
</p>
![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/middle/task_6/images/result.png)

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/middle/task_6/images/expl_plan.png)
