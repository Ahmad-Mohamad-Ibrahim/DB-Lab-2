/*
 * Auther : Ahmed Mohamed 
 *  Date : 23/11/2023
 *
*/

/* 1- Display the employee First name, 
last name, Salary and Department 
number in department 30 whose salary from 1000 to 2000 LE monthly  */

SELECT Fname, Lname, Salary, Dno FROM `employee` WHERE Salary >= 1000 AND Salary <= 2000;


/*
2- Display all the projects names, 
locations and the department number which is managed by it.

*/

SELECT Pname, Pnumber, Plocation, Dnum FROM `project`;

/*
3- If you know that the company policy is to pay an annual commission for each employee which specific percent equals 10% of his/her annual salary .
Display each employee full name and his annual commission in an ANNUAL COMM column (alias).

*/
/* Annual Commision multiply by 12*/
SELECT Fname, Lname, ((employee.Salary * 10 * 12) / 100) AS Commision FROM `employee`;

/*
4- Display the employees Id, fname who earns more than 1000 LE.
*/

SELECT SSN, Fname FROM `employee` WHERE Salary > 1000;

/*
5- Display the names and salaries of the female employees
*/
SELECT Fname, Lname,Salary FROM `employee` WHERE gender = 'F';
/*
6- Display each department id, name which managed by a manager with id equals 968574.
*/
SELECT Dnum, Dname FROM `departments` WHERE MGRSSN = 968574;

/*
7-     7. Display the project id, name and location of  the projects which
 controlled with department 10 or 20, 
and location of the projects in Cairo or Alex city
*/

SELECT Pnumber, Pname, Plocation FROM `project` WHERE 
(Dnum = 10 OR Dnum = 20) AND 
(Plocation LIKE '%Cairo%' OR Plocation LIKE '%Alex%');

/*
8- Display the Projects name, 
locations of the projects with a project name starts with "p" letter.
*/

SELECT Pname, Plocation FROM `project` WHERE Pname LIKE 'p%';

/********************************DDL**********************************************/
/*
1- Create  the dependent table and create the relationship with employee table
Then Insert 3 rows only
*/
    CREATE TABLE `dependent` (
        `ESSN` int(10) NOT NULL DEFAULT 0,
        `Dependent_name` varchar(100) NOT NULL ,  
        `Gender` varchar(50) DEFAULT NULL,
        `Bdate` timestamp(6) NULL DEFAULT NULL,
        PRIMARY KEY (`ESSN` , `Dependent_name`) ,
        CONSTRAINT `emp_fk` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
2- Insert new employee with your personal data, you will be in department number 30, 
your SSN = 666666 & Superssn = 112233.
*/
INSERT  INTO `employee` (`Fname`,`Lname`,`SSN`,`Bdate`,`Address`,`gender`,`Salary`,`Superssn`,`Dno`) 
VALUES ('Ahmed','Mohamed',666666,'2000-03-01 00:00:00.000000','Alexandria - Bab Sharqi','M',4000,112233,30);

/*
3- Insert another employee with personal data your friend as new employee in department 
number 30 , SSN = 555555, but don’t enter any value for salary or manager number to him.
*/

INSERT INTO `employee` (`Fname`,`Lname`,`SSN`,`Bdate`,`Address`,`gender`,`Dno`) 
VALUES ('Osama','Mohamed',555555,'2000-03-01 00:00:00.000000','Alexandria - Montazah','M',30);

/*
4- In the department table insert new department called "DEPT IT" , 
with id 100, MgrSSN = 112233 as a manager for this department. 
The start date for this manager is '08/12/2006'
*/

INSERT  INTO `departments`(`Dname`,`Dnum`,`MGRSSN`,`MGRStart Date`) 
VALUES ('DEPT IT',100,112233,'2006-12-08 00:00:00.000000');

/*
5- Do what is required if you know that : Mrs.Noha Mohamed moved to be the manager of the new department (id = 100), 
and they give her position to your friend
*/

  /*Make New Friend As Manager of Dept 20*/
  UPDATE `departments` SET MGRSSN = (SELECT SSN FROM `employee` WHERE Fname = 'Osama' AND Lname = 'Mohamed') WHERE Dnum = 20;
  
  /* Make Noha Manager*/
  UPDATE `departments` SET MGRSSN = (SELECT SSN FROM `employee` WHERE Fname = 'Noha' AND Lname = 'Mohamed') WHERE Dnum = 100; 
  /* add yourself as a supervisor for him (supervised by you) */
  UPDATE `employee` SET Superssn = (SELECT SSN FROM `employee` WHERE Fname = 'Ahmed' AND Lname = 'Mohamed') WHERE Fname = 'Osama' AND Lname = 'Mohamed'; 


/*
5- Unfortunately the company ended the contract with Mr.Kamel Mohamed so try to delete his data from your database, in case you need, 
 you can be temporary in his position.
*/
/* Make yourself manager */
UPDATE `employee` SET Superssn = (SELECT Superssn WHERE Fname = 'Ahmed' AND Lname = 'Mohamed') WHERE Superssn = 223344;

/* Update your salary */
UPDATE `employee` SET Salary = Salary + ((Salary * 20)/100) WHERE SSN = 666666;

/* Delete Kamel Mohamed*/
UPDATE `employee` SET Dno = NULL, Superssn = NULL WHERE Fname = 'Kamel' AND Lname = 'Mohamed';
DELETE FROM `works_for` WHERE ESSN = (SELECT SSN FROM `employee` WHERE Fname = 'Kamel' AND Lname = 'Mohamed' );
DELETE FROM `employee` WHERE Fname = 'Kamel' AND Lname = 'Mohamed'; 