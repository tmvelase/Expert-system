%To Start the system type start.
% Name : - Thamsanqa Dube

:- use_module(library(jpl)).
start :-sleep(0.4),	
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###################||| LUNG DISEASE EXPERT SYSTEM |||#########################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,
		
		
        /*write("Hi. How are you? First of all tell me your name Please : "),
        read(Patient),*/
		
		
		interface2.
		
	
%hypothesises

disease(Patient,tuberculosis):-
						symptom(Patient, persistent_cough),
						symptom(Patient, constant_fatigue),
						symptom(Patient, weight_loss),
						symptom(Patient, lack_of_appetite),
						symptom(Patient, fever),
						symptom(Patient, coughing_blood),
						symptom(Patient, night_sweats).
								
disease(Patient,pneumonia):-
						symptom(Patient, cough),
						symptom(Patient, fever),
						symptom(Patient, shaking_chills),
						symptom(Patient, shortness_of_breath).
							
disease(Patient,byssinosis):-
						symptom(Patient, chest_tightness),
						symptom(Patient, cough),
						symptom(Patient, wheezing).
						
disease(Patient,pertusis):-
						symptom(Patient, runny_nose),
						symptom(Patient, mild_fever).
						
disease(Patient,pneumoconiosis):-
						symptom(Patient,chronic_cough),
						symptom(Patient,shortness_of_breath).
						
disease(Patient,sarcoidosis):-
						symptom(Patient, dry_cough),
						symptom(Patient, shortness_of_breath),
						symptom(Patient, mild_chest_pain),
						symptom(Patient, scaly_rash),
						symptom(Patient, fever),
						symptom(Patient, red_bumps_on_legs),
						symptom(Patient, sore_eyes),
						symptom(Patient, swollen_ankles).
						
disease(Patient,asbestosis):-
						symptom(Patient, chest_tightness),
						symptom(Patient, shortness_of_breath),
						symptom(Patient, chest_pain),
						symptom(Patient, lack_of_appetite).
						

disease(Patient,asthma):-
						symptom(Patient, wheezing),
						symptom(Patient, cough),
						symptom(Patient, chest_tightness),
						symptom(Patient, shortness_of_breath).
						
disease(Patient,bronchiolitis):-
						symptom(Patient, wheezing),
						symptom(Patient, fever),
						symptom(Patient, blue_skin),
						symptom(Patient, rapid_breath).
						
disease(Patient,influenza):-
						symptom(Patient, headache),
						symptom(Patient, fever),
						symptom(Patient, shaking_chills),
						symptom(Patient, nasal_congestion),
						symptom(Patient, runny_nose),
						symptom(Patient, sore_throat).
						
disease(Patient,lung_cancer):-
						symptom(Patient, cough),
						symptom(Patient, fever),
						symptom(Patient, hoarseness),
						symptom(Patient, chest_pain),
						symptom(Patient, wheezing),
						symptom(Patient, weight_loss),
						symptom(Patient, lack_of_appetite),
						symptom(Patient, coughing_blood),
						symptom(Patient, headache),
						symptom(Patient, shortness_of_breath).
						

/*Ask rules*/

symptom(P, Val):-ask('Does the Patient have',Val).
ask(Obj, Val):-known(Obj, Val, true),!.
ask(Obj, Val):-known(Obj, Val, false),!, fail.
ask(Obj, Val):-nl,write(Obj),write(' '),
			write( Val) , write('?(y/n)'), read(Ans), !,
			((Ans=y, assert(known(Obj, Val, true)));(assert(known(Obj, Val, false)),fail)).
			
diagnose:-nl,write('Diagnosing a lung disease..........'),nl,disease(symptom,Disease) ,!,nl,
			write('That lung disease could be '), write(Disease).
diagnose:- nl, write('Sorry,we may not be able to diagnose the desease!!').

start:-notice,repeat, abolish(known/3),dynamic(known/3), retractall(known/3), diagnose,nl,nl, write('Try again ? (y/n)'),read(Resp),\+ Resp=y,
		nl,write('Bye ! Thanks for using this system'),abolish(known,3) .
interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- LUNG DISEASE EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).
	   		
interface2 :-
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- LUNG DISEASE EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'Hi. How are you? First of all tell me your name please'], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)
		->	write('you cancelled'),interface3('you cancelled. ','Thank you ','for use ','me.'),end,fail
		;	write("Hi. How are you? First of all tell me your name please : "),write(N),nl,pt(N)
	).
	
	
interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- LUNG DISEASE EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).
	
help :- write("To start the expert system please type 'start.' and press Enter key").
