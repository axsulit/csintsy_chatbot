% Rules for identifying the chief complaint

chief_complaint(Patient) :-
    write('What is your chief complaint?'), nl,
    read(Patient).

% Rules for identifying the history of present illness (HPI)

hpi(Patient, []) :- !.
hpi(Patient, [Symptom|Rest]) :-
    write('Do you have '), write(Symptom), write('? (yes/no)'), nl,
    read(Response),
    (Response == yes ->
        assert(yes(Symptom, Patient));
        assert(no(Symptom, Patient))),
    hpi(Patient, Rest).

% Rules for diagnosing diseases based on symptoms

disease(Patient, typhoid_fever) :-
    yes(fever, Patient),
    yes(headache, Patient),
    yes(abdominal_pain, Patient),
    yes(loss_of_appetite, Patient),
    yes(rash, Patient).

disease(Patient, influenza) :-
    yes(fever, Patient),
    yes(cough, Patient),
    yes(sore_throat, Patient),
    yes(runny_or_stuffy_nose, Patient),
    yes(body_aches, Patient),
    yes(headache, Patient).

disease(Patient, hookworm) :-
    yes(stomach_pain, Patient),
    yes(diarrhea, Patient),
    yes(weight_loss, Patient),
    yes(fatigue, Patient),
    yes(weakness, Patient),
    yes(anemia, Patient).

% Rules for running the diagnostic expert system

diagnose(Patient) :-
    retractall(yes(_, Patient)),
    retractall(no(_, Patient)),
    chief_complaint(Patient),
    findall(Symptom, symptom(Symptom), Symptoms),
    hpi(Patient, Symptoms),
    findall(Disease, disease(Patient, Disease), Diseases),
    (Diseases = [] ->
        writeln('Disease cannot be determined');
        writeln(Diseases)).

symptom(fever).
symptom(headache).
symptom(abdominal_pain).
symptom(loss_of_appetite).
symptom(rash).
symptom(cough).
symptom(sore_throat).
symptom(runny_or_stuffy_nose).
symptom(body_aches).
symptom(stomach_pain).
symptom(diarrhea).
symptom(weight_loss).
symptom(fatigue).
symptom(weakness).
symptom(anemia).