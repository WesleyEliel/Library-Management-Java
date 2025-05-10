## Déploiement sous Kubernetes

- kubectl apply -f k8s/

---

## Description du déploiement

Nous avons défini fichier par fichier ceux dont nous avon besoin pour deployer notre application. À savoir :

- Un fichier de déploiement
- Un fichier de services
- Un fichier de demande d'utilisation d'espace sur le disque (pvc)
- Et un fichier de configuration d'un volume persistant

---

## Commandes intéressantes

- kubectl get pvc
- kubectl get pv
- kubectl describe pvc libraryapp-sqlite-pvc
- kubectl describe pv libraryapp-sqlite-pv

---