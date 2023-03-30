% define valid choices for input in complaint
get_chief_complaint(1, 'fever').
get_chief_complaint(2, 'pain').
get_chief_complaint(3, 'nausea').
get_chief_complaint(4, 'diarrhea').
get_chief_complaint(5, 'constipation').
get_chief_complaint(6, 'jaundice').
get_chief_complaint(7, 'rash').
get_chief_complaint(8, 'itching').
get_chief_complaint(9, 'cough').

% define valid choices for input in Pain
get_pain(1, 'Head').
get_pain(2, 'Muscle').
get_pain(3, 'Joints').
get_pain(4, 'Stomach').
get_pain(5, 'Abdomen').
get_pain(6, 'Chest').

% get chief complaint
chief_complaint(Complaint) :-
    write('Select your main reason for consultation:'), nl,
    write('1 | Fever'), nl,
    write('2 | Pain'), nl,
    write('3 | Nausea'), nl,
    write('4 | Diarrhea'), nl,
    write('5 | Constipation'), nl,
    write('6 | Jaundice'), nl,
    write('7 | Rash'), nl,
    write('8 | Itching'), nl,
    write('9 | Cough'), nl,
    read(Input),
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
