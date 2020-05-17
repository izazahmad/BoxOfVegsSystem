
**Queries for sql server:

create database boxofvegsDB

use boxofvegsDB

create table categories
(
  categoryID int not null identity primary key,
  categoryName varchar(50) not null unique,
  description varchar(500),
  imageUrl nvarchar(500)
)
create table products
(
  productID int not null identity primary key,
  productName varchar(50) not null unique,
  description varchar(500),
  imageUrl nvarchar(500),
  quantity int
  purchasedPrice decimal(18,2),
  profitPercentage int,
  discount int,
  sellingPrice decimal(18,2),
  categoryID int not null foreign key references categories (categoryID)
)
create table userDetails
(
  userDetailID int not null identity primary key,
  userID (nvarchar(128) not null unique,
  firstName varchar(50) not null,
  lastName varchar(50) not null,

)
create table invoices
(
invoiceID int not null primary key identity,
userDetailID int not null foreign key references userDetails(userDetailID),
date datetime not null,
address nvarchar(500) not null,
city nvarchar(500) not null,
postCode nvarchar(20) not null,
PhoneNo varchar(15) not null

)

create table orders
(
orderID int not null primary key identity,
invoiceID int not null foreign key references invoices(invoiceID),
productID int not null foreign key references products (productID),
quantity int not null,
soldUnitPrice decimal(18,2) not null,
soldUnitDiscount int
) 
create table userReviews
(
	userReviesID int not null identity primary key,
	review nvarchar(500),
	rating float,
	reviewDate datetime not null,
	productID int not null foreign key references products (productID),
	userID int not null foreign key references users (userID)
)
create table suppliers
(
	supplierID int not null identity primary key,
	companyName varchar (50) not null,
	contactPerson varchar(50),
	address nvarchar(500) not null,
	city nvarchar(500) not null,
    postCode nvarchar(20) not null,
    PhoneNo varchar(15) not null,
	email nvarchar(500) not null unique
)
create table purchases
(
	purchaseID int not null identity primary key,
	purchaseDate datetime not null,
	supplierID int not null foreign key references suppliers (supplierID),
	userID int not null foreign key references users (userID)
)
create table purchasedProducts
(
	purchasedProductID int not null identity primary key,
	purchaseID int not null foreign key references purchases (purchaseID),
	productID int not null foreign key references products (productID),
	quantity int not null,
	purchasedPrice decimal(18,2)
)


**After Creating Database in SQL Server Change Server name in Connection string:
There is Two connection string one is name with “DefaultConnection” which create database for identity framework user management.
Other is name with “boxofvegsDBEntities” that’s connect the database which is mention above.
There is severname “Izaz/SQLEXPRESS” change with your sql server name in both connection string.
<connectionStrings>
    <add name="DefaultConnection" connectionString="Data Source=Izaz\SQLEXPRESS;initial catalog=boxofvegsDB;Integrated Security=True" providerName="System.Data.SqlClient" />
    <add name="boxofvegsDBEntities" connectionString="metadata=res://*/Models.BOVModel.csdl|res://*/Models.BOVModel.ssdl|res://*/Models.BOVModel.msl;provider=System.Data.SqlClient;provider connection string=&quot;data source=Izaz\SQLEXPRESS;initial catalog=boxofvegsDB;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;" providerName="System.Data.EntityClient" />
</connectionStrings>

**After changing server name build(ctrl + B) the code and go in “Solution Explorer -> Models -> BOVModel.edmx “ and right click and click on “Update Model From Database” and save the code 
**When Code is being debugged(F5), it creates admin username and password and role which is configured in Startup.cs
Username: admin@admin.com
Password: Administration

