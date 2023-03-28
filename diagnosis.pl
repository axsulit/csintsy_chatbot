% Rules for diagnosing diseases based on symptoms

:- consult('complaint.pl').

disease(Patient, typhoid_fever) :-
    yes(fever, Patient),
    yes(headache, Patient),
    %general aches and pains
    yes(abdominal_pain, Patient),
    yes(joint_pain, Patient),
    yes(chest_pain, Patient),
    yes(abdominal_pain, Patient),
    yes(body_aches, Patient),
    yes(fatigue, Patient),
    yes(cough, Patient),
    yes(constipation, Patient),
    yes(loss_of_appetite, Patient),
    yes(rash, Patient),
    yes(upset_stomach, Patient),
    yes(diarrhea, Patient).

disease(Patient, hepatitis_a) :-
    yes(yellowing_of_skin_and_eyes, Patient),
    yes(loss_of_appetite, Patient),
    yes(upset_stomach, Patient),
    yes(vomiting, Patient),
    yes(stomach_pain, Patient),
    yes(fever, Patient),
    yes(joint_pain, Patient),
    yes(fatigue, Patient).

disease(Patient, tuberculosis) :-
    yes(cough, Patient),
    yes(pain_with_breathing_or_coughing, Patient),
    yes(fever, Patient),
    yes(chills, Patient),
    yes(night_sweats, Patient),
    yes(weight_loss, Patient),
    yes(chest_pain, Patient),
    yes(fatigue, Patient),
    yes(weakness, Patient),
    yes(slugishness, Patient),
    yes(confusion, Patient),
    yes(vomiting, Patient),
    yes(bulging_soft_spot_on_the_head, Patient),
    yes(poor_reflexes, Patient),
    yes(loss_of_appetite, Patient).
    
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
