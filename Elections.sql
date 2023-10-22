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

CREATE TABLE IF NOT EXISTS "tblResults"
(
    "constituency_id" integer
  , "candidate_id" integer
  , "votes" integer
  , constraint "fk_candidate_id" FOREIGN KEY("candidate_id") REFERENCES "tblCandidates"("id")
)
;

INSERT INTO "tblResults" VALUES
    (11, 101, 847530)
  , (11, 104, 283409)
  , (22, 102, 293841)
  , (22, 105, 394385)
  , (33, 103, 429084)
  , (33, 106, 303890)
  ;

SELECT *
FROM "tblCandidates" AS "tc"
JOIN "tblResults" AS "tr" ON "tc"."id" = "tr"."candidate_id"
;

SELECT "tc"."party", "tr"."constituency_id", "tr"."candidate_id", "tr"."votes"
FROM "tblCandidates" AS "tc"
JOIN "tblResults" AS "tr" ON "tr"."candidate_id" = "tc"."id"
;