
% Define a dynamic predicate to store the list of symptoms.
%:- dynamic patient_symptoms/1.

% Define a rule to add a symptom to the list.
%add_symptom(Symptom) :-
%    ( retract(patient_symptoms(Symptoms)) -> true ; Symptoms = [] ),
%    asserta(patient_symptoms([Symptom|Symptoms])).

% Define a rule to print the list of symptoms.
% print_symptoms :-
%    patient_symptoms(Symptoms),
%    write('Patient symptoms: '), write(Symptoms), nl.

% Initialize the list of symptoms to an empty list.
%patient_symptoms([]).

symptom_of(hepatitis_a, jaundice).
symptom_of(hepatitis_a, lack_of_appetite).
symptom_of(hepatitis_a, upset_stomach).
symptom_of(hepatitis_a, vomiting).
symptom_of(hepatitis_a, stomach_pain).
symptom_of(hepatitis_a, fever).
symptom_of(hepatitis_a, dark_urine).
symptom_of(hepatitis_a, light_colored_stools).
symptom_of(hepatitis_a, diarrhea).
symptom_of(hepatitis_a, joint_pain).
symptom_of(hepatitis_a, fatigue).


% Define a dynamic predicate to store the list of symptoms with their severity scores.
:- dynamic patient_symptoms/1.

% Define a dynamic flag to prevent duplicate symptoms.
:- dynamic symptom_flag/1.

% Define a rule to add a symptom to the list with a given severity score.
add_symptom(Symptom, SeverityScore) :-
    (not(symptom_flag(Symptom)), symptom_of(Disease, Symptom)),
    retract(patient_symptoms(Symptoms)),
    asserta(patient_symptoms([[Symptom, SeverityScore]|Symptoms])),
    asserta(symptom_flag(Symptom)).

% Define a rule to print the list of symptoms with their severity scores.
print_symptoms :-
    patient_symptoms(Symptoms),
    write('Patient symptoms: '), nl,
    print_symptoms_helper(Symptoms).

print_symptoms_helper([]).
print_symptoms_helper([[Symptom, SeverityScore]|Rest]) :-
    write(Symptom), write(' (Severity Score: '), write(SeverityScore), write(')'), nl,
    print_symptoms_helper(Rest).

% Initialize the list of symptoms to an empty list.
patient_symptoms([]).

% Initialize the symptom flag to false.
symptom_flag(false).
