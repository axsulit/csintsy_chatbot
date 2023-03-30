% Define the weight of each symptom severity level for each disease
weight(0, _, 0.2).
weight(1, _, 0.4).
weight(2, _, 0.6).
weight(3, _, 0.8).
weight(4, _, 1).

% Define the symptoms and causes for each disease
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
cause_of(hepatitis_a, poor_sanitation).
cause_of(hepatitis_a, sexually_active).
cause_of(hepatitis_a, contact_with_bodily_fluids).
cause_of(hepatitis_a, contaminated_food_or_beverages).

symptom_of(influenza, fever).
symptom_of(influenza, cough).
symptom_of(influenza, sore_throat).
symptom_of(influenza, runny_nose).
symptom_of(influenza, body_aches).
symptom_of(influenza, headache).
symptom_of(influenza, fatigue).
symptom_of(influenza, vomiting).
symptom_of(influenza, diarrhea).
cause_of(influenza, exposure_to_people_with_flu).

symptom_of(schistosomiasis, rash).
symptom_of(schistosomiasis, itchy_skin).
symptom_of(schistosomiasis, muscle_pain).
symptom_of(schistosomiasis, stomach_pain).
symptom_of(schistosomiasis, blood_in_urine_and_feces).
symptom_of(schistosomiasis, difficulty_urinating).
symptom_of(schistosomiasis, enlarged_liver).
symptom_of(schistosomiasis, cough).
symptom_of(schistosomiasis, fever).
cause_of(schistosomiasis, possible_exposure_to_animal_fluids).

symptom_of(leptospirosis, fever).
symptom_of(leptospirosis, headache).
symptom_of(leptospirosis, chills).
symptom_of(leptospirosis, body_aches).
symptom_of(leptospirosis, vomiting).
symptom_of(leptospirosis, jaundice).
symptom_of(leptospirosis, red_eyes).
symptom_of(leptospirosis, abdominal_pain).
symptom_of(leptospirosis, diarrhea).
symptom_of(leptospirosis, rash).
cause_of(leptospirosis, possible_exposure_to_animal_fluids).
cause_of(leptospirosis, contaminated_food_or_beverages).


symptom_of(hepatitis_b, fever).
symptom_of(hepatitis_b, fatigue).
symptom_of(hepatitis_b, loss_of_appetite).
symptom_of(hepatitis_b, nausea).
symptom_of(hepatitis_b, vomiting).
symptom_of(hepatitis_b, abdominal_pain).
symptom_of(hepatitis_b, dark_urine).
symptom_of(hepatitis_b, clay_colored_stool).
symptom_of(hepatitis_b, joint_pain).
symptom_of(hepatitis_b, jaundice).
cause_of(hepatitis_b, contact_with_bodily_fluids).
cause_of(hepatitis_b, sexually_active).


% Define the predicate to ask the user about symptom severity for a specific disease
ask_symptom_severity(Symptom, Severity) :-
    format("On a scale of 0 to 4, how severe is your ~w? ", [Symptom]),
    read(Severity).

ask_symptom(Symptom, Answer) :-
    format("Are you experiencing ~w? ", [Symptom]),
    read(Answer).

% Define the predicate to calculate the symptom score for a specific disease
symptom_score(Disease, Symptom, Score) :-
    ask_symptom(Symptom, Answer),
    (Answer == yes ->
    ask_symptom_severity(Symptom, Severity);
    Severity is 0),
    weight(Severity, Disease, Score).

% Define the predicate to calculate the total symptom score for a specific disease
total_score(Disease, Score) :-
    findall(SymptomScore,
            (symptom_of(Disease, Symptom),
             symptom_score(Disease, Symptom, SymptomScore)
            ),
            Scores
           ),
    sum_list(Scores, Score).

disease_risk([], []).
disease_risk([Disease | RestDiseases], [Risk | RestRisks]) :-
    findall(Symptom, symptom_of(Disease, Symptom), _),
    total_score(Disease, Score),
    %TO REVISE WEIGHTS
    (Score =< 0.2 -> Risk = 'very low';
    Score =< 0.4 -> Risk = low;
    Score =< 0.6 -> Risk = medium;
    Score =< 0.8 -> Risk = high;
    Risk = 'very high'),
    write('Your risk for '), write(Disease), write(' is '), write(Risk), nl,
    disease_risk(RestDiseases, RestRisks).


identify_potential_disease(Diseases, Complaint, Causes) :-
    findall(Disease,
            (cause_of(Disease, Cause),
             member(Cause, Causes),
             symptom_of(Disease, Complaint)
            ),
            DiseasesWithRepeats
           ),
    list_to_set(DiseasesWithRepeats, Diseases),
    write('You may have the following diseases: '), write(Diseases), nl.

