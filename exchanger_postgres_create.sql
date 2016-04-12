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
	"role" character varying NOT NULL,
	CONSTRAINT user_credentials_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "transaction" (
	"id" serial NOT NULL,
	"user_id" int NOT NULL,
	"operation_id" int NOT NULL,
	"exchange_rate_id" int NOT NULL,
	"sum_in" int NOT NULL,
	"date_operation" TIMESTAMP NOT NULL,
	CONSTRAINT transaction_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "exchange_rate" (
	"id" serial NOT NULL,
	"date_course" TIMESTAMP NOT NULL UNIQUE,
	"currency_id_from" int NOT NULL,
	"currency_id_to" int NOT NULL,
	"conversion" double NOT NULL,
	CONSTRAINT exchange_rate_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "operation" (
	"id" serial NOT NULL,
	"name" character varying NOT NULL UNIQUE,
	"status_block" BOOLEAN NOT NULL,
	"tax" double NOT NULL,
	CONSTRAINT operation_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "balance" (
	"id" serial NOT NULL,
	"sum" int NOT NULL,
	CONSTRAINT balance_pk PRIMARY KEY ("id")
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



ALTER TABLE "user_profile" ADD CONSTRAINT "user_profile_fk0" FOREIGN KEY ("id") REFERENCES "user_credentials"("id");


ALTER TABLE "transaction" ADD CONSTRAINT "transaction_fk0" FOREIGN KEY ("user_id") REFERENCES "user_credentials"("id");
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_fk1" FOREIGN KEY ("operation_id") REFERENCES "operation"("id");
ALTER TABLE "transaction" ADD CONSTRAINT "transaction_fk2" FOREIGN KEY ("exchange_rate_id") REFERENCES "exchange_rate"("id");

ALTER TABLE "exchange_rate" ADD CONSTRAINT "exchange_rate_fk0" FOREIGN KEY ("currency_id_from") REFERENCES "currency"("id");
ALTER TABLE "exchange_rate" ADD CONSTRAINT "exchange_rate_fk1" FOREIGN KEY ("currency_id_to") REFERENCES "currency"("id");



ALTER TABLE "currency" ADD CONSTRAINT "currency_fk0" FOREIGN KEY ("id") REFERENCES "balance"("id");

