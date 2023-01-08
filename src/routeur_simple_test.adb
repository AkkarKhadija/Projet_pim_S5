with Ada.Strings;               use Ada.Strings;	-- pour Both utilisÃ© par Trim
with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;
with Ada.Command_Line;          use Ada.Command_Line;
with Ada.Exceptions;            use Ada.Exceptions;	-- pour Exception_Message
with Routeur_Simple;            use Routeur_Simple;

procedure routeur_simple_test is
   Paquets_txt : File_Type;
   Table_txt : File_Type;
   T_Fichier : Unbounded_String; 
   P_Fichier: Unbounded_String;
   R_Fichier : Unbounded_String;
   Table : T_Table;
begin
   Analyser_L_Commande(T_Fichier, P_Fichier, R_Fichier);
   Open(Paquets_txt, In_File, To_String (P_Fichier));
   Open(Table_txt, In_File, To_String (T_Fichier));
   
   Remplire_Table(Table_txt, Table);
   
   Put_Line("Le résultats du routage simple est :");
   New_Line;
   Donner_Resultats(Table, Paquets_txt);
   
   Close(Paquets_txt);
   Close(Table_txt);
end routeur_simple_test;
