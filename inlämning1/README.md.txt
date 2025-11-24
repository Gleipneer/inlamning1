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

	ER-diagram

Diagrammet finns här:

images/er-diagram.png


