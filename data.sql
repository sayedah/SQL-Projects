/*Sayeda Hussain 215427214 3421B Project 2*/

INSERT INTO Person VALUES
(123456789, 'Meredith Grey', '658 Goreway Crst', '905-123-4567'),
(467234266, 'Derek Shepperd', '1432 Preston Crst', '905-890-1234'),
(874539999, 'Cristina Yang', '9867 Norwood Blvd', '905-696-9764' ),
(565789234, 'Alex Karev', '3998 Western Skies Way', '905-398-5951'),
(778994567, 'Muhammad Hussain', '3956 Western Skies Way', '647-524-0285');

INSERT INTO Bubble VALUES
(123456789, 467234266),
(123456789, 874539999),
(467234266, 874539999),
(467234266, 778994567),
(565789234, 123456789);

INSERT INTO Place VALUES
('Goodlife Fitness Centre', '43.6273152, -79.7147136', 'A gym', '6767 Central Pkwy'),
('Creditvalley Hospital', '43.55906295776367, -79.70289611816406', 'A hospital ', '2200 Eglinton Ave W'),
('Meadowvale Community Centre', '43.58568572998, -79.75587463378', 'A community centre for recreational and sports activities', '6655 Glen Erin Dr'),
('Courtney Park Library', '43.623973846435, -79.710319519042', 'A library', '730 Courtneypark Rd'),
('Rick Hansen Secondary School', '43.588783264160156, -79.6830062866211', 'Public school for grades 9-12', '1150 Dream Crest'),
('Square One Shopping Centre', '43.59284210205078, -79.64259338378906', 'The citys largest shopping mall', '100 City Centre Dr'),
('Aquitane Clinic', '43.5365546, -79.6856955', 'Walk-in clinic and pharmacy. Open from 8am-10pm. Holds virus tests', '1125 Aquitane Rd'),
('Starbucks', '43.639007568359, -79.71630859', 'Coffee shop, open 24/7', '32 Saint Barbara Blvd'),
('Trillium Hospital', '43.5920521, -79.5759258', 'A hospital', '98 Trillium Rd'),
('CIBC Office', '43.5963689, -79.6405273', 'Mississauga located CIBC head office', '5037 Derry Rd E');

INSERT INTO TimeSlot VALUES
('2020-10-25 10:00:00'),
('2020-10-25 10:15:00'),
('2020-10-25 10:30:00'),
('2020-10-25 10:45:00'),
('2020-10-25 11:00:00'),
('2020-10-25 11:15:00'),
('2020-10-25 11:30:00'),
('2020-10-25 11:45:00'),
('2020-10-25 12:00:00'),
('2020-10-26 10:00:00'),
('2020-10-26 10:15:00'),
('2020-10-26 10:30:00'),
('2020-10-26 10:45:00'),
('2020-10-26 11:00:00'),
('2020-10-26 11:15:00'),
('2020-10-26 11:30:00'),
('2020-10-26 11:45:00'),
('2020-10-26 12:00:00'),
('2020-10-27 10:00:00'),
('2020-10-27 10:15:00'),
('2020-10-27 10:30:00'),
('2020-10-27 10:45:00'),
('2020-10-27 11:00:00'),
('2020-10-27 11:15:00'),
('2020-10-27 11:30:00'),
('2020-10-27 11:45:00'),
('2020-10-27 12:00:00');

INSERT INTO TestType VALUES
('Antigen Test'),
('Viral Test'),
('Antibody Test');

INSERT INTO Action VALUES
('No Action Required'),
('Come back for further testing'),
('Prescribe medication'),
('Admit into Hospital'),
('Quarantine at Home');

INSERT INTO Method VALUES
('contact-tracing phone app'),
('surveillance camera'),
('registry sign in'),
('registry sign out');


INSERT INTO TestCentre VALUES
('Aquitane Clinic'),
('Trillium Hospital'),
('Creditvalley Hospital');

INSERT INTO Offer VALUES
('Viral Test', 'Aquitane Clinic'),
('Antibody Test', 'Trillium Hospital'),
('Antigen Test', 'Trillium Hospital'),
('Viral Test', 'Trillium Hospital'),
('Antigen Test', 'Creditvalley Hospital'),
('Viral Test', 'Creditvalley Hospital'),
('Antibody Test', 'Creditvalley Hospital');


INSERT INTO Test VALUES
(123456789, '2020-10-25 10:15:00','Aquitane Clinic' , 'Viral Test', 'No Action Required'),
(123456789, '2020-10-26 10:30:00', 'Trillium Hospital', 'Antibody Test', 'No Action Required'),
(565789234, '2020-10-25 11:00:00', 'Creditvalley Hospital', 'Viral Test', 'Admit into Hospital'),
(778994567, '2020-10-26 11:00:00', 'Trillium Hospital', 'Viral Test', 'Quarantine at Home'),
(874539999, '2020-10-25 10:30:00', 'Creditvalley Hospital', 'Viral Test', 'No Action Required'),
(874539999, '2020-10-26 10:45:00','Creditvalley Hospital', 'Antibody Test', 'No Action Required'),
(874539999, '2020-10-27 11:15:00', 'Creditvalley Hospital', 'Antigen Test', 'No Action Required'),
(467234266, '2020-10-27 10:15:00', 'Aquitane Clinic', 'Viral Test', 'Quarantine at Home');


INSERT INTO Recon VALUES
/*cristina*/
(874539999, 'Creditvalley Hospital', '2020-10-25 10:15:00', 'registry sign in'),
(874539999, 'Creditvalley Hospital', '2020-10-25 10:45:00', 'registry sign out'),
(874539999, 'Creditvalley Hospital', '2020-10-26 10:45:00', 'registry sign in'),
(874539999, 'Creditvalley Hospital', '2020-10-26 11:00:00', 'registry sign out'),
(874539999, 'Creditvalley Hospital', '2020-10-27 11:15:00', 'registry sign in'),
(874539999, 'Creditvalley Hospital', '2020-10-27 11:30:00', 'registry sign out'),
(874539999, 'Square One Shopping Centre', '2020-10-26 11:00:00', 'surveillance camera'),
(874539999, 'Goodlife Fitness Centre', '2020-10-27 10:00:00', 'contact-tracing phone app'),
(874539999, 'Goodlife Fitness Centre', '2020-10-27 10:00:00', 'surveillance camera'),


/*meredith*/
(123456789, 'Aquitane Clinic', '2020-10-25 10:00:00', 'registry sign in'),
(123456789, 'Aquitane Clinic', '2020-10-25 10:30:00', 'registry sign out'),
(123456789, 'Trillium Hospital', '2020-10-26 10:15:00', 'registry sign in'),
(123456789, 'Trillium Hospital', '2020-10-26 10:45:00', 'registry sign out'),
(123456789, 'Aquitane Clinic', '2020-10-25 10:00:00', 'surveillance camera'),
(123456789, 'Starbucks', '2020-10-26 10:00:00', 'surveillance camera'),
(123456789, 'Square One Shopping Centre', '2020-10-26 11:00:00', 'surveillance camera'),

/*alex*/
(565789234, 'Creditvalley Hospital', '2020-10-25 10:45:00', 'registry sign in'),
(565789234, 'Creditvalley Hospital', '2020-10-25 11:15:00', 'registry sign out'),

/*muhammad*/
(778994567, 'Goodlife Fitness Centre', '2020-10-25 10:30:00', 'contact-tracing phone app'),
(778994567, 'Goodlife Fitness Centre', '2020-10-25 10:30:00', 'surveillance camera'),
(778994567, 'Trillium Hospital', '2020-10-26 10:45:00', 'registry sign in'),
(778994567, 'Trillium Hospital', '2020-10-26 11:15:00', 'registry sign out'),

/*derek*/
(467234266, 'Courtney Park Library', '2020-10-25 11:15:00', 'contact-tracing phone app'),
(467234266,  'Aquitane Clinic', '2020-10-27 10:00:00', 'registry sign in'),
(467234266, 'Aquitane Clinic', '2020-10-27 10:30:00', 'registry sign out'),
(467234266, 'Aquitane Clinic', '2020-10-27 10:30:00', 'surveillance camera');
