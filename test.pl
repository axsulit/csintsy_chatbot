
% Define a dynamic predicate to store the list of symptoms.
:- dynamic patient_symptoms/1.

% Define a rule to add a symptom to the list.
add_symptom(Symptom) :-
    ( retract(patient_symptoms(Symptoms)) -> true ; Symptoms = [] ),
    asserta(patient_symptoms([Symptom|Symptoms])).

% Define a rule to print the list of symptoms.
print_symptoms :-
    patient_symptoms(Symptoms),
    write('Patient symptoms: '), write(Symptoms), nl.

% Initialize the list of symptoms to an empty list.
patient_symptoms([]).
