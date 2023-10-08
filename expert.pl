
go:-
    write('SIMPLE EXPERT SYSTEM TO DIGNOSE DISEASE IN PROLOG'),
    nl,
    write('What is the patient name? '),
    read(Patient),
    hypothesis(Disease),
    write('Based on the symptoms,'),
    write(Patient),
    write(' probably has :'),
    write(Disease),
    nl,
    write('Take Care'),
    undo.
/*This are the hypothesis that should be tested. hypothesis is the disease that the patient might have.*/
hypothesis(cold) :- cold, !.
hypothesis(chikungunya) :- chikungunya, !.
hypothesis(dengue) :- dengue, !.
hypothesis(flu) :- flu, !.
hypothesis(typhoid) :- typhoid, !.
hypothesis(unknown). /* no diagnosis*/

/*These are the list of symptoms that the patient might have for each disease.*/
cold :-
    /*verify is a function that will ask the patient if he/she has the following symptoms.*/
    verify(headache),
    verify(runny_nose),
    verify(sneezing),
    verify(sore_throat),

    write('Advices and Sugestions:'),
    nl,
    write('1: Sumo Cold/tab'),
    nl,
    write('2: panadol/tab'),
    nl,
    write('3: Nasal spray'),
    nl,
    write('Please wear warm cloths Because and drink warm water.'),
    nl,
    write('Severity: LOW'),
    nl.
flu :-
    verify(fever),
    verify(headache),
    verify(chills),
    verify(body_ache),
    write('Advices and Sugestions:'),
    nl,
    write('1: Tamiflu/tab'),
    nl,
    write('2: panadol/tab'),
    nl,
    write('3: Zanamivir/tab'),
    nl,
    write('Please take a warm bath and do salt gargling.'),
    nl,
    write('Severity: MEDIUM'),
    nl.
typhoid :-
    verify(headache),
    verify(abdominal_pain),
    verify(poor_appetite),
    verify(fever),
    write('Advices and Sugestions:'),
    nl,
    write('1: ciprofloxacin/tab'),
    nl,
    write('2: Azithromycin/tab'),
    nl,
    write('Please do complete bed rest and take soft Diet Because'),
    nl,
    write('Severity: HIGH'),
    nl.
chikungunya :-
    verify(fever),
    verify(muscle_pain),
    verify(rash),
    verify(joint_pain),
    write('Advices and Sugestions:'),
    nl,
    write('1: Paracetamol (Acetaminophen)'),
    nl,
    write('2: ibuprofen'),
    nl,
    write('Please Get rest and use more liquid Because'),
    nl,
    write('Severity: HIGH'),
    nl.
dengue :-
    verify(fever),
    verify(body_ache),
    verify(headache),
    verify(rash),
    write('Advices and Sugestions:'),
    nl,
    write('1: Aralen/tab'),
    nl,
    write('2: Qualaquin/tab'),
    nl,
    write('3: Plaquenil/tab'),
    nl,
    write('4: Mefloquine'),
    nl,
    write('Rest, fluids, and over-the-counter pain relievers. If symptoms are severe, seek medical attention. Because '),
    nl,
    write('Severity: VERY HIGH'),
    nl.


ask(Question) :-
write('Does the patient have following symptom: '),
write(Question),
write('? '),
read(Response), 
nl,
( (Response == yes ; Response == y)
->
/*If the patient has the symptom, the system will assert yes(Question).*/
assert(yes(Question)) ;
/*If the patient does not have the symptom, the system will assert no(Question).*/
assert(no(Question)), fail).
/*dynamic is a function that will allow the system to assert yes(Question) and no(Question) during run time.*/
:- dynamic yes/1,no/1.


verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).

/*retract is a function that will remove yes(Question) and no(Question) during run time.*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.