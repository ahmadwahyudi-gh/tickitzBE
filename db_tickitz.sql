/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/27/2022 1:30:57 PM                         */
/*==============================================================*/


drop table if exists BOOKINGS;

drop table if exists CATEGORIES;

drop table if exists MOVIES;

drop table if exists SCHEDULES;

drop table if exists USERS;

/*==============================================================*/
/* Table: BOOKINGS                                              */
/*==============================================================*/
create table BOOKINGS
(
   ID_BOOKING           bigint not null,
   ID_USERS             bigint,
   ID_SCHEDULES         bigint,
   CREATED_AT           timestamp,
   UPDATED_AT           timestamp,
   SEATS                varchar(10),
   primary key (ID_BOOKING)
);

/*==============================================================*/
/* Table: CATEGORIES                                            */
/*==============================================================*/
create table CATEGORIES
(
   ID_CATEGORIES        bigint not null,
   ID_MOVIES            bigint,
   CATEGORIES           bigint,
   primary key (ID_CATEGORIES)
);

/*==============================================================*/
/* Table: MOVIES                                                */
/*==============================================================*/
create table MOVIES
(
   ID_MOVIES            bigint not null,
   TITLE                varchar(200),
   COVER                varchar(200),
   RELEASE_DATE         timestamp,
   DIRECTOR             varchar(100),
   DESCRIPTION          varchar(1000),
   CASTS                varchar(100),
   CREATED_AT           timestamp,
   UPDATED_AT           timestamp,
   primary key (ID_MOVIES)
);

/*==============================================================*/
/* Table: SCHEDULES                                             */
/*==============================================================*/
create table SCHEDULES
(
   ID_SCHEDULES         bigint not null,
   ID_MOVIES            bigint,
   LOCATION             varchar(100),
   SCHEDULES_TIME       time,
   SCHEDULE_DATE        date,
   CREATED_AT           timestamp,
   UPDATED_AT           timestamp,
   primary key (ID_SCHEDULES)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   ID_USERS             bigint not null,
   FIRSTNAME            varchar(20),
   LASTNAME             varchar(20),
   EMAIL                varchar(20),
   PASSWORD             varchar(100),
   PHONE                bigint,
   AVATAR               varchar(100),
   CREATED_AT           timestamp,
   UPDATED_AT           timestamp,
   primary key (ID_USERS)
);

alter table BOOKINGS add constraint FK_MELAKUKAN foreign key (ID_USERS)
      references USERS (ID_USERS) on delete restrict on update restrict;

alter table BOOKINGS add constraint FK_MENDAPAT foreign key (ID_SCHEDULES)
      references SCHEDULES (ID_SCHEDULES) on delete restrict on update restrict;

alter table CATEGORIES add constraint FK_MEMILIKI foreign key (ID_MOVIES)
      references MOVIES (ID_MOVIES) on delete restrict on update restrict;

alter table SCHEDULES add constraint FK_MEMPUNYAI foreign key (ID_MOVIES)
      references MOVIES (ID_MOVIES) on delete restrict on update restrict;

