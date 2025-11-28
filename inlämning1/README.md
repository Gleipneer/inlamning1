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
Kopplar böcker till beställningar (jointable).  
Attribut: OrderID, BokID, Antal, Radpris.

---

	Relationer

En kund kan göra flera beställningar.  
En beställning kan innehålla flera böcker.  
Detta löser man med tabellen Orderrader, som binder ihop Beställningar och Böcker.

---

	Reflektioner

Svårigheter med ISBN (INT → VARCHAR → BIGINT)

När jag byggde tabellen Bocker fick jag problem med vilken datatyp jag skulle använda för kolumnen ISBN. Det som först såg enkelt ut visade sig ha flera praktiska fallgropar, och jag var tvungen att testa mig fram genom olika lösningar.

1. Jag började med INT
Först satte jag ISBN som INT, eftersom ISBN består av siffror. Det gav snabbt problem:
ISBN-13 är för långa för en vanlig INT

MySQL avrundar eller klipper stora heltal
Det gick inte att lägga in långa ISBN utan att tappa precision
Jag insåg att INT helt enkelt inte är byggt för så stora tal.

2. Jag bytte till VARCHAR
Mitt nästa steg var att ändra ISBN till VARCHAR, vilket löste problemet med längden. Men detta skapade nya frågor:
VARCHAR tillåter även bokstäver, även om ISBN ska vara numeriska
MySQL validerar inte om man råkar skriva "ABC123"
Det gör inmatningen mer flexibel, men mindre säker
Jag insåg att VARCHAR funkar, men inte ger någon kontroll över att värdet verkligen är numeriskt.

3. Slutligt val: BIGINT
Efter att ha provat båda alternativen och samtalat med lärare om problemet så valde jag BIGINT:
BIGINT klarar upp till 19 siffror → perfekt för ISBN-13
MySQL validerar automatiskt att värdet är numeriskt
Data blir mer konsekvent och lättare att söka/filtrera på
Detta blev den bästa kompromissen för just denna uppgift.

Sammanfattning av lärdomar
Jag lärde mig att välja datatyp inte handlar om att det “bara fungerar”, utan om vad som är mest korrekt och säkrast för datan som ska lagras. ISBN är ett bra exempel på en kolumn där man måste tänka både på längd, datavalidering och framtida hantering.

	ER-diagram

Diagrammet finns här:

images/er-diagram.png



