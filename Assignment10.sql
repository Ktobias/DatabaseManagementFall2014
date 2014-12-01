--Kimberly Tobias
--Assignment 10
--Due December 1, 2014

--1. function PreReqsFor(courseNum)- Returns the immediate prerequisites for the passed-in course number
Drop function PreReqsFor(integer);
CREATE OR REPLACE FUNCTION PreReqsFor(courseInt integer)
RETURNS SETOF Courses as $$
BEGIN
  RETURN query 
  SELECT * 
  FROM Courses
  WHERE num IN (
	SELECT preReqNum 
	FROM prerequisites
	WHERE courseInt = courseNum
  );
END;
$$ LANGUAGE 'plpgsql';


select PreReqsFor(499);



--2. function IsPreReqsFor(courseNum)- Returns the the courses for which the passed in course number is an immediate pre-req
Drop function IsPreReqsFor(integer);
CREATE OR REPLACE FUNCTION IsPreReqsFor(courseInt integer)
RETURNS SETOF Courses as $$
BEGIN
  RETURN query 
  SELECT * 
  FROM Courses
  WHERE num IN (
	SELECT courseNum 
	FROM prerequisites
	WHERE courseInt = preReqNum
  );
END;
$$ LANGUAGE 'plpgsql';


select isprereqsfor(308);
