/* Elections results query solved */

CREATE SEQUENCE IF NOT EXISTS "sqCandId"
    start 101
;
CREATE TABLE IF NOT EXISTS "tblCandidates"
(
      "id" integer PRIMARY KEY DEFAULT nextval('"sqCandId"')
    , "gender" character varying(10)
    , "age" int
    , "party" character varying(50)
)
;

ALTER SEQUENCE "sqCandId" OWNED BY "tblCandidates"."id"
;

INSERT INTO "tblCandidates" ("gender", "age", "party") VALUES
    ('M', 54, 'C')
  , ('M', 50, 'C')
  , ('F', 61, 'C')
  , ('M', 59, 'L')
  , ('F', 60, 'L')
  , ('F', 57, 'L')
;

