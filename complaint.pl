
hpi(Patient, []) :- !.
hpi(Patient, [Symptom|Rest]) :-
    write('Do you have '), write(Symptom), write('? (yes/no)'), nl,
    read(Response),
    (Response == yes ->
        assert(yes(Symptom, Patient));
        assert(no(Symptom, Patient))),
    hpi(Patient, Rest).



% Rules for identifying the chief complaint
chief_complaint(Patient, Symptoms) :-
    retractall(yes(_, Patient)),
    retractall(no(_, Patient)),
    write('What is your chief complaint?'), nl,
    read(Symptom),
    findall(Symptom, symptom(Symptom), Symptoms).


% TODO: Add ALL possible symptoms accross all diseases.
symptom(fever).
symptom(headache).
symptom(abdominal_pain).
symptom(loss_of_appetite).
symptom(rash).
symptom(cough).
symptom(sore_throat).
symptom(runny_or_stuffy_nose).
symptom(body_aches).
symptom(stomach_pain).
symptom(diarrhea).
symptom(weight_loss).
symptom(fatigue).
symptom(weakness).
symptom(anemia).
symptom(chills).
symptom(night_sweats).
symptom(joint_pain).
symptom(sluggishness).
symptom(nausea).
symptom(vomiting).
symptom(diarrhea).
symptom(constipation).
symptom(abdominal_pain).
symptom(chest_pain).
symptom(shortness_of_breath).
symptom(pain_with_breathing_or_coughing).
symptom(yellowing_of_skin_and_eyes(jaundice)).
symptom(itching).
symptom(bleeding).
symptom(confusion).
symptom(poor_reflexes).
symptom(bulging_soft_spot_on_the_head(babies)).
symptom(damage_in_the_lymph_system).
