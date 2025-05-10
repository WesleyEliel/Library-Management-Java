# Runtime environment
FROM eclipse-temurin:17-jre-jammy

#
RUN mkdir -p /app/data/sqlite

# Installer les dépendances nécessaires pour SQLite
RUN apt-get update && rm -rf /var/lib/apt/lists/*

# Créer le répertoire de l'application
WORKDIR /app

# Copier le fichier WAR de l'application
COPY ./target/library-management-0.0.1.war /app/

# Expose port and run application
EXPOSE 8080

# Commande pour démarrer l'application
CMD ["java", "-jar", "library-management-0.0.1.war"]

