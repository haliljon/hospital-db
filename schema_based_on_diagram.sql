/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    name varchar(100),
    date_of_birth date,
);

CREATE TABLE treatments (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    type varchar(100),
    name varchar(100),
);

CREATE TABLE medical_histories (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    admitted_at timestamp,
    status varchar(100),
    patient_id int REFERENCES patients(id),
);
