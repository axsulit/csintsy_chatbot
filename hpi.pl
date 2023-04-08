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
question(poor_sanitation, 'Do you have any issues or difficulties maintaining proper hygiene and sanitation practices?').
question(contaminated_food_or_beverages, 'Have you ingested any food or beverages that may have been contaminated within the past two weeks?').
question(living_or_working_in_tight_places, 'Have you been residing or employed in cramped or confined spaces?').
question(sexually_active, 'Have you engaged in unprotected sexual activity within the past 6 months?').
question(contact_with_bodily_fluids, 'Did you have contact with bodily fluids within the last two weeks?').
question(has_hiv_or_aids, 'Do you have HIV or AIDS?').
question(has_chronic_liver_diseases, 'Do you have a history of chronic liver diseases?').
question(has_chronic_pulmonary_diseases, 'Do you have a history of chronic pulmonary disease?').
question(exposure_to_people_with_TB, 'Have you been in contact with anyone who has tuberculosis within the past two weeks?').
question(exposure_to_people_with_flu, 'Have you come into contact with anyone who has had the flu within the past two weeks?').
question(travel_to_tropical_regions, 'Have you visited any tropical regions within the past two weeks?').
question(recently_outdoors_with_poor_sanitation_and_hot_temperatures, 'Have you spent time outdoors in areas with inadequate sanitation and hot temperatures within the past two weeks?').
question(possible_exposure_to_animal_fluids, 'Have you come into contact with animal fluids within the past two weeks?').
question(recently_contacted_with_soil, 'Have you had any bare contact with soil within the past two weeks?').


ask_question(Patient, Cause, Prompt) :-
    write(Prompt), write(' (yes/no) '), nl,
    write('Answer: '), read(Answer), nl,
    (member(Answer, [yes, no])
    -> (Answer == yes, assertz(symptom(Patient, Cause)))
       
    ;   write('Invalid input. Please enter either "yes" or "no".'), nl,
        ask_question(Patient, Cause, Prompt)
    ).

% Ask all the questions and store the positive answers in the knowledge base
ask_history(Patient, Causes) :-
    findall(Cause,
        ( question(Cause, Prompt),
          ask_question(Patient, Cause, Prompt)
          ),
          Causes
        ),
    write('causes: '), write(Causes), nl.