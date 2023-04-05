% Start the bot on load.
%:- initialization(run_on_load).

% Load necessary files
:- consult('complaint.pl').
:- consult('hpi.pl').
:- consult('diagnosis.pl').


% Knowledge base
:- dynamic patient_info/1.

% ask for patient information and store it in patient_info
ask_patient_info :-
    write('Full Name: '), read(PName),
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
        write('Do you drink alcohol? (yes/no): '), read(Alcoholic),
        (member(Alcoholic, [yes, no]) -> ! ; write('Please enter "yes" or "no" for alcohol consumption.'), nl, fail),
    assert(patient_info([name=PName,age=Age, sex=Sex, height=Height, weight=Weight, bp=BP, smokes=Smoker, drinks=Alcoholic])),nl,nl.

% Display patient_info (FOR CHECKING)
%  patient_info(PatientInfo),
%  write('Patient Info: '), nl,
%  write(PatientInfo), nl.

get_patient_name(PName) :-
    patient_info([name=PName | _]).

chat :-
    write('Hello! I am a Medical Chatbot designed to give you an initial diagnosis.'), nl,nl,
    write('Please be informed of our diagnostic process:'), nl, write('(1) Patient Data (2) Chief Complaint (3) History of Present Illness (4) Diagnosis.\n\n'), nl,

    write('PART 1: Please enter the patient information: '), nl,
    ask_patient_info,

    write('PART 2: Select your main reason for consultation:'), nl,
    chief_complaint(Complaint, Severity),

    write('PART 3: Please answer the following questions:'), nl,
    get_patient_name(PName),
    ask_history(PName, Causes),

    identify_potential_disease(Disease, Complaint, Severity, Causes),

    write('PART 4: Please answer some additional questions to help me better diagnose you.'),nl,
    disease_risk(Disease, Risk),

    get_disease,

    write('Present this information to a medical facility for further testing and diagnosis:'), nl,
    patient_info([name=PName, age=Age, sex=Sex, height=Height, weight=Weight, bp=BP, smokes=Smoker, drinks=Alcoholic]),
    write('Name: '), write(PName), nl,
    write('Age: '), write(Age), nl,
    write('Sex: '), write(Sex), nl,
    write('Height: '), write(Height), write(' cm'), nl,
    write('Weight: '), write(Weight), write(' kg'), nl,
    write('Blood Pressure: '), write(BP), write(' mmHg'), nl,
    write('Smoker: '), write(Smoker), nl,
    write('Alcoholic: '), write(Alcoholic), nl,
    write('Chief Complaint: '), write(Complaint), nl,
    write('Summary of patient history: '), write(Causes), nl,
    write('Based on the symptoms you provided, our initial diagnosis is: '), write(Disease), nl,
    write('The risk level for this disease is: '), write(Risk), nl.
    %get_disease.

%run_on_load :-
%    chat.




