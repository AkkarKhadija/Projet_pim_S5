with Ada.Strings;               use Ada.Strings;	-- pour Both utilisÃ© par Trim
with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;
with Ada.Command_Line;          use Ada.Command_Line;
with Ada.Exceptions;            use Ada.Exceptions;	-- pour Exception
with Routeur_Simple;            use Routeur_Simple;



procedure Main is
   Fichier_txt : File_Type;
   Table       : T_Table;
   T_Fichier   : Unbounded_String;
   P_Fichier   : Unbounded_String;
   R_Fichier   : Unbounded_String;
   Paquet_txt      : File_Type;

begin
   -- analyser la ligne de commande aprés la commande d'exécution de ce fichier
   Analyser_L_Commande (T_Fichier, P_Fichier, R_Fichier);

   -- Ouvrir le fichier table.txt
   Open(Fichier_txt, In_File, To_String(T_Fichier));

   -- Remplir la table de routage à partir du fichier table.txt
   Routeur_Simple.Remplire_Table(Fichier_txt, Table);

   --Afficher la table de routage
   Put_Line("La table de routage est :");
   New_Line;
   Routeur_Simple.Afficher_T(Table);
   New_Line;

   -- Remplir le fichier resultats.txt aprés l'analyse du fichier paquets.txt
   Put_Line("Le résultats du routage est :");
   New_Line;
   Routeur_Simple.Donner_Resultats(Table);
   New_Line;


   -- Fermer le fichier table.txt qui est déja utilisé
   Close(Fichier_txt);

end Main;

