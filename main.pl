% Start the bot on load.
:- initialization(run_on_load).

% Knowledge base
:- dynamic patient_info/1.

% ask for patient information and store it in patient_info
ask_patient_info :-
    write('PART 1: Please enter the patient information: '), nl,
    write('Age: '), read(Age),
    write('Gender (male/female): '), read(Gender),
    write('Height (in cm): '), read(Height),
    write('Weight (in kg): '), read(Weight),
    write('Blood Pressure (in mmHg): '), read(BP),
    write('Do you smoke? Yes/No: '), read(Smoker),
    write('Do you drink alcohol? Yes/No: '), read(Alcoholic),
    assert(patient_info([age=Age, gender=Gender, height=Height, weight=Weight, bp=BP, smokes=Smoker, drinks=Alcoholic])),
    write('Patient information stored successfully.'), nl.

% Display patient_info (FOR CHECKING)
%  patient_info(PatientInfo),
%  write('Patient Info: '), nl,
%  write(PatientInfo), nl.

chat :-
    write('Hello! I am a Medical Chatbot designed to give you an initial diagnosis.\nPlease be informed of our diagnostic process: (1) Patient Data (2) Symptoms (3) Diagnosis.\n\n'), nl,
    ask_patient_info.

run_on_load :-
    chat.
