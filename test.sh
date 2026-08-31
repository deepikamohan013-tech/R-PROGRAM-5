#!/bin/bash

DB="CollegeDB"
USER="root"
PASSWORD="root"

echo "Running tests..."

# Check Student table exists
TABLE_COUNT=$(mysql -h 127.0.0.1 -u"$USER" -p"$PASSWORD" -N -B "$DB" \
-e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='$DB' AND table_name='Student';")

if [ "$TABLE_COUNT" -ne 1 ]; then
    echo "FAIL: Student table does not exist."
    exit 1
fi

# Check number of records
COUNT=$(mysql -h 127.0.0.1 -u"$USER" -p"$PASSWORD" -N -B "$DB" \
-e "SELECT COUNT(*) FROM Student;")

if [ "$COUNT" -ne 3 ]; then
    echo "FAIL: Expected 3 student records, found $COUNT."
    exit 1
fi

# Check Arun
ARUN=$(mysql -h 127.0.0.1 -u"$USER" -p"$PASSWORD" -N -B "$DB" \
-e "SELECT COUNT(*) FROM Student WHERE StudentID=1001 AND StudentName='Arun' AND Gender='Male' AND DepartmentID=101;")

# Check Divya
DIVYA=$(mysql -h 127.0.0.1 -u"$USER" -p"$PASSWORD" -N -B "$DB" \
-e "SELECT COUNT(*) FROM Student WHERE StudentID=1002 AND StudentName='Divya' AND Gender='Female' AND DepartmentID=102;")

# Check Karthik
KARTHIK=$(mysql -h 127.0.0.1 -u"$USER" -p"$PASSWORD" -N -B "$DB" \
-e "SELECT COUNT(*) FROM Student WHERE StudentID=1003 AND StudentName='Karthik' AND Gender='Male' AND DepartmentID=101;")

if [ "$ARUN" -eq 1 ] && [ "$DIVYA" -eq 1 ] && [ "$KARTHIK" -eq 1 ]; then
    echo "PASS: All student records are inserted correctly."
else
    echo "FAIL: Student records are incorrect."
    exit 1
fi

echo "All tests passed."
exit 0
