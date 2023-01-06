with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use  Ada.Text_IO.Unbounded_IO;

package Routeur_Simple is

   type T_Table is private;

   type T_Adresse_IP is mod 2 ** 32;

   -- Lire et traduire la ligne de commande
   procedure Analyser_L_Commande (T_Fichier : out Unbounded_String; P_Fichier : out Unbounded_String; R_Fichier : out Unbounded_String);
   -- Enregistrer une route dans la table

   procedure Enregistrer_Table(Table : in out T_Table; D : in T_Adresse_IP; M : in T_Adresse_IP; I : in Unbounded_String) ;

   -- Lire un partie entiere d'une ligne d'un fichier
   procedure Get_IP (Fichier : in File_Type; IP : out T_Adresse_IP);

   procedure Commande_Paquets(Paquets_txt : in File_Type; Stop : out Boolean; i : in out Integer; Table : in  T_Table; IP : out T_Adresse_IP);

   procedure Chercher_Table (Table : in T_Table; IP : in T_Adresse_IP; M_Trouve_T : out T_Adresse_IP; Int : out Unbounded_String);

   -- Initialiser la table de routage à travers le fichier texte
   procedure Remplire_Table (Fichier : in File_Type; Table :in out T_Table) ;

   -- Afficher le contenu de la Table de routage
   procedure Afficher_T (Table : in  T_Table);

   -- chercher la bonne route et remplir le ficher resultats.txt
   procedure Donner_Resultats (Table : in out T_Table);

   generic
		with procedure Traiter (Destination : in T_Adresse_IP; Masque: in T_Adresse_IP; Int : in Unbounded_String);
   procedure Pour_Chaque (Table: in T_Table);

private
   type T_Route_Table;

   type T_Table is access T_Route_Table;

   type T_Route_Table is record
      Destination : T_Adresse_IP;
      Masque : T_Adresse_IP;
      Interface_T : Unbounded_String;
      Suivante : T_Table;
   end record;
end Routeur_Simple;
