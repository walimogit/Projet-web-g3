#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------
create database web;

use web;

#------------------------------------------------------------
# Table: Representative
#------------------------------------------------------------

CREATE TABLE Representative(
        IdRep       Int  Auto_increment  NOT NULL ,
        NameRep     Varchar (30) NOT NULL ,
        LastNameRep Varchar (30) NOT NULL ,
        UsernameR   Varchar (50) NOT NULL ,
        PasswordR   Varchar (50) NOT NULL ,
        CesiMember  Bool NOT NULL ,
        Center      Enum ("Alger")
	,CONSTRAINT Representative_PK PRIMARY KEY (IdRep)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Company
#------------------------------------------------------------

CREATE TABLE Company(
        IdCompany       Int  Auto_increment  NOT NULL ,
        NameCompany     Varchar (100) NOT NULL ,
        DescriptionComp Varchar (100) NOT NULL ,
        CompanyMail     Varchar (100) NOT NULL ,
        ActivitySector  Varchar (100) NOT NULL ,
        NbIntern        Int NOT NULL
	,CONSTRAINT Company_PK PRIMARY KEY (IdCompany)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Pilot
#------------------------------------------------------------

CREATE TABLE Pilot(
        IdPilot       Int  Auto_increment  NOT NULL ,
        NamePilot     Varchar (50) NOT NULL ,
        LastNamePilot Varchar (50) NOT NULL ,
        UsernameP     Varchar (50) NOT NULL ,
        PasswordP     Varchar (50) NOT NULL ,
        center        Enum ("Alger") NOT NULL ,
        IdCompany     Int
	,CONSTRAINT Pilot_PK PRIMARY KEY (IdPilot)

	,CONSTRAINT Pilot_Company_FK FOREIGN KEY (IdCompany) REFERENCES Company(IdCompany)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Promo
#------------------------------------------------------------

CREATE TABLE Promo(
        IdPromo Int  Auto_increment  NOT NULL ,
        Promo   Enum ("A1","A2","A3","A4","A5") NOT NULL ,
        Major   Enum ("Web Dev","App Dev","Cyber Security","Networking","Data science") NOT NULL ,
        IdPilot Int NOT NULL ,
        IdRep   Int NOT NULL
	,CONSTRAINT Promo_PK PRIMARY KEY (IdPromo)

	,CONSTRAINT Promo_Pilot_FK FOREIGN KEY (IdPilot) REFERENCES Pilot(IdPilot)
	,CONSTRAINT Promo_Representative0_FK FOREIGN KEY (IdRep) REFERENCES Representative(IdRep)
	,CONSTRAINT Promo_Representative_AK UNIQUE (IdRep)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Student
#------------------------------------------------------------

CREATE TABLE Student(
        IdStudent       Int  Auto_increment  NOT NULL ,
        NameStudent     Varchar (50) NOT NULL ,
        LastNameStudent Varchar (50) NOT NULL ,
        UsernameS       Varchar (50) NOT NULL ,
        PasswordS       Varchar (50) NOT NULL ,
        Center          Enum ("Alger") NOT NULL ,
        IdPromo         Int NOT NULL
	,CONSTRAINT Student_PK PRIMARY KEY (IdStudent)

	,CONSTRAINT Student_Promo_FK FOREIGN KEY (IdPromo) REFERENCES Promo(IdPromo)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Offer
#------------------------------------------------------------

CREATE TABLE Offer(
        IdOffer     Int  Auto_increment  NOT NULL ,
        NameOffer   Varchar (50) NOT NULL ,
        DescOffer   Varchar (100) NOT NULL ,
        IntLevel    Enum ("A1","A2","A3","A4","A5") NOT NULL ,
        IntDuration Varchar (100) NOT NULL ,
        BaseRemun   Float NOT NULL ,
        NbPosts     Int NOT NULL ,
        DateOffer   Date NOT NULL ,
        IdCompany   Int NOT NULL
	,CONSTRAINT Offer_PK PRIMARY KEY (IdOffer)

	,CONSTRAINT Offer_Company_FK FOREIGN KEY (IdCompany) REFERENCES Company(IdCompany)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Skill
#------------------------------------------------------------

CREATE TABLE Skill(
        IdSkill   Int  Auto_increment  NOT NULL ,
        SkillName Varchar (100) NOT NULL ,
        IdOffer   Int
	,CONSTRAINT Skill_PK PRIMARY KEY (IdSkill)

	,CONSTRAINT Skill_Offer_FK FOREIGN KEY (IdOffer) REFERENCES Offer(IdOffer)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Address
#------------------------------------------------------------

CREATE TABLE Address(
        IdAddress Int  Auto_increment  NOT NULL ,
        City      Varchar (25) NOT NULL ,
        Street    Varchar (30) NOT NULL ,
        Zipcode   Int NOT NULL ,
        IdCompany Int NOT NULL
	,CONSTRAINT Address_PK PRIMARY KEY (IdAddress)

	,CONSTRAINT Address_Company_FK FOREIGN KEY (IdCompany) REFERENCES Company(IdCompany)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Perms
#------------------------------------------------------------

CREATE TABLE Perms(
        Id_perm   Int  Auto_increment  NOT NULL ,
        Name_perm Varchar (100) NOT NULL
	,CONSTRAINT Perms_PK PRIMARY KEY (Id_perm)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Rates
#------------------------------------------------------------

CREATE TABLE Rates(
        IdCompany Int NOT NULL ,
        IdStudent Int NOT NULL
	,CONSTRAINT Rates_PK PRIMARY KEY (IdCompany,IdStudent)

	,CONSTRAINT Rates_Company_FK FOREIGN KEY (IdCompany) REFERENCES Company(IdCompany)
	,CONSTRAINT Rates_Student0_FK FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Wishes
#------------------------------------------------------------

CREATE TABLE Wishes(
        IdStudent Int NOT NULL ,
        IdOffer   Int NOT NULL
	,CONSTRAINT Wishes_PK PRIMARY KEY (IdStudent,IdOffer)

	,CONSTRAINT Wishes_Student_FK FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent)
	,CONSTRAINT Wishes_Offer0_FK FOREIGN KEY (IdOffer) REFERENCES Offer(IdOffer)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Posseses
#------------------------------------------------------------

CREATE TABLE Posseses(
        IdSkill   Int NOT NULL ,
        IdStudent Int NOT NULL
	,CONSTRAINT Posseses_PK PRIMARY KEY (IdSkill,IdStudent)

	,CONSTRAINT Posseses_Skill_FK FOREIGN KEY (IdSkill) REFERENCES Skill(IdSkill)
	,CONSTRAINT Posseses_Student0_FK FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Applies
#------------------------------------------------------------

CREATE TABLE Applies(
        IdOffer          Int NOT NULL ,
        IdStudent        Int NOT NULL ,
        cv               Mediumblob NOT NULL ,
        Status           Varchar (50) NOT NULL ,
        MotivationLetter Mediumblob NOT NULL ,
        ValidationForm   Mediumblob NOT NULL ,
        Conventions      Mediumblob NOT NULL
	,CONSTRAINT Applies_PK PRIMARY KEY (IdOffer,IdStudent)

	,CONSTRAINT Applies_Offer_FK FOREIGN KEY (IdOffer) REFERENCES Offer(IdOffer)
	,CONSTRAINT Applies_Student0_FK FOREIGN KEY (IdStudent) REFERENCES Student(IdStudent)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: perm_Rep
#------------------------------------------------------------

CREATE TABLE perm_Rep(
        IdRep   Int NOT NULL ,
        Id_perm Int NOT NULL
	,CONSTRAINT perm_Rep_PK PRIMARY KEY (IdRep,Id_perm)

	,CONSTRAINT perm_Rep_Representative_FK FOREIGN KEY (IdRep) REFERENCES Representative(IdRep)
	,CONSTRAINT perm_Rep_Perms0_FK FOREIGN KEY (Id_perm) REFERENCES Perms(Id_perm)
)ENGINE=InnoDB;

