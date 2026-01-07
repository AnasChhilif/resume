#let resume(
  author: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  accent-color: "#000000",
  body,
) = {
  set document(author: author, title: author)
  set text(
    font: "New Computer Modern",
    size: 9.6pt,
    lang: "fr",
    ligatures: false,
  )
  set page(
    margin: 0.4in,
    "us-letter",
  )
  set par(
    leading: 0.4em,
    spacing: 0.4em,
  )
  show link: underline
  show heading.where(level: 2): it => [
    #pad(top: 2pt, bottom: -8pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 0.8pt)
  ]
  show heading: set text(fill: rgb(accent-color))
  show link: set text(fill: rgb(accent-color))
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(
      weight: 700,
      size: 18pt,
    )
    #it.body
  ]

      box(
        width: 100%,
        align(center)[
          // Name and title
          #text(
            size: 18pt,
            weight: "bold",
            fill: rgb("#26428b"),
            [#(author)],
          )

          // Contact information
          #pad(
            top: 2pt,
            [
              #(
                (
                  if phone != "" {
                    phone
                  },
                  if location != "" {
                    location
                  },
                  if email != "" {
                    link("mailto:" + email)[Email]

                  },
                  if github != "" {
                    link("https://" + github)[Github]
                  },
                  if linkedin != "" {
                    link("https://" + linkedin)[Linkedin]
                  },
                  if personal-site != "" {
                    link("https://" + personal-site)[Portfolio]
                  },
                )
                  .filter(x => x != none)
                  .join("  |  ")
              )
            ],
          )

          #pad(
            top: 2pt,
            [Ingénieur Full Stack avec un fort intérêt pour l'architecture logicielle,\
             l'optimisation des performances et la gestion des infrastructures Kubernetes.],
          )
        ],
      )

  set par(justify: true)
  body
}

#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  pad(top: 2pt, bottom: 2pt)[
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad(top: 2pt, bottom: 2pt)[
    #left #h(1fr) #right
  ]
}

#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}

#let edu(
  institution: "",
  dates: "",
  degree: "",
  location: "",
) = {
  generic-two-by-two(top-left: strong(institution), top-right: dates, bottom-left: emph(degree), bottom-right: emph(
    location,
  ))
}

#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(top-left: strong(company), top-right: dates, bottom-left: emph(title), bottom-right: emph(location))
}

#let project(
  role: "",
  name: "",
  url: "",
  dates: "",
) = {
  pad(top: 2pt, bottom: 2pt)[
    *#role*, #name #if (url != "") {"(" + (link(url)[Github]) + ")"} #h(1fr) #dates
  ]
}

#let extracurriculars(
  activity: "",
  dates: "",
) = {
  generic-one-by-two(
    left: strong(activity),
    right: dates,
  )
}

// Informations personnelles
#let name = "Anas Chhilif"
#let location = "Nice, France"
#let email = "chhilifanas@gmail.com"
#let github = "github.com/anaschhilif"
#let phone = "+33 7 83 39 17 91"
#let personal-site = "chhilif.com"
#let linkedin = "www.linkedin.com/in/anas-chhilif/"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  phone: phone,
  personal-site: personal-site,
  linkedin: linkedin,
  accent-color: "#26428b",
)

== Expérience Professionnelle

#work(
  title: "Ingénieur Full Stack",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Sept 2025"),
  company: "Stiilt",
  location: "Nice, France",
)

Conception, développement et exploitation d'applications web et mobiles complexes dans un environnement de startup dynamique :
- Architecture et implémentation de solutions *full stack* utilisant *Angular* et *NestJS*, gérant à la fois les interfaces utilisateur frontend et le développement d'API backend
- Maintenance et optimisation d'applications mobiles *iOS* et *Android*, assurant la compatibilité multi-plateforme et les performances
- Gestion et débogage d'infrastructures *Kubernetes*, incluant l'orchestration de conteneurs et les pipelines de déploiement
- Optimisation des performances sur les plateformes web et mobiles, réalisant une réduction de 40% des temps de chargement grâce à la refonte du code et aux stratégies de mise en cache
- Collaboration avec les équipes produit pour livrer des solutions évolutives répondant aux exigences métier et aux besoins des utilisateurs
- Conception et développement d'un site web destiné aux clients leur donnant accès à un tableau de bord permettant de visualiser et interagir avec leur flotte complète dans le cas de location de plusieurs véhicules. Les fonctionnalités incluent la localisation en temps réel de tous les véhicules, la possibilité d'ajouter ou de retirer l'accès conducteur au véhicule, et la capacité de verrouiller/déverrouiller le véhicule à distance
- Ajout de la conformité des cartes co-badgées aux applications mobiles, conception et implémentation d'interfaces permettant aux utilisateurs de sélectionner leur réseau préféré pour traiter leurs paiements lorsqu'ils ajoutent une carte de débit à leurs comptes

== Formation

#edu(
  institution: "Polytech Nice Sophia",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Diplôme d'Ingénieur, Informatique",
  location: "Sophia Antipolis, France",
)
Cours pertinents : Architecture logicielle, opérations de développement, animations 3D, développement de jeux, parallélisme, CUDA, programmation fonctionnelle, algorithmes avancés et machines de Turing, réseaux avancés, sécurité logicielle, middleware et informatique orientée services, conception de systèmes interactifs, techniques d'interaction multimodale.

#edu(
  institution: "IAE Nice",
  dates: dates-helper(start-date: "Sept 2024", end-date: "Sept 2025"),
  degree: "Master, Management et Administration des Entreprises",
  location: "Nice, France",
)
Spécialisé en contrôle de gestion et analyse financière, avec un accent sur la prise de décision stratégique et la transformation digitale.

#edu(
  institution: "Classes Préparatoires aux Grandes Écoles Settat",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Juil 2022"),
  degree: "Concours Centrale & CCINP",
  location: "Settat, Maroc",
)
Deux années intensives d'études en mathématiques et physique parmi d'autres cours pour réussir les concours d'entrée très sélectifs des grandes écoles d'ingénieurs françaises.

- Mathématiques : Analyse réelle, algèbre générale et linéaire, équations différentielles, probabilités et topologie.
- Informatique : Python, SQL, algorithmes et méthodes numériques.




== Projets

#project(
  role: "Fondateur & Ingénieur Principal",
  name: "Entervio",
  dates: dates-helper(start-date: "Nov 2025", end-date: "Présent"),
  url: "https://github.com/AnasChhilif/entervio",
)
Plateforme d'entretien vocal alimentée par IA avec interaction vocale en temps réel. Développée en full-stack avec *React* et *FastAPI*, intégrant *Gemini*, *Whisper* et *ElevenLabs* pour des entretiens dynamiques avec des personas IA configurables et des retours détaillés.

#project(
  role: "Architecte Logiciel & Développeur Principal",
  name: "DsEasy",
  dates: dates-helper(start-date: "Sep 2023", end-date: "Présent"),
  url: "",
)

Service de génération d'examens développé en *Go* et *SQLite*, utilisant *gomigrate*, *SQLc* et *gorilla/mux*. Développement d'une API robuste avec Go, connectée à un frontend responsive utilisant *React* et *Tailwindcss*. Intégration continue pour des mises à jour et une gestion fluides.

#project(
  role: "Développeur Principal",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Juil 2024", end-date: "Présent"),
  url: "https://github.com/budgeteer-app",
)

Application multi-plateforme de gestion de dépenses partagées développée en *Kotlin* et *Spring Boot*. Développement d'une API robuste avec *Kotlin* et *Spring Boot*, connectée à une application mobile multi-plateforme utilisant *Kotlin Multiplatform*. Intégration continue avec *GitHub Actions*.



== Compétences Techniques
- *Langages de Programmation* : JavaScript, Python, C/C++, Java, Go, Rust, Kotlin
- *Technologies* : React, Svelte, Angular, Spring, NestJS, Tailwind CSS
- *DevOps* : Kubernetes, Docker, Jenkins, GitHub Actions, SonarQube, GitLab, GitLab CI
- *Cloud* : Google Cloud Platform, AWS
- *Programmation Compétitive* : Top 90 sur 400 au Thales Battledev 2024 ; Fondateur du club de programmation compétitive à Polytech Marseille et organisateur de compétitions de programmation à Polytech Nice.