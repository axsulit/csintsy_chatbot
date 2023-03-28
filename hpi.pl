% Rules for identifying the history of present illness (HPI)

% Define the symptom categories
symptom_category(poor_sanitation).
symptom_category(travel_to_tropical_regions).
symptom_category(contact_with_bodily_fluids).
symptom_category(sexually_active).
symptom_category(contaminated_food_or_beverages).
symptom_category(use_of_illegal_drugs).
symptom_category(has_chronic_liver_diseases).
symptom_category(has_hiv_or_aids).
symptom_category(exposure_to_people_with_TB).
symptom_category(living_or_working_in_tight_places).
symptom_category(recently_outdoors_with_poor_sanitation_and_hot_temperatures).
symptom_category(possible_exposure_to_animal_fluids).

% Define the possible answers for each symptom
answer(poor_sanitation, [yes, no]).
answer(travel_to_tropical_regions, [yes, no]).
answer(contact_with_bodily_fluids, [yes, no]).
answer(sexually_active, [yes, no]).
answer(contaminated_food_or_beverages, [yes, no]).
answer(use_of_illegal_drugs, [yes, no]).
answer(has_chronic_liver_diseases, [yes, no]).
answer(has_hiv_or_aids, [yes, no]).
answer(exposure_to_people_with_TB, [yes, no]).
answer(living_or_working_in_tight_places, [yes, no]).
answer(recently_outdoors_with_poor_sanitation_and_hot_temperatures, [yes, no]).
answer(possible_exposure_to_animal_fluids, [yes, no]).

% Identify risks
ask(Patient, Symptom, Answer) :-
    symptom_category(Symptom),
    answer(Symptom, Options),
    write(Patient), write(', please answer the following question:'), nl,
    write(Symptom), write('?'), nl,
    write('Possible answers are: '), write(Options), nl,
    read(Answer),
    validate_answer(Answer, Options).

% Validate the answer
validate_answer(Answer, Options) :-
    member(Answer, Options),
    !.
validate_answer(Answer, _) :-
    write('Invalid answer: '), write(Answer), write('.'), nl,
    fail.

% Ask all the questions and store the positive answers in the knowledge base
ask_history(Patient, Symptoms) :-
    findall(Symptom, (
        ask(Patient, Symptom, Answer),
        Answer == yes, % Only store positive answers
        assertz(symptom(Patient, Symptom))
    ), Symptoms).
