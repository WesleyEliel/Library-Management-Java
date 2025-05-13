## Déploiement sous Kubernetes

- kubectl apply -f k8s/ ( en une fois )
- Nous avon utilisé ansible, donc pas besoin.

---

## Description du déploiement

Nous avons défini fichier par fichier ceux dont nous avon besoin pour deployer notre application. À savoir :

- Un fichier de déploiement
- Un fichier de services
- Un fichier de demande d'utilisation d'espace sur le disque (pvc)
- Un fichier de configuration d'un volume persistant
- Et un fichier de configuration ingress

---

## Commandes intéressantes

- kubectl get pvc
- kubectl get pv
- kubectl describe pvc libraryapp-sqlite-pvc
- kubectl describe pv libraryapp-sqlite-pv

---

## Procédure à suivre

Avant de commencer,

- Il faut impérativement avoir `virtualbox` installé et `vagrant` installé avec comme provider `virtualbox` ;
- Si vous rencontrez des erreurs, par exemple, des problèmes pour accéder au metric des pods, veuillez s'il vous plaît
  nous écrire à l' adresse `wesleymontcho@gmail.com` ou au `229 0169196638`, pour que nous vous expliquions comment nous avons pu résoudre
  ses erreurs là

Par la suite, une fois dans le répertoire du projet, suivez les étapes suivantes :

- Allez dans le dossier vagrant ;
- Exécutez la commande: `vagrant up`;
- A la fin, exécutez successivement : `vagrant ssh k8s-master`, `vagrant ssh k8s-worker1` et `vagrant ssh k8s-worker2`
  pour se connecter au moins une fois à chaque machine ;
- Allez dans le repertoire ansible avec cd `../ansible` si vous êtes toujours dans le répertoire vagrant ;
- Vous pouvez déjà tester la connection aux machines en
  utilisant `ansible-playbook -i inventory.yaml test-ssh-connection.yaml -v`;
- Si vous êtes rassuré que toute les connections passent, alors
  exécutez `ansible-playbook -i inventory.yaml cluster-setup.yaml -v`;
- Connectez-vous à la machine master depuis le dossier vagrant en utilisant la commande `vagrant ssh k8s-master` puis
  vérifiez que les nœuds sont bien présents avec la commande `kubectl get nodes`. Au besoin copiez manuellement la commande
  pour joindre les nœuds au master et connectez-vous à chaque nœud et exécutez la commande ;
- Par la suite, exécutez la commande `ansible-playbook -i inventory.yaml test-ssh-connection.yaml -v` pour installer les
  composants ingress ;
- Ensuite exécutez la commande `ansible-playbook -i inventory.yaml app-deployment.yaml -v` pour déployer l'application
  sur le cluster ;
- Connectez-vous à la machine master depuis le dossier vagrant avec la commande `vagrant ssh k8s-master` et vérifiez si
  tout est normale en exécutant la commande `kubectl get all` qui permet de voir les elements present dans le namespace
  par défaut ;
- Exécutez cette commande sur votre machine pour ajouter l'adresse au fichier etc
  host `echo "192.168.56.100 libraryapp.local" | sudo tee -a /etc/hosts` ;
- Sur la machine master, exécutez
  successivement `sudo iptables -A OUTPUT -m owner ! --uid-owner vagrant -p tcp --dport 80 -j ACCEPT`
  et `sudo setcap cap_net_bind_service=+ep $(which kubectl)`
  et `kubectl port-forward --address 0.0.0.0 -n ingress-nginx  service/ingress-nginx-controller 80:80` pour exposer le
  controller ingress sur la machine master ;
- Accédez à l' application alors dans le navigateur de votre machine à l'adresse `libraryapp.local` ;

---