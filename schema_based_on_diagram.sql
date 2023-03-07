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

CREATE TABLE invoices (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    total_amount decimal,
    genrated_at timestamp,
    payed_at timestamp,
    medical_history_id int REFERENCES medical_histories(id),
);

CREATE TABLE invoice_items (
    id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int REFERENCES invoices(id),
    treatment_id int REFERENCES treatments(id),
);

CREATE TABLE medical_histories_treatments (
    medical_historie_id int REFERENCES medical_histories(id),
    treatment_id int REFERENCES treatments(id),
);

ALTER TABLE invoice_items ADD INDEX (invoice_id), ADD INDEX (treatment_id);
ALTER TABLE medical_histories_treatments ADD INDEX (medical_historie_id), ADD INDEX (treatment_id);
ALTER TABLE invoices ADD INDEX (medical_history_id);
ALTER TABLE medical_histories ADD INDEX (patient_id);
