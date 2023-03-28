% Define symptom weights for influenza
symptom_weight(influenza, fever, 0.8).
symptom_weight(influenza, cough, 0.5).
symptom_weight(influenza, body_aches, 0.7).

% Define symptom weights for dengue
symptom_weight(dengue, fever, 0.9).
symptom_weight(dengue, headache, 0.6).
symptom_weight(dengue, joint_pain, 0.8).

% Calculate the probability of a patient having a disease given their symptoms
has_disease(Patient, Disease, Probability) :-
    findall(Weight, (symptom_weight(Disease, Symptom, Weight), has_symptom(Patient, Symptom)), Weights),
    sum_list(Weights, TotalWeight),
    TotalWeight > 0,
    Probability is TotalWeight / length(Weights).
