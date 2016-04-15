create table service_contact_type
 (
 service_contact_type_id int IDENTITY(1,1),
 service_contact_type_name nvarchar(50) not null,
 service_contact_type_desc nvarchar(200),
 CONSTRAINT service_contact_type_pk PRIMARY KEY(service_contact_type_id)
 );
 
create table credit_status
 (
 credit_status_id int IDENTITY(1,1),
 credit_status_name nvarchar(50),
 CONSTRAINT credit_status_pk PRIMARY KEY (credit_status_id)
 );
  
create table employer 
 (
 employer_id int IDENTITY(1,1),
 employer_name nvarchar(100),
 address_1 nvarchar(50),
 address_2 nvarchar(50),
 city nvarchar(50),
 country nvarchar(50),
 zip int,
 phone_no int,
 CONSTRAINT employer_pk PRIMARY KEY (employer_id)
);
 
create table enquiry_contact_type
(
enquiry_contact_type_id int IDENTITY(1,1),
enquiry_contact_name nvarchar(50),
CONSTRAINT enquiry_contact_type_pk PRIMARY KEY (enquiry_contact_type_id)
);

create table application_status 
 (
 application_status_id int IDENTITY(1,1),
 application_status_name nvarchar(50),
 CONSTRAINT application_status_pk PRIMARY KEY(application_status_id)
 );

create table service_contact
( service_contact_id int IDENTITY(1,1),
 contact_first_name nvarchar(50),
 contact_last_name nvarchar(50),
 title nvarchar(50),
 phone_no int,
 contact_email nvarchar(50),
 service_contact_type_id int,
 created_date_ts datetime default CURRENT_TIMESTAMP,
 last_updated_date_ts datetime default CURRENT_TIMESTAMP,
 CONSTRAINT service_contact_pk PRIMARY KEY (service_contact_id),
 constraint service_contact_fk foreign key (service_contact_type_id) references service_contact_type (service_contact_type_id) 
 );
 
create table apartment_type
 (
 apartment_type_id int identity(1,1),
 apartment_type_name nvarchar(50),
 apartment_desc nvarchar(500),
 constraint apartment_type_pk primary key (apartment_type_id)
 );
 
create table apartment
( apartment_id int identity(1,1),
  GUID nvarchar(50) not null UNIQUE,
  address_1 nvarchar(100),
  address_2 nvarchar(100),
  city nvarchar(50),
  zip int,
  rent_amount int,
  service_contact_id int,
  credit_status_id int,
  apartment_type_id int,
  is_rented tinyint,
  lease_start_date date,
  lease_end_date date,
  created_date_ts datetime default CURRENT_TIMESTAMP,
  last_updated_date_ts datetime default CURRENT_TIMESTAMP,
  constraint apartment_pk primary key (apartment_id),
  constraint apartment__svc_fk foreign key (service_contact_id) references service_contact(service_contact_id),
  constraint apt_credit_fk foreign key (credit_status_id) references credit_status(credit_status_id),
  constraint apt_type_fk foreign key (apartment_type_id) references apartment_type(apartment_type_id)
);
 
create table applicant
 (
 applicant_id int identity(1,1),
 applicant_guid nvarchar(50) not null UNIQUE,
 first_name nvarchar(50),
 last_name nvarchar(50),
 job_title nvarchar(50),
 nationality nvarchar(50),
 annual_salary int,
 employer_id int,
 constraint applicant_pk primary key (applicant_id),
 constraint apartment_emp_fk foreign key (employer_id) references employer(employer_id)
 );
 
create table applicant_history
 (
 applicant_history_id int identity(1,1),
 applicant_id int,
 previous_landlord nvarchar(100),
 from_date date,
 to_date date,
 comments nvarchar(500),
 constraint applicant_history_pk primary key (applicant_history_id),
 constraint applicant_history_fk foreign key (applicant_id) references applicant(applicant_id)
 );
 
create table enquiry_status
(
 enquiry_status_id int identity(1,1),
 enquiry_status_name nvarchar(100),
 constraint enquiry_status_pk primary key (enquiry_status_id)
);
 
create table enquiry
(
enquiry_id int identity (1,1),
full_name nvarchar(100),
email nvarchar(50),
phone_no int,
preferred_contact_type int,
enquiry_status_id int,
constraint enquiry_pk primary key (enquiry_id),
constraint enquiry_type_fk foreign key(preferred_contact_type) references enquiry_contact_type(enquiry_contact_type_id),
constraint enquiry_status_fk foreign key (enquiry_status_id) references enquiry_status(enquiry_status_id)
);

create table apartment_applicant
(
apartment_applicant_id int identity(1,1),
applicant_id int,
apartment_id int,
amount_due int,
constraint apartment_applicant_pk primary key (apartment_applicant_id),
constraint apt_applicant_fk foreign key (applicant_id) references applicant(applicant_id),
constraint apt_apartment_fk foreign key (apartment_id) references apartment(apartment_id)
);

create table payment_type
(
payment_type_id int identity(1,1),
payment_type_name nvarchar(50),
constraint payment_type_pk primary key (payment_type_id)
);

create table rent_history
(
rent_history_id int identity(1,1),
apartment_id int not null,
payment_type_id int not null,
rent_amount int,
paid_by nvarchar(50),
created_date_ts date,
last_updated_date_rs date
constraint rent_history_pk primary key (rent_history_id),
constraint rent_apt_fk foreign key (apartment_id) references apartment(apartment_id),
constraint rent_history_pay_type_fk foreign key(payment_type_id) references payment_type(payment_type_id)
);

create table rent_reminder_job
(
rent_job_id int identity(1,1),
apartment_id int,
last_pay_date date,
next_pay_date date,
job_active tinyint,
constraint rent_job_pk primary key (rent_job_id),
constraint rent_reminder_fk foreign key (apartment_id) references apartment (apartment_id)
);

create table user_status
(
user_status_id int identity(1,1), 
user_status_name nvarchar(50) not null,
constraint user_status_pk primary key (user_status_id)
);

create table users
(
user_id int identity(1,1),
username nvarchar(50) not null,
first_name nvarchar(50),
last_name nvarchar(50),
user_email nvarchar(50),
created_date_ts date,
last_updated_date_ts date,
user_status_id int,
user_GUID nvarchar(10) not null UNIQUE,
supervisor_GUID nvarchar(10),
constraint users_pk primary key (user_id),
constraint user_status_fk foreign key(user_status_id) references user_status(user_status_id)
);



create table uploaded_files
(
uploaded_file_id int identity (1,1),
apartment_id int,
uploaded_file_name nvarchar(100) not null,
uploaded_by_GUID nvarchar(10),
constraint uploaded_files_pk primary key (uploaded_file_id),
constraint uploaded_apt_fk foreign key (apartment_id) references apartment (apartment_id)
);


