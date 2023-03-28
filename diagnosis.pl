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
    yes(cough_with_blood, Patient),
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
    
disease(Patient, leptospirosis) :-
    yes(fever, Patient),
    yes(headache, Patient),
    yes(chills, Patient),
    yes(vomiting, Patient),
    yes(body_aches, Patient),
    yes(yellowing_of_skin_and_eyes, Patient),
    yes(abdominal_pain, Patient),
    yes(diarrhea, Patient),
    yes(rash, Patient),
    yes(red_eyes, Patient).
    
disease(Patient, dengue) :-
    yes(nausea, Patient),
    yes(vomiting, Patient),
    yes(rash, Patient),
    %aches and pains
    yes(eye_pain, Patient),
    yes(body_aches, Patient),
    yes(joint_pain, Patient),
    yes(bone_pain, Patient),
    yes(abdominal_pain, Patient),
    yes(bleeding_from_nose_or_gums, Patient),
    yes(vomiting_with_blood_or_in_stool, Patient),
    yes(vomiting, Patient),
    yes(weakness, Patient),
    yes(irritable, Patient),
    yes(fatigue, Patient).
    
disease(Patient, influenza) :-
    yes(fever, Patient),
    yes(cough, Patient),
    yes(sore_throat, Patient),
    yes(runny_or_stuffy_nose, Patient),
    yes(body_aches, Patient),
    yes(headache, Patient),
    yes(vomiting, Patient),
    yes(diarrhea, Patient),
    yes(fatigue, Patient).
    
disease(Patient, pneumonia) :-
    yes(pain_with_breathing_or_coughing, Patient),
    yes(cough, Patient),
    yes(fever, Patient),
    yes(sweating, Patient),
    yes(chills, Patient),
    yes(nausea, Patient),
    yes(shortness_of_breath, Patient),
    yes(confusion, Patient),
    yes(lower_than_normal_body_temp, Patient),
    yes(vomiting, Patient),
    yes(diarrhea, Patient),
    yes(fatigue, Patient).
    
disease(Patient, hepatitis_b) :-
    yes(fever, Patient),
    yes(nausea, Patient),
    yes(fatigue, Patient),
    yes(loss_of_appetite, Patient),
    yes(vomiting, Patient),
    yes(abdominal_pain, Patient),
    yes(dark_urine, Patient),
    yes(clay-colored_stool, Patient),
    yes(joint_pain, Patient),
    yes(yellowing_of_skin_and_eyes, Patient).
    
disease(Patient, malaria) :-
    yes(fever, Patient),
    yes(chills, Patient),
    yes(sweating, Patient),
    yes(headache, Patient),
    yes(body_aches, Patient),
    yes(fatigue, Patient),
    yes(chest_pain, Patient),
    yes(pain_with_breathing_or_coughing, Patient),
    yes(cough, Patient),
    yes(diarrhea,Patient),
    yes(nausea, Patient),
    yes(vomiting, Patient).
    
  disease(Patient, schistosomiasis) :-
    yes(rash, Patient),
    yes(itchiness, Patient),
    yes(fever, Patient),
    yes(chills, Patient),
    yes(cough, Patient),
    yes(body_aches, Patient),
    yes(upset_stomach, Patient),
    yes(bleeding), Patient),
    yes(difficulty_urinating, Patient),
    yes(diarrhea,Patient),
    yes(nausea, Patient),
    yes(vomiting, Patient).

disease(Patient, hookworm) :-
    yes(itching, Patient),
    yes(localized_rash, Patient),
    yes(stomach_pain, Patient),
    yes(abdominal_pain, Patient),
    yes(diarrhea, Patient),
    yes(weight_loss, Patient),
    yes(fatigue, Patient),
    yes(weakness, Patient),
    yes(anemia, Patient).
    
 disease(Patient, lymphatic_filariasis) :-
    yes(lymphedema, Patient),
    yes(swelling_of_the_scrotum, Patient)
    yes(damage_in_the_lymph_system, Patient).


% Rules for running the diagnostic expert system
diagnose(Patient) :-
    findall(Disease, disease(Patient, Disease), Diseases),
    (Diseases = [] ->
        writeln('Disease cannot be determined');
        writeln(Diseases)).
