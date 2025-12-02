Inlämning 1 – Databaser  
Joakim Emilsson – YH24  

Syftet med databasen är att hålla koll på kunder, böcker och beställningar i en liten bokhandel. 
Systemet ska visa vilka böcker som finns i lager, vilka som är köpta, av vem och när.

Jag valde att dela upp databasen i fyra tabeller – Kunder, Böcker, Beställningar och Orderrader – för att undvika dubbel data och få tydliga relationer. 
En kund kan göra flera beställningar, och varje beställning kan innehålla flera böcker.
Orderrader används därför för att koppla samman vilka böcker som ingår i varje beställning.

---

Databasens tabeller

	Kunder

Lagrar information om kunder som kan göra beställningar.  
Attribut: Namn, Email, Telefon, Adress, Registreringsdatum.

	Böcker

Lagrar butikens böcker.  
Attribut: Titel, ISBN, Författare, Pris, Lagerstatus.

	Beställningar

Representerar köp som kunder gör.  
Attribut: OrderID, KundID, Datum, Totalbelopp.

	Orderrader

Fungerar som en kopplingsabell (jointable), mellan Beställningar och Böcker. Den möjliggör den många till många relation som uppstår när en beställning kan innehålla flera böcker och en bok kan förekomma i flera beställningar.

---

	Relationer

En kund kan göra flera beställningar.  
En beställning kan innehålla flera böcker. 

För att hantera detta skapar man tabellen orderrader, som fungerar som en kopplingstabell mellan Beställningar och Böcker.

Orderrader gör att samma bok kan förekomma i flera beställningar och att en beställning kan innehålla flera böcker. Detta är nödvändigt för att "normalisera" databasen, vilket innebär att: varje tabell ska innehålla en sak, varje kolumn ska ha ett värde per cell och att ingen data ska dupliceras i onödan. Som jag förstått det blir databasen även effektivare att söka i och långt mer prestanda effektiv i synnerhet i stora databaser.
 
---

	Reflektioner

När jag byggde tabellen Bocker fick jag problem med vilken datatyp jag skulle använda för kolumnen ISBN. Det som först såg enkelt ut visade sig ha flera praktiska fallgropar, och jag var tvungen att testa mig fram genom olika lösningar.

1. Jag började med INT
Först satte jag ISBN som INT, eftersom ISBN består av siffror. Det gav ganska snart problem.
ISBN är för långa för en vanlig INT

2. Jag bytte till VARCHAR
Mitt nästa steg var att ändra ISBN till VARCHAR, vilket löste problemet med längden. Men detta skapade nya frågor:
VARCHAR tillåter även bokstäver, även om ISBN ska vara numeriska
MySQL validerar inte om man råkar skriva "ABC123"
Det gör inmatningen mer flexibel, men mindre säker.
Jag insåg att VARCHAR funkar, men inte ger någon kontroll över att värdet verkligen är numeriskt.

3. Slutligt val: BIGINT
Efter att ha provat båda alternativen och samtalat med lärare om problemet så valde jag BIGINT:
BIGINT klarar upp till 19 siffror → perfekt för ISBN.
MySQL validerar automatiskt att värdet är numeriskt
Data blir mer konsekvent och lättare att söka/filtrera på
Detta blev den bästa kompromissen för just denna uppgift.


Svårigheter

Val av rätt datatyper.
Vilken datatyp man använder avgör hur säker, korrekt och sökbar datan blir.

Att förstå varför orderrader (många till många) behövs.
Utan Orderrader hade strukturen blivit fel och svår att söka i.

Vad är normalisering?
Det tog ett tag innan jag förstod normaliseringen.
Inget ska upprepas i onödan, varje tabell ska representera en sak och varje kolumn ska hålla ett värde.



	ER-diagram

Diagrammet finns här:

images/er-diagram.png


