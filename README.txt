% projet       : Rendu de la première version
% Groupe       : N => MN-05

Fichier.txt contient  :

196.168.0.2 255.255.255.0 eth1 
196.168.0.3 255.255.255.0 eth2 
196.168.0.4 255.255.255.0 eth3 
196.168.0.5 255.255.255.0 eth4 
142.100.2.6 255.255.255.0 eth5 
196.168.0.45 255.255.255.0 eth6 
[2022-12-17 21:56:29] process terminated successfully, elapsed time: 00.54s


paquets.txt contient  :

196.168.0.55 
196.168.1.3 
147.100.0.3 
196.168.0.45 
196.168.0.2 
142.100.2.6 
196.168.0.5 
196.168.0.3 


Resultat.txt contient :

196.168.0.2 eth1 
142.100.2.6 eth5 
196.168.0.5 eth4 
196.168.0.3 eth2 


Par le biais d'une procédure main.adb on teste les sous programmes du module routeur_simple, et en utilisant les fichiers exmple : Fichier.txt et paquets.txt cités ci-dessus.
 
on peux utilisé des autres fichiers de test, il faut juste les déposer on dossier obj de ce dossier projet pour que le compilateur gnat puisse les trouvée et aprés on run pour créer le fichier résultats.