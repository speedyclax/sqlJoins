/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select products.name as Product, categories.name as Category from products
left join categories
on products.CategoryID = categories.CategoryID
where products.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.name, products.price, reviews.rating from products
left join reviews
on products.ProductID = reviews.ProductID
where rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, employees.LastName, Sum(sales.Quantity) as TotalSales from sales
left join employees on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID order by TotalSales desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.name as 'Department Name', categories.name as 'Categories Name' from departments
left join categories on departments.DepartmentID = categories.DepartmentID
where categories.name = 'Appliances' or categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select Name, sum(sales.Quantity) as 'Total Sold', sum(sales.Quantity * products.Price) as 'Total Price Sold' from products
 left join sales 
 on products.ProductID = sales.ProductID
 where products.name like '%hotel%';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment from products
left join reviews on products.ProductID = reviews.ProductID
where products.name = 'Visio TV' and reviews.rating = 1;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.name as Product, sum(s.Quantity) as 'Total Sold' from employees e
inner join sales s on s.EmployeeID = e.EmployeeID
inner join products p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.EmployeeID;

