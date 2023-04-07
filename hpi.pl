% Rules for identifying the history of present illness (HPI)

% Define the causes
cause(poor_sanitation).
cause(travel_to_tropical_regions).
cause(contact_with_bodily_fluids).
cause(possible_exposure_to_animal_fluids).
cause(sexually_active).
cause(contaminated_food_or_beverages).
cause(has_chronic_liver_diseases).
cause(has_chronic_pulmonary_diseases).
cause(has_hiv_or_aids).
cause(exposure_to_people_with_TB).
cause(exposure_to_people_with_flu).
cause(living_or_working_in_tight_places).
cause(recently_outdoors_with_poor_sanitation_and_hot_temperatures).
cause(recently_contacted_with_soil).

% Define the possible answers for each cause
question(poor_sanitation, 'Do you have poor sanitation?').
question(travel_to_tropical_regions, 'Have you traveled to tropical regions in the last two weeks?').
question(contact_with_bodily_fluids, 'Did you have contact with bodily fluids in the last two weeks?').
question(sexually_active, 'Have you been sexually active in the last two weeks?').
question(contaminated_food_or_beverages, 'Have you consumed contaminated food or beverages in the last two weeks?').
question(use_of_illegal_drugs, 'Have you taken illegal drugs in the last two weeks?').
question(has_chronic_liver_diseases, 'Do you have any chronic liver diseases?').
question(has_chronic_pulmonary_diseases, 'Do you have any chronic pulmonary disease?').
question(has_hiv_or_aids, 'Do you have HIV or AIDS?').
question(exposure_to_people_with_TB, 'Have you been exposed to people with Tuberculosis in the last two weeks?').
question(exposure_to_people_with_flu, 'Have you been exposed to people with the flue in the last two weeks?').
question(living_or_working_in_tight_places, 'Have you been living or working in tight places?').
question(recently_outdoors_with_poor_sanitation_and_hot_temperatures, 'Have you recently been outdoors with poor sanitationi and hot temperatures?').
question(possible_exposure_to_animal_fluids, 'Have you been recently exposed to animal fluids in the last two weeks?').
question(recently_contacted_with_soil, 'Have you recently been in contact with soil?').

% Identify risks
ask(Cause, Answer) :-
    % get cause
    cause(Cause),
    % get answer choices
    question(Cause, Prompt),
    % display prompt
    write(Prompt), write(' (yes/no) '), nl, 
	write('Answer: '), read(Answer),
    validate_answer(Answer, [yes,no]).

% Validate the answer
validate_answer(Answer, Options) :-
    member(Answer, Options),
    !.
validate_answer(Answer, _) :-
    write('Invalid answer: '), write(Answer), write('.'), nl,
    fail.

% Ask all the questions and store the positive answers in the knowledge base
ask_history(Patient, Causes) :-
    findall(Cause, (
        ask(Cause, Answer),
        Answer == yes, % Only store positive answers
        assertz(symptom(Patient, Cause))
    ),Causes).