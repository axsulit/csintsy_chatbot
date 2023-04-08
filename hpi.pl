% Rules for identifying the history of present illness (HPI)

% Define the causes
cause('poor sanitation').
cause('travel to tropical regions').
cause('contact with bodily fluids').
cause('exposure to animal fluids').
cause('sexually active').
cause('intake of contaminated food or beverages').
cause('has chronic liver diseases').
cause('has chronic pulmonary diseases').
cause('has HIV or AIDS').
cause('exposure to people with TB').
cause('exposure to people with flu').
cause('living or working in tight places').
cause('stayed outdoors with poor sanitation and hot temperatures').
cause('bare contact with soil').

% Define the possible answers for each cause
question('poor sanitation', 'Do you have any issues or difficulties maintaining proper hygiene and sanitation practices?').
question('intake of contaminated food or beverages', 'Have you ingested any food or beverages that may have been contaminated within the past two weeks?').
question('living or working in tight places', 'Have you been residing or employed in cramped or confined spaces?').
question('sexually active', 'Have you engaged in unprotected sexual activity within the past 6 months?').
question('contact with bodily fluids', 'Did you have contact with bodily fluids within the last two weeks?').
question('has HIV or AIDS', 'Do you have HIV or AIDS?').
question('has chronic liver diseases', 'Do you have a history of chronic liver diseases?').
question('has chronic pulmonary diseases', 'Do you have a history of chronic pulmonary disease?').
question('exposure to people with TB', 'Have you been in contact with anyone who has tuberculosis within the past two weeks?').
question('exposure to people with flu', 'Have you come into contact with anyone who has had the flu within the past two weeks?').
question('travel to tropical regions', 'Have you visited any tropical regions within the past two weeks?').
question('stayed outdoors with poor sanitation and hot temperatures', 'Have you spent time outdoors in areas with inadequate sanitation and hot temperatures within the past two weeks?').
question('exposure to animal fluids', 'Have you come into contact with animal fluids within the past two weeks?').
question('bare contact with soil', 'Have you had any bare contact with soil within the past two weeks?').


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
