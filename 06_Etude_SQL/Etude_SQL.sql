-- Jointures SQL

-- --------------------

-- Le produit cart�sien
-- ====================

select Prenom, Nom, pays
 from employes, Pays;

-- Il s'agit de toutes les combinaisons possibles entre les lignes des tables utilis�es

-- Jointure interne
-- ====================

select prenom, nom, pays

from Employes, pays

where Employes.idPays = Pays.idPays;

-- Fusion des filtres
-- Affichage uniquement des habitants du pays 1

SELECT
 
    prenom, nom, pays

FROM
    Employes,
    pays

WHERE
    Employes.idPays = Pays.idPays
        
	AND pays = 'Pays 1';

-- L'ordre des filtres dans la clause where n'a pas d'impact sur le resultat mais peut avoir un large impact sur le temps d'execution
-- Pour dimunuer ces temps d'execution, il faut penser � executer les filtres metiers d'abord pour minimiser la quantit� des donn�es prises en compte dans le produit cart�sien

SELECT
 
    prenom, nom, pays

FROM
    Employes,
    pays

WHERE
   pays = 'Pays 1'       
	AND Employes.idPays = Pays.idPays
  ;

-- On peut ajouter d'autres clauses :

SELECT
 
    prenom, nom, pays

FROM
    Employes,
    pays

WHERE
   pays = 'Pays 1'       
	AND Employes.idPays = Pays.idPays
  
order by Nom DESC;


-- alias de table

SELECT
 
    prenom, nom, pays

FROM
    Employes E,
    pays P
WHERE
   pays = 'Pays 1'       
	AND E.idPays = P.idPays
  ;

-- Jointure interne sur plusieurs tables
-- ===================

-- Affichage du nom, pr�nom, idPays, pays et societe de l'employ�

SELECT 
    Nom, Prenom, pays 'Pays Employ�', societe

FROM
    employes,
    pays,
    societes

WHERE
    employes.idPays = pays.idPays

        AND employes.idSociete = Societes.idSociete;

-- Ajout d'un filtre m�tier
-- Ne retiendra que les employ�s qui habitent 'pays 1'


SELECT 
    Nom, Prenom, pays 'Pays Employ�', societe

FROM
    employes,
    pays,
    societes

WHERE
    employes.idPays = pays.idPays
        
AND employes.idSociete = Societes.idSociete
        
and pays = 'Pays 1';

-- On remarque que cette syntaxe ('89) ne fait pas la diff�rence entre les conditions de jointure et les conditions m�tiers -> erreurs et confusions possibles

-- Affichage en plus du nom du pays de la societe
SELECT 
    Nom, Prenom, pays 'Pays Employ�', societe, pays "Pays societe"

FROM
    employes,
    pays,
    societes

WHERE
    employes.idPays = pays.idPays
        
AND employes.idSociete = Societes.idSociete
        
and societes.idPays = pays.idPays
;

-- On remarque une erreur:
-- Le resultat ne contient que les employ�s travaillant pour le une societe ayant le m�me pays que le pays de l'employ�

-- Ceci est du � la transitivit� que nous avons mis en place sans s'en rendre compte :
employes.idPays = pays.idPays
societes.idPays = pays.idPays
-- Donc 
employes.idPays = societes.idPays


-- Pour �viter cette transitivit�, je devrais utiliser deux tables pays avec le m�me contenu

-- C�t� ordre SQL, cette version correcte doit utiliser 2 fois la table Pays (une fois pour les Employes, une autre fois pour les soci�t�s) avec des alias diff�rents (ici P1 et P2)

SELECT 
    Nom, Prenom, P1.pays 'Pays Employ�', societe, P2.pays "Pays societe"

FROM
    employes,
    pays P1,
    societes,
    pays P2

WHERE
    employes.idPays = P1.idPays
        
AND employes.idSociete = Societes.idSociete
        
AND societes.idPays = P2.idPays
;

-- Si on ajoute une condition m�tier
SELECT 
    Nom, Prenom, P1.pays 'Pays Employ�', societe, P2.pays "Pays societe"

FROM
    employes,
    pays P1,
    societes,
    pays P2

WHERE
    employes.idPays = P1.idPays
        
AND employes.idSociete = Societes.idSociete
        
AND societes.idPays = P2.idPays

AND P1.Pays = 'Pays 1';


-- Exercice :
-- Afficher le nom, pr�nom, idPays et la societe de l'employ� habitant Pays 1 et travaillant pour une soci�t� domicili�e dans Pays 4 :

SELECT 
    Nom,
    Prenom,
    P1.pays 'Pays Employ�',
    societe,
    P2.pays 'Pays societe'

FROM
    employes,
    pays P1,
    societes,
    pays P2

WHERE
    employes.idPays = P1.idPays
        
AND employes.idSociete = Societes.idSociete
        
AND societes.idPays = P2.idPays
        
AND P1.Pays = 'Pays 1'
        
AND P2.pays = 'pays 4';


-- Autojointure = jointure d'une table � elle-m�me
-- ===================

-- afficher les nom/pr�noms des responsables et le nom du responsable pour chaque employ�
-- Ici aussi les alias de tables sont n�c�ssaires :

SELECT 
    E.Nom, E.Prenom, R.Nom 'Nom Responsable'

FROM
    employes E,
    employes R

WHERE
    E.idResponsable = R.idEmploye;

-- Les jointures selon la norme SQL92
-- ====================

-- Le produit cart�sien (la clause CROSS JOIN)
-- ===========================================

-- La requete :
select prenom, nom, pays

from Employes, pays

;

-- Devient :
SELECT 
    prenom, nom, pays

FROM
    Employes
        
CROSS JOIN
    Pays;

-- Jointure interne (clause INNER JOIN - ou JOIN)
-- ==============================================


select prenom, nom, pays

from Employes, pays

where Employes.idPays = Pays.idPays;

-- Devient :

select prenom, nom, pays

from Employes

where Employes.idPays = Pays.idPays;

-- Syntaxe = join tableX on condition etc.

SELECT 
    prenom, nom, pays

FROM
    Employes
        
INNER JOIN
    pays 
ON Employes.idPays = Pays.idPays;

-- Imposons une condition m�tier pour n'afficher que les employes qui habitent Pays 1 :

SELECT 
    prenom, nom, pays
FROM
    Employes
        
INNER JOIN
    pays 
ON Employes.idPays = Pays.idPays

WHERE
    pays = 'Pays 1';

-- L'utilisation des alias des tables reste toujours possible et est m�me conseill� :

SELECT 
    prenom, nom, pays

FROM
    Employes E
        
INNER JOIN
    pays P 
    
ON E.idPays = P.idPays

WHERE
    pays = 'Pays 1';

-- Jointures internes sur plusieurs tables (fa�on 92)
-- ==================================================



















-- Biblio :
-- George Gardarin

