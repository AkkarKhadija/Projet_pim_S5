with Ada.Strings;               use Ada.Strings;	-- pour Both utilisé par Trim
with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;
with Ada.Command_Line;          use Ada.Command_Line;
with Ada.Exceptions;            use Ada.Exceptions;	-- pour Exception
with Routeur_Simple;            use Routeur_Simple;



procedure Main is



   procedure Afficher (Destination : in T_Adresse_IP; Masque: in T_Adresse_IP; Int : in Unbounded_String) is
      UN_OCTET: constant T_Adresse_IP := 2 ** 8;
   begin
      Put (Natural ((Destination / UN_OCTET ** 3) mod UN_OCTET), 1); Put (".");
      Put (Natural ((Destination / UN_OCTET ** 2) mod UN_OCTET), 1); Put (".");
      Put (Natural ((Destination / UN_OCTET ** 1) mod UN_OCTET), 1); Put (".");
      Put (Natural  (Destination mod UN_OCTET), 1);
      Put (" " );
      Put (Natural ((Masque / UN_OCTET ** 3) mod UN_OCTET), 1); Put (".");
      Put (Natural ((Masque / UN_OCTET ** 2) mod UN_OCTET), 1); Put (".");
      Put (Natural ((Masque / UN_OCTET ** 1) mod UN_OCTET), 1); Put (".");
      Put (Natural  (Masque mod UN_OCTET), 1);
      Put (" " & Int);
      New_Line;
   end Afficher;

   procedure Afficher_Table is new Pour_Chaque (Traiter => Afficher);

   UN_OCTET: constant T_Adresse_IP := 2 ** 8;
   Fichier_txt : File_Type;
   Table : T_Table;
   T_Fichier : Unbounded_String;
   P_Fichier : Unbounded_String;
   R_Fichier : Unbounded_String;
   paquet : File_Type;
   i : Integer;
   --stop : Boolean;
   --IP : T_Adresse_IP;
begin
   i := 1;
   Analyser_L_Commande (T_Fichier, P_Fichier, R_Fichier);
   Open(Fichier_txt, In_File, To_String(T_Fichier));
   --Open(paquet, In_File, "paquets.txt");
   Routeur_Simple.Remplire_Table(Fichier_txt, Table);
   --Afficher_Table (Table);
   Routeur_Simple.Donner_Resultats(Table);
   --Routeur_Simple.Commande_Paquets(paquet, stop, i, Table, IP);
   Close(Fichier_txt);
   --Close(paquet);

end Main;

