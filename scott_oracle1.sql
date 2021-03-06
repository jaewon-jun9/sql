SELECT * FROM emp WHERE sal<=1500;
SELECT empno,ename,sal from emp WHERE ename='FORD';
SELECT * from emp WHERE ename='FORD';
SELECT empno,ename,sal from emp WHERE ename='SCOTT';
SELECT * FROM emp WHERE hiredate >= '1982/01/01';
SELECT * FROM emp WHERE hiredate <= '1982/01/01';
SELECT * FROM emp WHERE deptno = 10 and job ='MANAGER';
SELECT * FROM emp WHERE not deptno = 10;
SELECT * FROM emp WHERE deptno <> 10;
SELECT * FROM emp WHERE sal >= 2000 and sal <=3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 and 3000;
SELECT * FROM emp WHERE sal not BETWEEN 2000 and 3000;
SELECT * FROM emp WHERE hiredate not BETWEEN '1987/01/01' and '1987/12/31';
SELECT * FROM emp WHERE hiredate BETWEEN '1987/01/01' and '1987/12/31';
SELECT * FROM emp WHERE comm=300 or comm=500 or comm=1400;
SELECT * FROM emp WHERE comm in(300,500,1400);
SELECT empno,sal FROM emp WHERE empno in(7521,7654,7844);
SELECT * FROM emp WHERE comm not in(300,500,1400);
SELECT empno,ename FROM emp WHERE empno not in(7521,7654,7844);
SELECT * FROM emp WHERE ename LIKE 'S%';
SELECT * FROM emp WHERE ename LIKE 'J%';
SELECT * FROM emp WHERE ename LIKE '%A%';
SELECT * FROM emp WHERE ename LIKE '%N';
SELECT * FROM emp WHERE ename LIKE '_A%';
SELECT * FROM emp WHERE ename LIKE '__A%';
SELECT * FROM emp WHERE ename not LIKE '%A%';
SELECT * FROM emp WHERE comm=NULL;
SELECT comm from emp;
SELECT * FROM emp WHERE comm is NULL;
SELECT * FROM emp WHERE comm is not NULL;
SELECT * FROM emp WHERE mgr is not NULL;
SELECT * FROM emp WHERE mgr is NULL;
SELECT * FROM emp order by sal asc;
SELECT * FROM emp order by sal DESC;
SELECT * FROM emp order by ename DESC;
SELECT * FROM emp order by ename;
SELECT * FROM emp order by hiredate;
SELECT * FROM emp order by hiredate desc;

