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
    size: 10pt, // Reduced from 11pt
    lang: "en",
    ligatures: false,
  )
  set page(
    margin: 0.4in, // Reduced from 0.5in
    "us-letter",
  )
  set par(
    leading: 0.4em, // Reduced line spacing
    spacing: 0.4em, // Reduced paragraph spacing
  )
  show link: underline
  show heading.where(level: 2): it => [
    #pad(top: 2pt, bottom: -8pt, [#smallcaps(it.body)]) // Reduced padding
    #line(length: 100%, stroke: 0.8pt) // Thinner line
  ]
  show heading: set text(fill: rgb(accent-color))
  show link: set text(fill: rgb(accent-color))
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(
      weight: 700,
      size: 18pt, // Reduced from 20pt
    )
    #it.body
  ]

  box(
    grid(
      columns: (auto, 1fr),
      gutter: 0.3cm,
      // Reduced from 0.5cm
      align: horizon,

      // Image in the first column
      box[#image("photo23.jpg", width: 2.0cm)], // Slightly smaller image

      // Text content in the second column - everything to the right of the picture
      box(
        align(left)[
          // Name and title
          #text(
            size: 18pt, // Reduced from 20pt
            weight: "bold",
            fill: rgb("#26428b"),
            [#(author), Ingénieur Full Stack],
          )

          // Contact information (moved from below to here)
          #pad(
            top: 2pt, // Reduced padding
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
                    link("mailto:" + email)[#email]
                  },
                  if github != "" {
                    link("https://" + github)[#github]
                  },
                  if linkedin != "" {
                    link("https://" + linkedin)[#linkedin]
                  },
                  if personal-site != "" {
                    link("https://" + personal-site)[#personal-site]
                  },
                )
                  .filter(x => x != none)
                  .join("  |  ")
              )
            ],
          )

          #pad(
            top: 2pt,
            [Ingénieur Full Stack avec 2 ans d'expérience en développement web et mobile (Angular, React, NestJS, Spring Boot, Kotlin). Expertise en architecture logicielle, optimisation des performances et gestion d'infrastructures Kubernetes.],
          )
        ],
      ),
    ),
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
    // Reduced padding
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad(top: 2pt, bottom: 2pt)[
    // Reduced padding
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
  generic-two-by-two(top-left: strong(title), top-right: dates, bottom-left: company, bottom-right: emph(location))
}

#let project(
  role: "",
  name: "",
  url: "",
  dates: "",
) = {
  pad(top: 2pt, bottom: 2pt)[
    // Reduced padding
    *#role*, #name #if (url != "") {"(" + (link(url)[#url]) + ")"} #h(1fr) #dates
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

// Informations Personnelles
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
  dates: dates-helper(start-date: "Sept 2023", end-date: "Présent"),
  company: "Stiilt, SAS",
  location: "Nice, France",
)

Conception, développement et exploitation d'applications web et mobiles complexes dans un environnement startup dynamique :
- Architecture et implémentation de solutions *full stack* utilisant *Angular* et *NestJS*, gérant à la fois les interfaces utilisateur frontend et le développement d'API backend
- Maintenance et optimisation d'applications mobiles *iOS* et *Android*, assurant la compatibilité cross-platform et les performances
- Gestion et débogage d'infrastructures *Kubernetes*, incluant l'orchestration de conteneurs et les pipelines de déploiement
- Optimisation des performances sur les plateformes web et mobiles, atteignant une réduction de 40% des temps de chargement grâce à la refactorisation du code et aux stratégies de mise en cache

#work(
  title: "Ingénieur Logiciel",
  dates: dates-helper(start-date: "Juil 2023", end-date: "Août 2023"),
  company: "INFOGERANCE ET INGENIERIE INFORMATIQUE",
  location: "Fès, Maroc",
)
Développement d'une application de gestion d'inventaire utilisant *ReactJS* et *FastAPI*, résultant en une réduction de 30% du temps de traitement des commandes.

== Formation

#edu(
  institution: "Polytech Nice Sophia",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Diplôme d'Ingénieur, Informatique",
  location: "Sophia Antipolis, France",
)
Dirigé plusieurs projets de groupe et managé des équipes transfonctionnelles tout au long du programme.

#edu(
  institution: "Classes Préparatoires aux Grandes Ecoles Settat",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Juil 2022"),
  degree: "Concours CCINP classement 165/1300",
  location: "Settat, Maroc",
)

== Projets

#project(
  role: "Développeur Principal",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Juil 2024", end-date: "Présent"),
  url: "https://github.com/budgeteer-app",
)

Application cross-platform de gestion des dépenses partagées développée en *Kotlin* et *Spring Boot*. Développement d'une API robuste avec *Kotlin* et *Spring Boot*, connectée à une application mobile cross-platform utilisant *Kotlin Multiplatform*. Intégration continue avec *GitHub Actions*.

#project(
  role: "Développeur Principal",
  name: "DsEasy",
  dates: dates-helper(start-date: "Sep 2023", end-date: "Présent"),
  url: "https://github.com/ds-easy",
)
Service de génération d'examens développé en Go et SQLite, utilisant gomigrate, SQLc, et gorilla/mux. Développement d'une API robuste avec Go, connectée à un frontend responsive utilisant React et Tailwind CSS. Intégration continue pour des mises à jour et une gestion transparentes.

== Compétences Techniques
- *Langages de Programmation* : JavaScript, Python, C/C++, Java, Go, Rust, Kotlin
- *Technologies* : React, Svelte, Angular, Spring, NestJS, Tailwind CSS
- *DevOps* : Kubernetes, Docker, Jenkins, GitHub Actions, SonarQube, GitLab, GitLab CI
- *Cloud* : Google Cloud Platform, AWS
- Top 90 sur 400 à la Compétition Thales Battledev 2024

== Compétences Transversales
- *Leadership* : Dirigé des équipes de développement dans plusieurs projets de groupe, coordonnant les efforts à travers différents domaines techniques
- *Constitution d'Équipe* : Favorisé des environnements collaboratifs et facilité le partage de connaissances entre les membres de l'équipe
- *Gestion des Tâches* : Géré efficacement les délais de projet et les livrables à travers des équipes multidisciplinaires
- *Langues* : Arabe, Français, Anglais (courant)
/*
== Activités Extrascolaires
Fondateur de Sharkoders et organisateur de compétitions de programmation à Polytech Nice, promouvant la culture algorithmique et le développement collaboratif.
*/