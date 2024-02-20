using { Roster as my } from '../db/schema';

@path : '/service/Roster'
service RosterService
{
    annotate Employee with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'viewer' ] },
        { grant : [ '*' ], to : [ 'manager' ] }
    ];

    annotate RosterSchedule with @restrict :
    [
        { grant : [ '*' ], to : [ 'manager' ] }
    ];

    annotate ShiftAssignment with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'viewer' ] },
        { grant : [ '*' ], to : [ 'manager' ] }
    ];

    @odata.draft.enabled
    entity Employee as
        projection on my.Employee;

    @odata.draft.enabled
    entity RosterSchedule as
        projection on my.RosterSchedule;

    @odata.draft.enabled
    entity ShiftAssignment as
        projection on my.ShiftAssignment;
}

annotate RosterService with @requires :
[
    'authenticated-user',
    'viewer',
    'manager'
];
