/****** Скрипты для выборки по контрольным правилам  ******/
/* выборка всего зоопарка */
select an.Animal_Name, p.Proper_Name as 'Вес', p2.Proper_Name as 'Рост', p3.Proper_Name as 'Тип'
from Zoo z,Zoo z2,Zoo z3,Animal an, Propertis p,Propertis p2,Propertis p3
where (an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and p.Atribut_ID = 1) and
	  (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID = 2 ) and
	  (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Atribut_ID = 3)
select an.Animal_Name+','+ p.Proper_Name+','+ p2.Proper_Name+','+ p3.Proper_Name
from Zoo z,Zoo z2,Zoo z3,Animal an, Propertis p,Propertis p2,Propertis p3
where (an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and p.Atribut_ID = 1) and
    (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID = 2 ) and
    (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Atribut_ID = 3)

/*Rule: (травоядное) count: 5 */
select an.Animal_Name, p.Proper_Name as 'Вес', p2.Proper_Name as 'Рост', p3.Proper_Name as 'Тип'
from Zoo z,Zoo z2,Zoo z3,Animal an, Propertis p,Propertis p2,Propertis p3
where (an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and p.Atribut_ID = 1) and
	  (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID = 2 ) and
	  (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Proper_Name='травоядное')

/*Rule: (травоядное|плотоядное,маленькое) count: 2*/
select an.Animal_Name, p.Proper_Name as 'Вес', p2.Proper_Name as 'Рост', p3.Proper_Name as 'Тип'
from Zoo z,Zoo z2,Zoo z3,Animal an, Propertis p,Propertis p2,Propertis p3
where (an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and  p.Atribut_ID = 1) and
	  (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID=2 and p2.Proper_Name in ('маленькое') ) and
	  (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Atribut_ID=3 and p3.Proper_Name in ('плотоядное','травоядное'))

/*Rule: (всеядное,^высокое) count: 2 */
select an.Animal_Name, p.Proper_Name as 'Вес', p2.Proper_Name as 'Рост', p3.Proper_Name as 'Тип'
from Zoo z,Zoo z2,Zoo z3,Animal an, Propertis p,Propertis p2,Propertis p3
where ((an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and  p.Atribut_ID = 1) and
	  (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID=2 and p2.Proper_Name != 'высокое') and 
	  (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Atribut_ID=3 and p3.Proper_Name='всеядное'))

/*Rule: (травоядное|плотоядное,маленькое)(тяжелое, высокое) count: 4 */
select an.Animal_Name, p.Proper_Name as 'Вес', p2.Proper_Name as 'Рост', p3.Proper_Name as 'Тип'
from Zoo z,Zoo z2,Zoo z3,Animal an, Propertis p,Propertis p2,Propertis p3
where ((an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and  p.Atribut_ID = 1 and p.Proper_Name='тяжелое') and
	  (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID=2 and p2.Proper_Name = 'высокое') and 
	  (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Atribut_ID=3)) or
	  ((an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and  p.Atribut_ID = 1) and
	  (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID=2 and p2.Proper_Name = 'маленькое') and 
	  (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Atribut_ID=3 and p3.Proper_Name in ('травоядное','плотоядное')))

/*Rule: (^высокое) count: 7 */
select an.Animal_Name, p.Proper_Name as 'Вес', p2.Proper_Name as 'Рост', p3.Proper_Name as 'Тип'
from Zoo z,Zoo z2,Zoo z3,Animal an, Propertis p,Propertis p2,Propertis p3
where ((an.Animal_ID=z.Animal_ID and z.Proper_ID=p.Proper_ID and  p.Atribut_ID = 1) and
	  (an.Animal_ID=z2.Animal_ID and z2.Proper_ID=p2.Proper_ID and p2.Atribut_ID=2 and p2.Proper_Name != 'высокое') and 
	  (an.Animal_ID=z3.Animal_ID and z3.Proper_ID=p3.Proper_ID and p3.Atribut_ID=3))

	  /* С использованием таблицы Features*/
select an.Animal_Name+','+f.Features_Name
from Animal an, Features f
where an.Animal_ID=f.Animal_ID

/*Rule: (травоядное) count: 5 */
select an.Animal_Name, f.Features_Name
from Animal an, Features f
where an.Animal_ID=f.Animal_ID and f.Features_Name LIKE '%травоядное%' 

/*Rule: (травоядное|плотоядное,маленькое) count: 2*/
select an.Animal_Name, f.Features_Name
from Animal an, Features f
where an.Animal_ID=f.Animal_ID and 
	((f.Features_Name LIKE '%травоядное%') or
	(f.Features_Name LIKE '%плотоядное%')) and
	(f.Features_Name LIKE '%маленькое%') 

/*Rule: (всеядное,^высокое) count: 2 */
select an.Animal_Name, f.Features_Name
from Animal an, Features f
where an.Animal_ID=f.Animal_ID and 
	(f.Features_Name LIKE '%всеядное%') and 
	(f.Features_Name NOT LIKE '%,высокое%')     

/*Rule: (травоядное|плотоядное,маленькое)(тяжелое, высокое) count: 4 */
select an.Animal_Name, f.Features_Name
from Animal an, Features f
where an.Animal_ID=f.Animal_ID and 
	((((f.Features_Name LIKE '%травоядное%') or (f.Features_Name LIKE '%плотоядное%')) and (f.Features_Name LIKE '%маленькое%')) or
	(f.Features_Name LIKE '%тяжелое%' and f.Features_Name LIKE '%,высокое%'))

/*Rule: (^высокое) count: 7 */
select an.Animal_Name, f.Features_Name
from Animal an, Features f
where an.Animal_ID=f.Animal_ID and 
	(f.Features_Name NOT LIKE '%,высокое%')  