% define valid choices for input in complaint
<<<<<<< Updated upstream
get_chief_complaint(1, 'Fever').
get_chief_complaint(2, 'Pain').
get_chief_complaint(3, 'Nausea').
get_chief_complaint(4, 'Diarrhea').
get_chief_complaint(5, 'Constipation').
get_chief_complaint(6, 'Jaundice').
get_chief_complaint(7, 'Rash').
get_chief_complaint(8, 'Itching').
get_chief_complaint(9, 'Cough').

% define valid choices for input in Pain
get_pain(1, 'Head').
get_pain(2, 'Muscle').
get_pain(3, 'Joints').
get_pain(4, 'Stomach').
get_pain(5, 'Abdomen').
get_pain(6, 'Chest').
=======
get_chief_complaint(1, fever).
get_chief_complaint(2, nausea).
get_chief_complaint(3, diarrhea).
get_chief_complaint(4, constipation).
get_chief_complaint(5, jaundice).
get_chief_complaint(6, rash).
get_chief_complaint(7, itching).
get_chief_complaint(8, cough).
get_chief_complaint(9, muscle_pain).
get_chief_complaint(10, joint_pain).
get_chief_complaint(11, stomach_pain).
get_chief_complaint(12, abdominal_pain).
>>>>>>> Stashed changes

% get chief complaint
chief_complaint :-
    write('Select your main reason for consultation:'), nl,
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
<<<<<<< Updated upstream
    get_chief_complaint(Input, Complaint),
    write('Your chief complaint is: '), write(Complaint), nl,
    (Input = 2 ->
        write('What type of pain do you have?'), nl,
        write('1 | Head'), nl,
        write('2 | Muscle'), nl,
        write('3 | Joints'), nl,
        write('4 | Stomach'), nl,
        write('5 | Abdomen'), nl,
        write('6 | Chest'), nl,
        read(PainInput),
        get_pain(PainInput, Pain),
        write('You have pain in your: '), write(Pain), nl
    ;
        true
    ).
=======
    get_chief_complaint(Input, Complaint). 

%TODO: add part to get severity of chief complaint
>>>>>>> Stashed changes
