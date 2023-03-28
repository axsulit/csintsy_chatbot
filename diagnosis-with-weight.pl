% Define the weight of each symptom severity level for each disease
weight(0, _, 0).
weight(1, _, 0.5).
weight(2, _, 0.5).
weight(3, _, 1).
weight(4, _, 1).

% Define the symptoms for each disease
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

symptom_of(influenza, fever).
symptom_of(influenza, cough).
symptom_of(influenza, sore_throat).
symptom_of(influenza, runny_nose).
symptom_of(influenza, body_aches).
symptom_of(influenza, headache).
symptom_of(influenza, fatigue).
symptom_of(influenza, vomiting).
symptom_of(influenza, diarrhea).

symptom_of(schistosomiasis, rash).
symptom_of(schistosomiasis, itchy_skin).
symptom_of(schistosomiasis, muscle_pain).
symptom_of(schistosomiasis, stomach_pain).
symptom_of(schistosomiasis, blood_in_urine_and_feces).
symptom_of(schistosomiasis, difficulty_urinating).
symptom_of(schistosomiasis, enlarged_liver).
symptom_of(schistosomiasis, cough).
symptom_of(schistosomiasis, fever).

% Define the predicate to ask the user about symptom severity for a specific disease
ask_symptom_severity(Symptom, Severity) :-
    format("On a scale of 0 to 4, how severe is your ~w? ", [Symptom]),
    read(Severity).

% Define the predicate to calculate the symptom score for a specific disease
symptom_score(Disease, Symptom, Score) :-
    ask_symptom_severity(Symptom, Severity),
    weight(Severity, Disease, Score).

% Define the predicate to calculate the total symptom score for a specific disease
total_score(Disease, Score) :-
    findall(SymptomScore, (symptom_of(Disease, Symptom), symptom_score(Disease, Symptom, SymptomScore)), Scores),
    sum_list(Scores, Score).

% Define the predicate to determine the risk of a specific disease based on symptom score
disease_risk(Disease, Risk) :-
    findall(Symptom, symptom_of(Disease, Symptom), Symptoms),
    length(Symptoms, N),
    total_score(Disease, Score),
    (Score >= N/2 -> Risk = high; Risk = low).
