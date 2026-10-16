# Посчитать долю каждой категории в общей выручке
## Ход решения
<p>Для начала вычислим общую сумму покупок по всем категориям и сумму покупок по каждой категории.</p>
<p>Это будет находится во вложенном запросе. Применим оконную функцию sum() over()</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_7/images/7_1.png)
<p>Во внешнем запросе вычисляем %-ую долю каждой категории от общей суммы покупок по формуле: (SUM_категории/SUM_общая)* 100 </p>
<p>Применяем функцию ROUND для округления до 2 знаков после запятой</p>

![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/junior/my_query/task_7/images/7_2.png)
