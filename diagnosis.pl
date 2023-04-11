% Define the weight of each symptom severity level for each disease
weight(0, _, 0.0).
weight(1, _, 0.2).
weight(2, _, 0.4).
weight(3, _, 0.8).
weight(4, _, 1).

% Define the symptoms and causes for each disease
symptom_of('typhoid fever', 'fever').
symptom_of('typhoid fever', 'headache').
symptom_of('typhoid fever', 'fatigue').
symptom_of('typhoid fever', 'cough').
symptom_of('typhoid fever', 'constipation').
symptom_of('typhoid fever', 'body aches').

symptom_of('hepatitis a', 'jaundice').
symptom_of('hepatitis a', 'lack of appetite').
symptom_of('hepatitis a', 'upset stomach').
symptom_of('hepatitis a', 'vomiting').
symptom_of('hepatitis a', 'stomach pain').
symptom_of('hepatitis a', 'fever').
symptom_of('hepatitis a', 'dark urine').
symptom_of('hepatitis a', 'light colored stools').
symptom_of('hepatitis a', 'diarrhea').
symptom_of('hepatitis a', 'joint pain').
symptom_of('hepatitis a', 'fatigue').

symptom_of('active TB', 'cough with blood').
symptom_of('active TB', 'cough with phlegm').
symptom_of('active TB', 'chest pain').
symptom_of('active TB', 'breathing pain').
symptom_of('active TB', 'coughing pain').
symptom_of('active TB', 'fever').
symptom_of('active TB', 'chills').
symptom_of('active TB', 'night sweats').
symptom_of('active TB', 'weight loss').
symptom_of('active TB', 'lack of appetite').
symptom_of('active TB', 'fatigue').
symptom_of('active TB', 'weakness').

symptom_of(leptospirosis, 'fever').
symptom_of(leptospirosis, 'headache').
symptom_of(leptospirosis, 'chills').
symptom_of(leptospirosis, 'body aches').
symptom_of(leptospirosis, 'vomiting').
symptom_of(leptospirosis, 'jaundice').
symptom_of(leptospirosis, 'red eyes').
symptom_of(leptospirosis, 'abdominal pain').
symptom_of(leptospirosis, 'diarrhea').
symptom_of(leptospirosis, 'rash').

symptom_of(dengue, 'nausea').
symptom_of(dengue, 'vomiting').
symptom_of(dengue, 'eye pain').
symptom_of(dengue, 'muscle pain').
symptom_of(dengue, 'joint pain').
symptom_of(dengue, 'abdominal pain').
symptom_of(dengue, 'blood in urine and/or feces').
symptom_of(dengue, 'fatigue').
symptom_of(dengue, 'weakness').

symptom_of(influenza, 'fever').
symptom_of(influenza, 'cough').
symptom_of(influenza, 'sore throat').
symptom_of(influenza, 'runny nose').
symptom_of(influenza, 'body aches').
symptom_of(influenza, 'headache').
symptom_of(influenza, 'fatigue').
symptom_of(influenza, 'vomiting').
symptom_of(influenza, 'diarrhea').

symptom_of(pneumonia, 'breathing pain').
symptom_of(pneumonia, 'coughing pain').
symptom_of(pneumonia, 'cough with phlegm').
symptom_of(pneumonia, 'fatigue').
symptom_of(pneumonia, 'fever').
symptom_of(pneumonia, 'chills').
symptom_of(pneumonia, 'nausea').
symptom_of(pneumonia, 'vomiting').
symptom_of(pneumonia, 'diarrhea').
symptom_of(pneumonia, 'difficulty breathing').

symptom_of('hepatitis b', 'fever').
symptom_of('hepatitis b', 'fatigue').
symptom_of('hepatitis b', 'lack of appetite').
symptom_of('hepatitis b', 'nausea').
symptom_of('hepatitis b', 'vomiting').
symptom_of('hepatitis b', 'abdominal pain').
symptom_of('hepatitis b', 'dark urine').
symptom_of('hepatitis b', 'clay colored stool').
symptom_of('hepatitis b', 'joint pain').
symptom_of('hepatitis b', 'jaundice').

symptom_of(malaria, 'fever').
symptom_of(malaria, 'chills').
symptom_of(malaria, 'headache').
symptom_of(malaria, 'body aches').
symptom_of(malaria, 'fatigue').
symptom_of(malaria, 'chest pain').
symptom_of(malaria, 'breathing pain').
symptom_of(malaria, 'coughing pain').
symptom_of(malaria, 'cough').
symptom_of(malaria, 'diarrhea').
symptom_of(malaria, 'nausea').
symptom_of(malaria, 'vomiting').

symptom_of(schistosomiasis, 'rash').
symptom_of(schistosomiasis, 'itchy skin').
symptom_of(schistosomiasis, 'muscle pain').
symptom_of(schistosomiasis, 'stomach pain').
symptom_of(schistosomiasis, 'blood in urine and/or feces').
symptom_of(schistosomiasis, 'difficulty urinating').
symptom_of(schistosomiasis, 'enlarged liver').
symptom_of(schistosomiasis, 'cough').
symptom_of(schistosomiasis, 'fever').

symptom_of(hookworm, 'itchy skin').
symptom_of(hookworm, 'rash').
symptom_of(hookworm, 'abdominal pain').
symptom_of(hookworm, 'diarrhea').
symptom_of(hookworm, 'lack of appetite').
symptom_of(hookworm, 'weight loss').
symptom_of(hookworm, 'fatigue').
symptom_of(hookworm, 'anemia').

cause_of('typhoid fever', 'intake of contaminated food or beverages').
cause_of('typhoid fever', 'travel to tropical regions').
cause_of('hepatitis a', 'poor sanitation').
cause_of('hepatitis a', 'sexually active').
cause_of('hepatitis a', 'contact with bodily fluids').
cause_of('hepatitis a', 'intake of contaminated food or beverages').
cause_of('active TB', 'exposure to people with TB').
cause_of('active TB', 'travel to tropical regions').
cause_of('active TB', 'living or working in tight places').
cause_of(leptospirosis, 'exposure to animal fluids').
cause_of(leptospirosis, 'intake of contaminated food or beverages').
cause_of(dengue, 'travel to tropical regions').
cause_of(influenza, 'exposure to people with flu').
cause_of(pneumonia, 'has HIV or AIDS').
cause_of(pneumonia, 'has chronic pulmonary diseases').
cause_of('hepatitis b', 'contact with bodily fluids').
cause_of('hepatitis b', 'sexually active').
cause_of(malaria, 'travel to tropical regions').
cause_of(schistosomiasis, 'exposure to animal fluids').
cause_of(hookworm, 'stayed outdoors with poor sanitation and hot temperatures').
cause_of(hookworm, 'bare contact with soil').

:- dynamic checked_symptoms/1.
:- dynamic symptom_flag/1.
:- dynamic risk_scores/1.
:- dynamic risk_ratings/1.

checked_symptoms([]).
symptom_flag(false).

% Define a rule to add a symptom to the list with a given severity score.
add_symptom(Disease,Symptom, SeverityScore) :-
    (not(symptom_flag(Symptom)), symptom_of(Disease, Symptom)),
    retract(checked_symptoms(Symptoms)),
    asserta(checked_symptoms([[Symptom, SeverityScore]|Symptoms])),
    asserta(symptom_flag(Symptom)).

% define valid choices for input in severity
validate_severity(Severity) :-
    number(Severity),Severity >= 1, Severity =< 4.

% Define the predicate to ask the user about symptom severity for a specific disease
ask_symptom_severity(Symptom, Severity) :-
    repeat,
    format("On a scale of 1 to 4, how severe is your ~w? ", [Symptom]),
    read(Severity),
    (validate_severity(Severity) ->
        !
    ;
        write('Invalid input. Please enter a number between 1 and 4.'), nl,
        fail
    ).

% Display a prompt to ask if the user is experiencing a particular
% symptom
ask_symptom(Symptom, Answer) :-
    repeat,
    format("Are you experiencing ~w? ", [Symptom]),
    read(Answer),
    (not(member(Answer, [yes, no]))
        -> write('Invalid input. Please enter either "yes" or "no".'), nl,
            fail
        ; !
    ).


% Compute weight of symptom severity
symptom_score(Disease, Symptom, Score) :-
    checked_symptoms(List),
    % Specific symptom has not yet been asked
    (not(member([Symptom,_], List)) ->

       ask_symptom(Symptom, Answer),

       (Answer == yes ->
           ask_symptom_severity(Symptom, Severity)
       ;
           Severity is 0
       ),
       weight(Severity, Disease, Score),
       add_symptom(Disease, Symptom, Score)

    ;
       member([Symptom, Score], List)

    ).


% Define the predicate to calculate the total symptom score for a specific disease
total_score(Disease, Score) :-
    findall(SymptomScore,
            (symptom_of(Disease, Symptom),
             symptom_score(Disease, Symptom, SymptomScore)
            ),
            Scores
           ),
    sum_list(Scores, Score).

count_symptoms(Disease, Count) :-
    findall(Symptom, symptom_of(Disease, Symptom), Symptoms),
    length(Symptoms, Count).

percentage(Actual, Total, Percent) :-
    Percent is (Actual / Total).

disease_risk([], []).
disease_risk([Disease | RestDiseases], [Risk | RestRisks]) :-
    findall(Symptom, symptom_of(Disease, Symptom), _),
    total_score(Disease, Score),
    count_symptoms(Disease, Count),
    percentage(Score, Count, Percent),
    (Percent =< 0.20 -> Risk = 'very low';
    Percent =< 0.40 -> Risk = low;
    Percent =< 0.60 -> Risk = medium;
   Percent =< 0.80 -> Risk = high;
    Risk = 'very high'),
    RiskScore is Percent,
    assertz(risk_scores(RiskScore)),
	assertz(risk_ratings(Risk)),nl,
    disease_risk(RestDiseases, RestRisks).

% Generates a list of potential diseases given the patients HPI and
% Chief Complaint

identify_potential_disease(Diseases, Complaint, Severity, Causes) :-
    weight(Severity, _, Score),
    add_symptom(_, Complaint, Score),
    (   Causes = []
    ->  findall(Disease, symptom_of(Disease, Complaint), DiseasesWithRepeats) % Case 2
    ;   findall(Disease, % Case 1
                (cause_of(Disease, Cause),
                 member(Cause, Causes),
                 symptom_of(Disease, Complaint)
                ),
                DiseasesWithRepeats
            )
    ),
    list_to_set(DiseasesWithRepeats, Placeholder), nl,

    ( Placeholder = []
    -> findall(Disease, (symptom_of(Disease, Complaint) ; (cause_of(Disease, Cause), member(Cause, Causes)) ),DiseasesWithNoRepeats), %Case 3
        list_to_set(DiseasesWithNoRepeats, Diseases), nl
    ;
        list_to_set(Placeholder, Diseases), nl
        ),
    write('TO REMOVE: You may have the following diseases: '), write(Diseases), nl, nl.

% Get the index of the largest risk score in the given list
index_of_max(List, Index) :-
    max_list(List, Max),
    nth0(Index, List, Max).

% Get the disease with the highest risk score
get_disease(Diseases, Diagnosis, Rating) :-
   findall(RiskScore, risk_scores(RiskScore), Scores),
   findall(RiskRating, risk_ratings(RiskRating), Ratings),
   index_of_max(Scores, Index),
   nth0(Index, Ratings, Rating),
   nth0(Index, Diseases, Diagnosis),nl.
