% Load necessary files
:- consult('complaint.pl').
:- consult('hpi.pl').
:- consult('diagnosis.pl').

% Knowledge base
:- dynamic patient_info/1.

% Ask for patient information and store it in patient_info
ask_patient_info :-
    write('Name: '), read(PName),
    repeat,
	write('Age: '), read(Age),
	(integer(Age) -> ! ; write('Please enter a valid integer for age.'), nl, fail),
    repeat,
	write('Sex (m/f): '), read(Sex),
	 (member(Sex, [m, f]) -> ! ; write('Please enter "m" or "f" for sex.'), nl, fail),
    repeat,
        write('Height (in cm): '), read(Height),
        (integer(Height) -> ! ; write('Please enter a valid integer for height.'), nl, fail),
    repeat,
        write('Weight (in kg): '), read(Weight),
        (integer(Weight) -> ! ; write('Please enter a valid integer for weight.'), nl, fail),
        write('Blood Pressure (systolic/diastolic): '), read(BP),
    repeat,
        write('Do you smoke? (yes/no): '), read(Smoker),
        (member(Smoker, [yes, no]) -> ! ; write('Please enter "yes" or "no" for smoking status.'), nl, fail),
    repeat,
        write('How often do you drink alcohol? (never/occasional/moderate/excessive): '), read(Alcoholic),
        (member(Alcoholic, [never, occasional, moderate, excessive]) -> ! ; write('Please enter a valid answer for alcohol consumption.'), nl, fail),
    assert(patient_info([name=PName,age=Age, sex=Sex, height=Height, weight=Weight, bp=BP, smokes=Smoker, drinks=Alcoholic])),nl,nl.

%Facilitate conversation between patient and chatbot.
chat :-
    write('Hello! I am a Medical Chatbot specialized in Contagious Diseases that is designed to give you an initial diagnosis.'), nl,nl,
    write('Please be informed of our diagnostic process:'), nl, write('(1) Patient Data (2) Chief Complaint (3) History of Present Illness (4) Diagnosis.\n\n'), nl,

    write('PART 1: Please enter the patient information: '), nl,
    ask_patient_info,
	patient_info([name=PName, age=Age, sex=Sex, height=Height, weight=Weight, bp=BP, smokes=Smoker, drinks=Alcoholic]),
	
    write('PART 2: Select your main reason for consultation:'), nl,
    chief_complaint(Complaint, Severity), nl, nl,

    write('PART 3: Please answer the following questions:'), nl,
    ask_history(PName, Causes), nl,

    identify_potential_disease(Disease, Complaint, Severity, Causes),

    write('PART 4: Please answer some additional questions to help me better diagnose you.'),nl,
    write('If you answer NO, it will be assumed that you do not have a symptom, thus your symptom severity will be considered zero.'),nl,
    write('If you answer YES, please indicate the severity using the following scale: '),nl,
    write('1 | Mild'), nl,
    write('2 | Moderate'), nl,
    write('3 | Severe'), nl,
    write('4 | Very Severe'), nl, nl,
    disease_risk(Disease, _),
    get_disease(Disease, Diagnosis, Rating),
	
	(
	   Rating = low ; Rating = 'very low'
	   -> write('My apologies, but I am unable to identify your condition with the information you have provided. It would be best to \nseek the advice of a healthcare professional at a large medical facility who can conduct a thorough physical \nexamination and perform any necessary tests to give you an accurate diagnosis.')
	   ; 
		  format('Based on the symptoms you have described, our initial diagnosis suggests that you have ~w with a ~w risk level. \nNonetheless, it is still advised to see a healthcare professional for a complete evaluation and treatment plan as soon \nas possible. If symptoms worsen or emergency symptoms arise, please seek immediate medical attention.', [Diagnosis, Rating]) 
	),
	
    write('\n\nShould you go to a medical facility, you may present this information for further evaluation:'), nl,
    write('Name: '), write(PName), nl,
    write('Age: '), write(Age), nl,
    write('Sex: '), write(Sex), nl,
    write('Height: '), write(Height), write(' cm'), nl,
    write('Weight: '), write(Weight), write(' kg'), nl,
    write('Blood Pressure: '), write(BP), write(' mmHg'), nl,
    write('Smoker: '), write(Smoker), nl,
    write('Alcohol Consumption: '), write(Alcoholic), nl,
	nl,
    write('Chief Complaint: '), write(Complaint), nl,
    write('Summary of patient history: '), write(Causes), nl,
	nl.

