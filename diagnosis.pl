% Rules for diagnosing diseases based on symptoms

:- consult('complaint.pl').

disease(Patient, typhoid_fever) :-
    yes(fever, Patient),
    yes(headache, Patient),
    yes(abdominal_pain, Patient),
    yes(loss_of_appetite, Patient),
    yes(rash, Patient).

disease(Patient, influenza) :-
    yes(fever, Patient),
    yes(cough, Patient),
    yes(sore_throat, Patient),
    yes(runny_or_stuffy_nose, Patient),
    yes(body_aches, Patient),
    yes(headache, Patient).

disease(Patient, hookworm) :-
    yes(stomach_pain, Patient),
    yes(diarrhea, Patient),
    yes(weight_loss, Patient),
    yes(fatigue, Patient),
    yes(weakness, Patient),
    yes(anemia, Patient).


% Rules for running the diagnostic expert system
diagnose(Patient) :-
    findall(Disease, disease(Patient, Disease), Diseases),
    (Diseases = [] ->
        writeln('Disease cannot be determined');
        writeln(Diseases)).