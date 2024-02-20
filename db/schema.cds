namespace Roster;

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Employee : cuid, managed
{
    key ID : UUID;
    Name : String(100) not null;
    mobile_no : String(10) not null;
    address : String(100) not null;
    desgination : String(100) not null;
    department : String(100) not null;
    age : String(3) not null;
    rosterSchedule : Association to one RosterSchedule;
}

entity RosterSchedule : cuid, managed
{
    key ID : UUID;
    startDate : Date not null;
    endDate : Date not null;
    status : String(100) not null;
    Rname : String(100) not null;
    shiftAssignment : Association to many ShiftAssignment on shiftAssignment.rosterSchedule = $self;
    employee : Association to many Employee on employee.rosterSchedule = $self;
}

entity ShiftAssignment
{
    key ID : UUID;
    startTime : Time not null;
    endTime : Time not null;
    shiftName : String(100) not null;
    rosterSchedule : Association to one RosterSchedule;
}
