CREATE TABLE "user_profile" (
	"id" serial NOT NULL,
	"last_name" character varying(20) NOT NULL,
	"first_name" character varying(20) NOT NULL,
	"patronymic" character varying(20),
	"number_passport" character varying NOT NULL UNIQUE,
	"date_issue" TIMESTAMP NOT NULL,
	"issued" character varying NOT NULL,
	CONSTRAINT user_profile_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "user_credentials" (
	"id" serial NOT NULL,
	"login" character varying(20) NOT NULL UNIQUE,
	"password" character varying(20) NOT NULL,
	"role" int NOT NULL,
	CONSTRAINT user_credentials_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "registry_operations" (
	"id" serial NOT NULL,
	"user_id" int NOT NULL,
	"number_operation" int NOT NULL,
	"operation_id" int NOT NULL,
	"course_in_id" int NOT NULL,
	"course_out_id" int NOT NULL,
	"summ_in" int NOT NULL,
	"summ_out" int NOT NULL,
	"date_operation" TIMESTAMP NOT NULL,
	"number_registry" int NOT NULL UNIQUE,
	CONSTRAINT registry_operations_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "course" (
	"id" serial NOT NULL,
	"buy_course" int NOT NULL,
	"sell_course" int NOT NULL,
	"date_course" TIMESTAMP NOT NULL UNIQUE,
	"currency_id" int NOT NULL,
	CONSTRAINT course_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "operation" (
	"id" serial NOT NULL,
	"name" character varying NOT NULL UNIQUE,
	"status_block" BOOLEAN NOT NULL,
	"tax" double precision NOT NULL,
	CONSTRAINT operation_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "currency" (
	"id" serial NOT NULL,
	"name" character varying NOT NULL UNIQUE,
	CONSTRAINT currency_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "check" (
	"id" int NOT NULL,
	"date_check" TIMESTAMP NOT NULL,
	"number_registry_id" int NOT NULL UNIQUE,
	CONSTRAINT check_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "balance" (
	"id" serial NOT NULL,
	"debit" int NOT NULL,
	"credit" int NOT NULL,
	"registry_operations_id" int NOT NULL,
	CONSTRAINT balance_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "user_profile" ADD CONSTRAINT "user_profile_fk0" FOREIGN KEY ("id") REFERENCES "user_credentials"("id");


ALTER TABLE "registry_operations" ADD CONSTRAINT "registry_operations_fk0" FOREIGN KEY ("user_id") REFERENCES "user_credentials"("id");
ALTER TABLE "registry_operations" ADD CONSTRAINT "registry_operations_fk1" FOREIGN KEY ("operation_id") REFERENCES "operation"("id");
ALTER TABLE "registry_operations" ADD CONSTRAINT "registry_operations_fk2" FOREIGN KEY ("course_in_id") REFERENCES "course"("id");
ALTER TABLE "registry_operations" ADD CONSTRAINT "registry_operations_fk3" FOREIGN KEY ("course_out_id") REFERENCES "course"("id");

ALTER TABLE "course" ADD CONSTRAINT "course_fk0" FOREIGN KEY ("currency_id") REFERENCES "currency"("id");



ALTER TABLE "check" ADD CONSTRAINT "check_fk0" FOREIGN KEY ("number_registry_id") REFERENCES "registry_operations"("number_registry");

ALTER TABLE "balance" ADD CONSTRAINT "balance_fk0" FOREIGN KEY ("registry_operations_id") REFERENCES "registry_operations"("id");

