# R-and-SQL
Implementation of R and SQL
<body>
    <h1>Assignment 5</h1>
    <h2>Ananya</h2>
    <h3>20013004</h3>
<body></body>

<h2>1. Querying Multiple Tables </h2>

<h3>1. Import data from banks sec 2002 and banks al 2002. Delete duplicate rows from banks sec 2002</h3>
    <p>Used pgAdmin to import data from these tables into your PostgreSQL database and delete rows using a CTE table and delete command.</p>

 <h3>2. Select proper join manner to join banks sec 2002 and banks al 2002.</h3>
    <p>Make sure that all data from banks sec 2002 are kept in the joint table. Report the first 10 observations.</p>
    <p>Using a LEFT JOIN on ID to keep all the data from bank_sec.</p>

<h3>3. Create a new table banks total.</h3>
    <p>Insert the values from previous joint table into this new one and set a primary key for the table.</p>
    <p>Creating a new table with total_id as serial number and setting it as a primary key, including all the columns in the table.</p>

<h3>4. For each quarter of the year 2002 count how many banks have security over 20% of its asset.</h3>
    <p>Extracting the quarters from the date using EXTRACT.</p>
    <p>Using the formula security/asset to count the number of banks whose security rate is greater than 20%.</p>

<h3>5. How many banks have liability over 90% of assets in the first quarter of 2002 but go below 90% in the second quarter of 2002?</h3>
    <p>Creating 2 temporary tables for 2 quarters and joining them to get the combined result.</p>

 <h3>6. Export the joint table (banks total) to a CSV file.</h3>
    <p>Using the built-in option to extract the CSV file of the Bank_total.</p>

 <h2>2. PostgreSQL API in R </h2>

 <h3>1. Make a connection to your local PostgreSQL database using API.</h3>
    
 <h3>2. Import the CSV file you got from Problem 1 (banks total) into a new table in the database using API.</h3>
    <p>(Hint: Please give the table a new name if table ‘banks total‘ exists in the database).</p>

 <h3>3. Retrieve the data of table ‘banks total‘ using API.</h3>
    <p>Count how many rows are in the table.</p>
    <p>Made a local connection with the SQL database and checked if the table exists.</p>
    <p>Stored all the data in a query and counted the number of rows in the result.</p>
    <p>Printed the result.</p>
</body>
