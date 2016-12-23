create table video_genre (
	genre_id INTEGER not null,
	name VARCHAR(30) UNIQUE,
	 primary key(genre_id)
);
create table video_director (
	director_id INTEGER not null,
	fname VARCHAR(30),
	lname VARCHAR(30),
	dob DATE,
	 primary key(director_id),
);
create table video_film (
	film_id INTEGER not null,
	name VARCHAR(100) not null,
	director_id INTEGER not null,
	year INTEGER,
	continue VARCHAR(13),
	country VARCHAR(50),
	age_limit char(3),
	reiting real,
	oskar CHAR,
	 primary key(film_id),
	 constraint check_oskar_2 check(oskar in ('y', 'n')),
	 constraint for_key_director_id foreign key (director_id) references video_director on delete cascade
);
create table video_actor (
	actor_id INTEGER not null,
	fname VARCHAR(30),
	lname VARCHAR(30),
	dob DATE,
	oskar CHAR,
	 primary key(actor_id),
	 constraint check_oskar_3 check(oskar in ('y', 'n'))
);
create table video_prodazhi (
	sale_id INTEGER not null,
	film_id INTEGER not null,
	buyer CHAR not null,
	chislo_of_buyer INTEGER not null,
	amount_of_money INTEGER not null,
	dos DATE,
	 primary key(sale_id),
	 constraint check_buyer check(buyer in ('p', 'c')),
	 constraint for_key_film_id_2 foreign key (film_id) references video_film on delete cascade
);
create table video_actor_film (
	film_id INTEGER not null,
	actor_id INTEGER not null,
	main_role CHAR(3) not null,
	name_of_role VARCHAR(50),
	constraint check_main_role check(main_role in ('yes', 'no')),
	constraint for_key_film_id foreign key (film_id) references video_film on delete cascade,
	constraint for_key_actor_id foreign key (actor_id) references video_actor on delete cascade,
	primary key (film_id, actor_id)
);
create table video_genre_film (
	film_id INTEGER not null,
	genre_id INTEGER not null,
	constraint for_key_film_id_3 foreign key (film_id) references video_film on delete cascade,
	constraint for_key_genre_id foreign key (genre_id) references video_genre on delete cascade,
	primary key (film_id, genre_id)
);

ALTER TABLE video_actor MODIFY oskar NULL;
ALTER TABLE video_film MODIFY oskar NULL;

create INDEX my_index ON video_actor (fname, lname);

create SYNONYM movies FOR video_film;

CREATE SEQUENCE film_seqq
INCREMENT BY 1
START WITH 1
NOCACHE;

film_seq.NEXTVAL;

INSERT INTO video_genre VALUES (1,'аниме');
INSERT INTO video_genre VALUES (2,'биографический');
INSERT INTO video_genre VALUES (3,'боевик');
INSERT INTO video_genre VALUES (4,'вестерн');
INSERT INTO video_genre VALUES (5,'военный');
INSERT INTO video_genre VALUES (6,'детектив');
INSERT INTO video_genre VALUES (7,'детский');
INSERT INTO video_genre VALUES (8,'документальный');
INSERT INTO video_genre VALUES (9,'драма');
INSERT INTO video_genre VALUES (10,'исторический');
INSERT INTO video_genre VALUES (11,'кинокомикс');
INSERT INTO video_genre VALUES (12,'концерт');
INSERT INTO video_genre VALUES (13,'короткометражный');
INSERT INTO video_genre VALUES (14,'криминал');
INSERT INTO video_genre VALUES (15,'мелодрама');
INSERT INTO video_genre VALUES (16,'мистика');
INSERT INTO video_genre VALUES (17,'музыка');
INSERT INTO video_genre VALUES (18,'мультфильм');
INSERT INTO video_genre VALUES (19,'мюзикл');
INSERT INTO video_genre VALUES (20,'научный');
INSERT INTO video_genre VALUES (21,'приключения');
INSERT INTO video_genre VALUES (22,'реалити-шоу');
INSERT INTO video_genre VALUES (23,'семейный');
INSERT INTO video_genre VALUES (24,'спорт');
INSERT INTO video_genre VALUES (25,'ток-шоу');
INSERT INTO video_genre VALUES (26,'триллер');
INSERT INTO video_genre VALUES (27,'ужасы');
INSERT INTO video_genre VALUES (28,'фантастика');
INSERT INTO video_genre VALUES (29,'фильм-нуар');
INSERT INTO video_genre VALUES (30,'фэнтези');

INSERT INTO video_director VALUES (film_seqq.NEXTVAL,'Алехандро','Г. Иньяритту','08.15.1963');
INSERT INTO video_director VALUES (2,'Уэс','Андерсон','05.01.1969');
INSERT INTO video_director VALUES (3,'Мортен','Тильдум','05.19.1967');
INSERT INTO video_director VALUES (4,'Альфонсо','Куарон','11.28.1961');
INSERT INTO video_director VALUES (5,'Мартин','Скорсезе','11.17.1942');
INSERT INTO video_director VALUES (6,'Джеймс','Кэмерон','08.16.1954');
INSERT INTO video_director VALUES (7,'Кевин','Костнер','01.18.1955');
INSERT INTO video_director VALUES (8,'Майк','Митчелл','10.18.1970');
INSERT INTO video_director VALUES (9,'Крис','Рено','');
INSERT INTO video_director VALUES (10,'Стивен','Спилберг','18/12/1946');
INSERT INTO video_director VALUES (11,'Питер','Джексон','31/10/1961');
INSERT INTO video_director VALUES (12,'Тим','Бёртон','25/08/1958');
INSERT INTO video_director VALUES (13,'Ридли','Скотт','30/11/1937');
INSERT INTO video_director VALUES (14,'Кристофер','Нолан','30/07/1970');


INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Выживший',1,'2015',INTERVAL '02:36' HOUR TO MINUTE,'Гонконг','18','7.8','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Отель "Гранд Будапешт"',2,'2014',INTERVAL '01:40'HOUR TO MINUTE,'Германия','16','7.8','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Игра в имитацию',3,'2014',INTERVAL '01:54'HOUR TO MINUTE,'Великобритания','12','7.59','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Бёрдмэн',1,'2014',INTERVAL '01:59'HOUR TO MINUTE,'США','16','7.58','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Гравитация',4,'2013',INTERVAL '01:30'HOUR TO MINUTE,'Великобритания','12','7.5','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Волк с Уолл-стрит',5,'2013',INTERVAL '03:01'HOUR TO MINUTE,'США','18','7.84','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Титаник',6,'1997',INTERVAL '03:14'HOUR TO MINUTE,'США','12','8.4','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Танцующий с волками',7,'1990',INTERVAL '03:56'HOUR TO MINUTE,'США','16','8.1','y');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Тролли',8,'2016',INTERVAL '01:32'HOUR TO MINUTE,'США','6','7.0','n');
INSERT INTO video_film VALUES (film_seqq.NEXTVAL,'Тайная жизнь домашних животных',9,'2016',INTERVAL '01:27'HOUR TO MINUTE,'Япония','6','8.3','n');

INSERT INTO video_actor VALUES (1,'Кевин','Костнер','','Джон Джей Данбар');
INSERT INTO video_actor VALUES (2,'Грэхем','Грин','','');
INSERT INTO video_actor VALUES (3,'Мэри','Макдонелл','','');
INSERT INTO video_actor VALUES (4,'Том','Эверет','','');
INSERT INTO video_actor VALUES (5,'Леонардо','Ди Каприо','','y');
INSERT INTO video_actor VALUES (6,'Том','Харди','','');
INSERT INTO video_actor VALUES (7,'Рэйф','Файнс','','');
INSERT INTO video_actor VALUES (8,'Билл','Мюррей','','');
INSERT INTO video_actor VALUES (9,'Марко','Дирлич','','');
INSERT INTO video_actor VALUES (10,'Джастин','Тимберлейк','','');

INSERT INTO video_actor_film VALUES (21,1,'yes','');
INSERT INTO video_actor_film VALUES (21,2,'yes','');
INSERT INTO video_actor_film VALUES (21,3,'yes','');
INSERT INTO video_actor_film VALUES (21,4,'no','');
INSERT INTO video_actor_film VALUES (13,5,'yes','Хью Гласс');
INSERT INTO video_actor_film VALUES (13,6,'yes','Джон Фицджеральд');
INSERT INTO video_actor_film VALUES (14,7,'yes','Месье Густав');
INSERT INTO video_actor_film VALUES (14,8,'no','Солдат №1');

INSERT INTO video_genre_film VALUES (21,9);
INSERT INTO video_genre_film VALUES (21,4);
INSERT INTO video_genre_film VALUES (21,21);
INSERT INTO video_genre_film VALUES (13,9);
INSERT INTO video_genre_film VALUES (13,21);
INSERT INTO video_genre_film VALUES (13,26);
INSERT INTO video_genre_film VALUES (14,21);
INSERT INTO video_genre_film VALUES (14,6);
INSERT INTO video_genre_film VALUES (14,11);

INSERT INTO video_prodazhi VALUES (1,13,'p','2','100','01/01/2016');
INSERT INTO video_prodazhi VALUES (2,23,'c','10','24900','07/25/2016');
INSERT INTO video_prodazhi VALUES (3,22,'c','15','15000','08/01/2016');
INSERT INTO video_prodazhi VALUES (4,14,'p','1','230','12.01.2014');
INSERT INTO video_prodazhi VALUES (5,16,'c','2','123','05/05/2015');
INSERT INTO video_prodazhi VALUES (6,16,'p','115','2294','06/06/2013');
INSERT INTO video_prodazhi VALUES (7,13,'c','5','1456','03/06/2015');
INSERT INTO video_prodazhi VALUES (8,21,'p','189','4000','01/01/2010');
INSERT INTO video_prodazhi VALUES (9,21,'c','34','10985','01/01/2010');
INSERT INTO video_prodazhi VALUES (10,18,'p','490','56000','04/03/2014');
INSERT INTO video_prodazhi VALUES (11,19,'c','13','146','04/03/2014');
INSERT INTO video_prodazhi VALUES (12,20,'c','156','240000','03/04/2000');
INSERT INTO video_prodazhi VALUES (13,21,'c','20','37892','08/03/2000');
INSERT INTO video_prodazhi VALUES (14,22,'c','3','1500','06/24/2013');
INSERT INTO video_prodazhi VALUES (15,13,'p','1','50','11/29/2016');

------------------------------------------------------------------------------

create or replace procedure FilmMainRole IS
pFilm video_film.name%Type;
pDirFirstName video_director.fname%Type;
pDirLastName video_director.lname%Type;
pNameOfRole video_actor_film.name_of_role%Type;
BEGIN
select name, dir_fname, dir_lname, name_of_role
INTO pFilm, pDirFirstName, pDirLastName, pNameOfRole
FROM
(select fd.name, fd.fname as dir_fname, fd.lname as dir_lname, far.fname as actor_fname, far.lname as actor_lname, far.main_role, far.name_of_role
from
(select a.film_id, a.name, a.director_id, b.fname, b.lname 
from
(select film_id, name, director_id from video_film) a
full JOIN 
(select director_id, fname, lname from video_director) b
ON a.director_id = b.director_id) fd
FULL JOIN
(select c.film_id, c.actor_id, c.main_role, c.name_of_role, d.fname, d.lname from
(select * from video_actor_film) c
left Join
(select * from video_actor) d
ON c.actor_id=d.actor_id) far
ON fd.film_id=far.film_id)
WHERE
dir_fname=actor_fname and dir_lname=actor_lname;
dbms_output.put_line('Фильм "'||pFilm||'". Режиссёр и исполнитель главной роли: '||pDirFirstName||' '||pDirLastName||'. Роль: '||pNameOfRole);
END FilmMainRole;​​​​​​​​​​

---------------------------------------------------------------------

create or replace procedure FilmMainRole IS
exp_badfilmid EXCEPTION;
cursor cursor_film IS
select name, dir_fname, dir_lname, name_of_role
FROM
(select fd.name, fd.fname as dir_fname, fd.lname as dir_lname, far.fname as actor_fname, far.lname as actor_lname, far.main_role, far.name_of_role
from
(select a.film_id, a.name, a.director_id, b.fname, b.lname 
from
(select film_id, name, director_id from video_film) a
full JOIN 
(select director_id, fname, lname from video_director) b
ON a.director_id = b.director_id) fd
FULL JOIN
(select c.film_id, c.actor_id, c.main_role, c.name_of_role, d.fname, d.lname from
(select * from video_actor_film) c
left Join
(select * from video_actor) d
ON c.actor_id=d.actor_id) far
ON fd.film_id=far.film_id)
WHERE dir_fname=actor_fname and dir_lname=actor_lname;
cursor_list_film cursor_film%rowtype;
BEGIN
open cursor_film;
fetch cursor_film into cursor_list_film;
IF cursor_film%notfound THEN raise exp_badfilmid;
   END IF;
while cursor_film%found
loop
dbms_output.put_line('Фильм "'||cursor_list_film.name||'". Режиссёр и исполнитель главной роли: '||cursor_list_film.dir_fname||' '||cursor_list_film.dir_lname||'. Роль: '||cursor_list_film.name_of_role);
fetch cursor_film into cursor_list_film;
end loop;
close cursor_film;
EXCEPTION WHEN exp_badfilmid THEN raise_application_error(-20001,'Нет режиссёров, одновременно сыгравших главную роль в своём фильме.');
END FilmMainRole;
​/​

---------------------------------------------------------------------

create or replace function film_continue (f_film_id video_film.film_id%type)
return interval day to second is
d video_film.continue%type;
result interval day to second;
BEGIN
   SELECT continue
     INTO d
     FROM video_film
    WHERE film_id = f_film_id;
   RESULT:= d;
RETURN RESULT;
END film_continue;​
​
------------------------------------------------------------------------

begin
dbms_output.put_line(film_continue (21));
end;

---------------------------------

create or replace function film_continue (f_film_id video_film.film_id%type) return varchar2 is
exp_badfilmid EXCEPTION;
    d varchar2(40);

    cursor c1 is
    SELECT continue
    FROM video_film
    WHERE film_id = f_film_id;
    
BEGIN
   open c1;
   fetch c1 
   into d; 
   
IF c1%notfound THEN raise exp_badfilmid;
   END IF;
 
   CLOSE c1;
   RETURN d;
 
EXCEPTION WHEN exp_badfilmid THEN raise_application_error(-20001,'Такого film_id не существует.');
END;
​/​
-----------------------------------------------------------

create or replace PROCEDURE CHANGE_filmtime(newcontinue in varchar2)
 is

 TYPE film_INF_TYPE is RECORD (
   film_id video_film.film_id%type,
   name video_film.name%Type,
   year video_film.year%Type,
   continue video_film.continue%Type);
filmId video_film.film_id%type;
filmInf film_INF_TYPE;

FUNCTION getInf (filmid in Number)
return  film_INF_TYPE
is
result film_INF_TYPE;
begin
   Select film_id, name, year, continue 
   into result 
   from video_film
   where film_id=filmid;
RETURN result;
end getInf;

 FUNCTION TestCont (filmInf in film_INF_TYPE)
  RETURN boolean
 IS
 BEGIN
if to_char(sysdate, 'yyyy')-filmInf.year<1 then
     RETURN FALSE;
   ELSE
     RETURN TRUE;
end if;
 END TestCont;

 BEGIN
filmInf:=getInf (filmId);
    IF Testcont(filmInf) THEN
update video_film set continue=continue+newcontinue where film_ID=filmId;
commit;
dbms_output.put_line ('Фильм '||filmID||': Время в прокате = '|| filminf.continue ||', режиссёрское время = '||newcontinue);
ELSE
dbms_output.put_line('Фильм этого года, режисс  рской версии ещё нет.');
    END IF;


-----------------DML_TRIGGER---------------------
CREATE TABLE log1 (
table_name VARCHAR2(30),
oper_name CHAR(1),
pk_key VARCHAR2(200),
column_name VARCHAR2(30),
old_value VARCHAR2(200),
new_value VARCHAR2(200),
username VARCHAR2(20),
dateoper DATE);


create or replace TRIGGER director_aud 
AFTER INSERT OR UPDATE OR DELETE 
ON video_director 
FOR EACH ROW 
DECLARE 
op CHAR (1) := 'I'; 
BEGIN 
CASE 

WHEN INSERTING 
THEN 
op := 'I'; 
setaudit ('video_director', op, :NEW.director_id, 'ID', NULL,:NEW.director_id); 

WHEN UPDATING('FNAME') or UPDATING('LNAME') or UPDATING('DOB') 
THEN 
op := 'U'; 
setaudit ('video_director', op, :OLD.director_id, 'FNAME', :OLD.FNAME,:NEW.FNAME); 
setaudit ('video_director', op, :OLD.director_id, 'LNAME', :OLD.LNAME,:NEW.LNAME); 
setaudit ('video_director', op, :OLD.director_id, 'DOB', :OLD.DOB,:NEW.DOB); 

WHEN DELETING 
THEN 
op := 'D'; 
setaudit ('video_director', op, :old.director_id, 'ID', :OLD.director_id, NULL); 
ELSE 
null; 
END CASE; 
END director_aud;​


-----------------DDL_TRIGGER---------------------
create table log22 (
            "user" VARCHAR2(20),
             date_time date,
             oper  VARCHAR2(6),
             object_ VARCHAR2(20)
             );


CREATE OR REPLACE TRIGGER DDL_Trigger
AFTER CREATE OR ALTER OR DROP ON database
DECLARE
op   varchar(15) := 'C';
obj varchar(20) ;
BEGIN
obj := DICTIONARY_OBJ_NAME;
  case 
    when sysevent='CREATE' then op:='CREATE';
    when sysevent='ALTER' then op:='ALTER';
   else op:='DROP';
  end case;
if (to_char(sysdate,'hh24:mi') between '00:00' and '20:00') then 
 insert into log22 values (USER,sysdate,op,obj);
else
RAISE_APPLICATION_ERROR (num => -20000,msg => 'Cannot create/alter/drop object');
end if;
END;
/


-----------------LOG_ON/LOG_OFF---------------------------

CREATE TABLE LOG3
( id NUMBER,
  user1 VARCHAR2(20),
  date_time date,
  oper VARCHAR2(50)
  );

CREATE SEQUENCE sequence_log
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;


CREATE OR REPLACE TRIGGER LOG_ON
	AFTER LOGON ON DATABASE
BEGIN
INSERT INTO LOG3(ID, user1, date_time, OPER)
	VALUES(sequence_log.nextval, USER, SYSDATE, 'UserIsLog_on');
END LOG_ON;
/

CREATE OR REPLACE TRIGGER LOG_OFF
	BEFORE LOGOFF ON DATABASE
BEGIN
INSERT INTO LOG3(ID, user1, date_time, OPER)
	VALUES(sequence_log.nextval, USER, SYSDATE, 'UserIsLog_off');
END LOG_OFF;
/

------------------------my_trigger_1-----------------------------------------
--------В каждом фильме должен быть режиссёр, который не может снимать более двух фильмов в год.----
create or replace TRIGGER my_trigger_1
AFTER INSERT or DELETE or UPDATE 
ON video_film
FOR EACH ROW

DECLARE 
nfilm_id NUMBER; 
nname VARCHAR2(100);
ndirector_id NUMBER; 
nyear NUMBER;
nactor_id NUMBER;
ncounty NUMBER;
ncounta NUMBER;
error1 EXCEPTION;
error2 EXCEPTION;
error3 EXCEPTION;

BEGIN

select a.film_id, a.name, a.director_id, a.year, b.actor_id 
into nfilm_id, nname, ndirector_id, nyear, nactor_id
from
(select * from video_film) a
full join
(select * from video_actor_film) b
ON a.film_id=b.film_id;

select distinct director_id, count(year)
into ndirector_id, ncounty
FROM
video_film
where year in nyear
group by director_id
;

select distinct actor_id, count(year)
into nactor_id, ncounta
FROM
(select * from video_film) a
full join
(select * from video_actor_film) b
ON a.film_id=b.film_id
where year in nyear
group by director_id
;

if ndirector_id is null then raise error1;
end if;
if nactor_id is null then raise error2;
end if;
if ncounty >2 and ncounta >2 then raise error3;
end if;
EXCEPTION
WHEN error1 THEN 
RAISE_APPLICATION_ERROR(-20002, 'Не бывает фильмов без режиссёра! Введите id режиссёра!'); 
WHEN error2 THEN 
RAISE_APPLICATION_ERROR(-20003, 'В фильме должен играть хотя бы один актёр! Введите данные актёра!'); 
WHEN error3 THEN 
RAISE_APPLICATION_ERROR(-20004, 'Режиссёр и актёр не могут сниматься одновременнов более двух фильмах!');

END my_trigger_1;
​/​

-----------------------my_trigger_2---------------------------------------

create table reiting_actor
	(flname varchar2(100),
		points float
		);


create or replace TRIGGER my_trigger_2
before INSERT 
ON video_prodazhi
FOR EACH ROW

DECLARE
actor_id number;
reit float;
f number;
p float;
 cursor cursor_reiting is
select video_actor.actor_id, 0.1*avg(amount_of_money) as reit
from video_actor, video_actor_film, video_prodazhi
where video_actor.actor_id= video_actor_film.actor_id and video_actor_film.film_id=video_prodazhi.film_id
group by video_actor.actor_id
order by video_actor.actor_id;

cursor_reiting_perem cursor_reiting%rowtype;

BEGIN
    
OPEN cursor_reiting;
fetch cursor_reiting into cursor_reiting_perem;

while cursor_reiting%found
loop
f := actor_id;
p := reit;

MERGE INTO reiting_actor aa
USING (select video_actor.actor_id, 0.1*avg(amount_of_money) as reit
from video_actor, video_actor_film, video_prodazhi
where video_actor.actor_id= video_actor_film.actor_id and video_actor_film.film_id=video_prodazhi.film_id
group by video_actor.actor_id
order by video_actor.actor_id) bb
ON (aa.actor_id = bb.actor_id)

WHEN NOT MATCHED THEN INSERT VALUES (f,p)    

WHEN MATCHED THEN
UPDATE SET 
aa.reit = bb.reit;

fetch cursor_reiting into cursor_reiting_perem;
end loop;
close cursor_reiting;

END my_trigger_2;​
​/​
-----------------------my_trigger_3-----------------------------------------

create table arhiv
	(sale_id INTEGER,
	film_id INTEGER,
	buyer CHAR,
	chislo_of_buyer INTEGER,
	amount_of_money INTEGER,
	dos DATE);


create or replace TRIGGER my_trigger_3
BEFORE INSERT 
ON video_prodazhi
FOR EACH ROW

DECLARE 

 cursor cur_sor is
 select sale_id, film_id, buyer, chislo_of_buyer, amount_of_money, dos
 from video_prodazhi
where to_char(sysdate,'yyyy')-to_char(dos,'yyyy')>1;

a cur_sor%rowtype;

BEGIN
    
OPEN cur_sor;

fetch cur_sor into a;

while cur_sor%found
loop

MERGE INTO arhiv aa
USING (select sale_id, film_id, buyer, chislo_of_buyer, amount_of_money, dos
 from video_prodazhi
where to_char(sysdate,'yyyy')-to_char(dos,'yyyy')>1) bb
ON (aa.sale_id = bb.sale_id)

WHEN NOT MATCHED THEN INSERT VALUES (bb.sale_id, bb.film_id, bb.buyer, bb.chislo_of_buyer, bb.amount_of_money, bb.dos)    

WHEN MATCHED THEN
UPDATE SET 
aa.film_id = bb.film_id,
aa.buyer = bb.buyer,
aa.chislo_of_buyer = bb.chislo_of_buyer,
aa.amount_of_money = bb.amount_of_money,
aa.dos = bb.dos;

fetch cur_sor into a;
end loop;

close cur_sor;

END my_trigger_3;