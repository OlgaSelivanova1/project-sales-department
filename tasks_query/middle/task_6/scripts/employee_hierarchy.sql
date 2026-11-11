/*ѕостроить иерархию сотрудников: уровень, путь от руководител€.
¬ отчет будем включать только текущих (активных) сотрудников.
«адача на выражение отношений потомок-родитель-прародитель*/
WITH inform_emp AS 
       ( SELECT 
       /*¬ыберем вспомогательные и основные столбцы дл€ возможности тестить выборку данных*/
        emp.employee_id
        ,(emp.first_name||' '||emp.last_name) AS name_employee
        ,emp.job_id,manager_id
         ,jobs.job_title
from employees emp
join jobs
on emp.job_id = jobs.job_id
)
,tree_jobs AS
     (SELECT LTRIM(SYS_CONNECT_BY_PATH(name_employee,' - '), ' - ') AS emp_tree
                 ,LTRIM(SYS_CONNECT_BY_PATH(job_title,' - '), ' - ')AS job_tree
                ,(LEVEL) qnt_empl_jbs--укажем количество подчин€емых сотрудников(по каждому отделу)
    FROM inform_emp
    --чтобы начать дерево иерархии с руководител€, укажем сотрудника,у которого нет начальника
    START WITH manager_id IS NULL
    --укжем взаимосв€зь и с помощью prior обратимс€ к предыдущей записи иерархии
    CONNECT BY PRIOR employee_id = manager_id
    --сортировка на уровне соседних записей внутри иерархии
    ORDER SIBLINGS BY name_employee ASC
)
SELECT emp_tree,job_tree,qnt_empl_jbs
FROM tree_jobs;
