% Start the bot on load.
%:- initialization(run_on_load).

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
        write('Blood Pressure (systic/diastolic): '), read(BP),
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
    chief_complaint(Complaint, Severity),

    write('PART 3: Please answer the following questions:'), nl,
    ask_history(PName, Causes),

    identify_potential_disease(Disease, Complaint, Severity, Causes),

    write('PART 4: Please answer some additional questions to help me better diagnose you.'),nl,
    disease_risk(Disease, _),
    get_disease(Disease, Diagnosis, Rating),

    write('Present this information to a medical facility for further testing and diagnosis:'), nl,
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
	nl,
    write('Based on the symptoms you provided, our initial diagnosis is: '), write(Diagnosis), nl,
    write('Risk level/s: '), write(Rating), nl.

%run_on_load :-
%    chat.




