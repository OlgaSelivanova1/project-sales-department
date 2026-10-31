## Найти топ-3 товара по выручке внутри каждой категории.
Так как период, за который надо учитывать самые крупные по выручке товары, не указан, ,не ограничиваемся в датах продажи.
![](https://github.com/OlgaSelivanova1/project-sales-department/blob/main/tasks_query/middle/task_9/img/quary_result.png)
<dl>
<dt>Для начала создадим базовый(внутренний запрос), в котором:</dt>
<dd>
  <li>вычислим сумму по каждому проданному товару в каждой категории</li>
<li>Проранжируем товары внутри каждой категории
  <p>ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY SUM(amount) DESC) rwn</p>
  <p>Шаги:</p>
<ul>
  <li>Используем оконную функцию ROW_NUMBER
  <li>отсортируем сумму по каждому товару в порядке убывания (DESC)</li>
<li>В PARTITION BY сгруппировать только категорию</li>
</ul>
<li>Сгруппируем товары в категориях и сами категории</li>
</dd>
<p>SELECT SUM(amount) sum_amount,category_id, product_id</p>
           <p> ,ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY SUM(amount) DESC) rwn</p>
<p>FROM sales</p>
<p>GROUP BY category_id, product_id</p>
</dl>
<dl>
  <dt>
Во внешнем (итоговом запросе) выведем:
  </dt>
  <li>категорию, продукт, сумму</li>
  <li>Укажем rwn <=3, чтобы попадало не более 3 товаров в каждой категории(товаров может быть меньше 3 продано)</li>
    <li>Отсортируем по убыванию суммы</li>
</dl>
