create database Library_demo;
show databases;
use  Library_demo;
create table readers(reader_id varchar(6),f_name varchar(30),m_name varchar(30),
l_name varchar(30),city varchar(15),mobile_no SMALLINT(10),Occupation varchar(10),
DOB Date, CONSTRAINT reader_pk Primary key (reader_id)); 
alter table readers modify mobile_no bigint(10);
insert into readers values('C0001','Ramesh','Chandra','Sharma','Delhi',9545198736,'Service','1976-12-06');
insert into readers values('C0002','Kedar','Sarawati','Khaire','Pune',9645198736,'Student','1995-12-06');
insert into readers values('C0003','Akash','Mahesh','Singhaniya','Guntur',9576198736,'Student','1995-10-05');
insert into readers values('C0004','Rahul',null,'Sharma','Manipur',9945199836,'Service','1993-12-15');
insert into readers values('C0005','Baidya','Om','Kapoor','Delhi',9545198736,'Service','1995-10-06');
insert into readers values('C0006','Vedika',null,'Chauhan','Nagpur',9741698736,'Housewife','1997-12-06');
insert into readers values('C0007','Preyashree','Mogembo','Roy','Delhi',9545198736,'Service','1976-12-06');
insert into readers values('C0008','Mona','Vasudev','Dukandaar','Delhi',9545198736,'Service','1976-12-06');
insert into readers values('C0009','Kartik','Mahadev','Modi','Delhi',9545198736,'Service','1976-12-06');
insert into readers values('C0010','Shyam','Chandra','Sharma','Delhi',9545198736,'Service','1976-12-06');
select * from readers;
create table Book(b_id varchar(6),b_name varchar(30), b_domain varchar(30),
                  constraint book_id_pk Primary Key(b_id));
alter table Book add Auther varchar(30);
describe Book;
insert into Book values('B0001','Fear Not:Be Strong','Biography','Swami Tathagatananda');
insert into Book values('B0002','Learning How to Fly','Motivational','Dr.A.P.J Abdul Kalam');
insert into Book values('B0003','WINGS OF FIRE','Biography','Dr.A.P.J Abdul Kalam');
insert into Book values('B0004','Rich Dad Poor Dad','Story','Robert T. Kiyosaki');
insert into Book values('B0005','Elon Musk','Biography','Ashlee Vance');
insert into Book values('B0006','The Story Truth','Biography','Mahatma Gandhi');
select * from Book;
create table Active_readers(account_id varchar(10),reader_id varchar(6),b_id varchar(6),a_type varchar(10),a_status varchar(10),
                            CONSTRAINT active_readers_pk Primary Key (account_id),
                            CONSTRAINT account_reader_id_fk foreign Key(reader_id) references readers(reader_id),
                            CONSTRAINT account_bid_fk foreign Key (b_id) references Book(b_id));
insert into Active_readers values('A0001','C0001','B0001','Premium','Active');
insert into Active_readers values('A0002','C0002','B0002','Regular','Active');
insert into Active_readers values('A0003','C0003','B0003','Premium','Suspended');
insert into Active_readers values('A0004','C0004','B0004','Regular','Active');
insert into Active_readers values('A0005','C0005','B0005','Premium','Terminated');
insert into Active_readers values('A0006','C0006','B0006','Premium','Suspended');
insert into Active_readers values('A0007','C0007','B0003','Premium','Suspended');
insert into Active_readers values('A0008','C0008','B0004','Regular','Active');
insert into Active_readers values('A0009','C0009','B0005','Premium','Terminated');
insert into Active_readers values('A0010','C0010','B0006','Premium','Suspended');
desc Active_readers;
select * from Active_readers;
create table Book_issue_details(issue_number varchar(6), account_id varchar (10), b_id varchar (10), book_name varchar(50),
                                number_of_books_issued INT(7), CONSTRAINT tran_details_tnum_pk primary key(issue_number),
                                constraint tran_details_accnum_pk foreign key(account_id) references Active_readers(account_id));
insert into Book_issue_details values('T0001','A0001','B0001', 'Fear Not:Be Strong',2);
insert into Book_issue_details values('T0002','A0002','B0002', 'Learning How to Fly',3);
insert into Book_issue_details values('T0003','A0003','B0001', 'WINGS OF FIRE',2);
insert into Book_issue_details values('T0004','A0004','B0003', 'Rich Dad Poor Dad',1);
insert into Book_issue_details values('T0005','A0005','B0003', 'Elon Musk',4);
insert into Book_issue_details values('T0006','A0006','B0004', 'The Story Truth',1);
insert into Book_issue_details values('T0007','A0007','B0006', 'Fear Not:Be Strong',2);

select * from Active_readers where a_status='Terminated';