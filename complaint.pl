% define valid choices for input in complaint
get_chief_complaint(1, 'fever').
get_chief_complaint(2, 'nausea').
get_chief_complaint(3, 'diarrhea').
get_chief_complaint(4, 'constipation').
get_chief_complaint(5, 'jaundice').
get_chief_complaint(6, 'rash').
get_chief_complaint(7, 'itchy skin').
get_chief_complaint(8, 'cough').
get_chief_complaint(9, 'muscle pain').
get_chief_complaint(10, 'joint pain').
get_chief_complaint(11, 'stomach pain').
get_chief_complaint(12, 'abdominal pain').


% Check if Complaint and Severity are unbound 
empty_cc_if_bound(Complaint, Severity) :-
    var(Complaint),
    var(Severity),
    write('Complaint and Severity are unbound.').

% Check if Complaint or Severity are bound 
empty_cc_if_bound(Complaint, Severity) :-
    (\+ var(Complaint); \+ var(Severity)),
    retract(Complaint),
    retract(Severity),
    write('Complaint and Severity have been emptied.').

% Define valid choices for input in severity
validate_cc_severity(Severity) :-
    number(Severity), Severity >= 1, Severity =< 4.

% Ask patient for severity input
ask_severity(Complaint, Severity) :-
    repeat,
    format("On a scale of 1 to 4, how severe is your ~w? ", [Complaint]),
    read(Severity),
    (validate_cc_severity(Severity) ->
        true
    ;
        write('Invalid input. Please enter a number between 1 and 4.'), nl,
        fail
    ).

% Define valid choices for CC.
validate_input(Input) :-
    Input >= 1, Input =< 12.

% Get chief complaint.
chief_complaint(Complaint, Severity) :-
    repeat,
       write('1  | Fever'), nl,
       write('2  | Nausea'), nl,
       write('3  | Diarrhea'), nl,
       write('4  | Constipation'), nl,
       write('5  | Jaundice'), nl,
       write('6  | Rash'), nl,
       write('7  | Itching'), nl,
       write('8  | Cough'), nl,
       write('9  | Muscle Pain'), nl,
       write('10 | Joint Pain'), nl,
       write('11 | Stomach Pain'), nl,
       write('12 | Abdominal Pain'), nl,
       read(Input),
       (validate_input(Input) ->
          !
       ;
          write('Invalid input. Please enter a value from 1-12.'), nl, fail),
    get_chief_complaint(Input, Complaint),nl,
    write('Your chief complaint is: '), write(Complaint), nl,
    ask_severity(Complaint, Severity).
