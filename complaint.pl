chief_complaint(Patient, Symptoms) :- 
    format('Select your main reason for consultation:'), nl, 
    write('1 | pain'), nl, 
    write('2 | fever'), nl,
    write('3 | nausea'), nl,
    write('4 | diarrhea'), nl,
    write('5 | constipation'), nl,
    write('6 | jaundice'), nl,
    write('7 | rashes'), nl,
    write('8 | itchiness'), nl,
    write('9 | cough'), nl,
    read(Input),
    (   Input = 1 -> Complaint = pain
    ;   Input = 2 -> Complaint = fever
    ;   Input = 3 -> Complaint = nausea
    ;   Input = 4 -> Complaint = diarrhea
    ;   Input = 5 -> Complaint = constipation
    ;   Input = 6 -> Complaint = jaundice
    ;   Input = 7 -> Complaint = rashes
    ;   Input = 8 -> Complaint = itchiness
    ;   Input = 9 -> Complaint = cough
    ;   write('Invalid input!'), nl, chief_complaint(Patient, Symptoms)
    ),
    write(Complaint), nl,
    append(Symptoms, [Complaint], NewSymptoms),
    assertz(symptoms(Patient, NewSymptoms)).
