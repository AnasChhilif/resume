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
  // [Previous layout settings remain the same]
  set document(author: author, title: author)
  set text(
    font: "New Computer Modern",
    size: 10pt,
    lang: "fr",
    ligatures: false
  )
  set page(
    margin: (0.5in),
    "us-letter",
  )
  show link: underline
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]
  show heading: set text(
    fill: rgb(accent-color),
  )
  show link: set text(
    fill: rgb(accent-color),
  )
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(
      weight: 700,
      size: 20pt,
    )
    #it.body
  ]
  align(horizon, [= #(author)])
  pad(
    top: 0.25em,
    align(left)[
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
        ).filter(x => x != none).join("  |  ")
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
  pad[
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad[
    #left #h(1fr) #right
  ]
}

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}

// Section components below
#let edu(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(institution),
    top-right: location,
    bottom-left: emph(degree),
    bottom-right: emph(dates),
  )
}

#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(title),
    top-right: dates,
    bottom-left: company,
    bottom-right: emph(location),
  )
}

#let project(
  role: "",
  name: "",
  url: "",
  dates: "",
) = {
  pad[
    *#role*, #name (#link("https://" + url)[#url]) #h(1fr) #dates
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


#let name = "Anas Chhilif"
#let location = "Nice, France"
#let email = "chhilifanas@gmail.com"
#let github = "github.com/anaschhilif"
#let phone = "+33 7 83 39 17 91"
#let personal-site = "chhilif.com"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
)
Apprenti Ingénieur Full Stack | 5ème année en Informatique, Polytech Nice Sophia
À la recherche d'un poste en CDI à partir de septembre 2025

== Expérience Professionnelle

#work(
  title: "Ingénieur Full Stack, Apprenti",
  location: "Nice, France",
  company: "Stiilt, SAS",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Présent"),
)

- Conception et mise en œuvre d'architectures backend et frontend pour divers clients, y compris des tableaux de bord internes et des applications client.

- Contribution au déploiement Kubernetes et aux pipelines CI/CD, amélioration de l'efficacité et résolution de problèmes complexes.

#work(
  title: "Stagiaire Ingénieur Logiciel",
  location: "Fès, Maroc",
  company: "INFOGERANCE ET INGENIERIE INFORMATIQUE",
  dates: dates-helper(start-date: "Juil 2023", end-date: "Août 2023"),
)
- Développement d'un produit de gestion de stock interne utilisant ReactJS pour le frontend et Python FastAPI pour le backend.


== Formation

#edu(
  institution: "Polytech Nice Sophia",
  location: "Sophia Antipolis, Fr",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Sept 2025"),
  degree: "Diplôme d'ingénieur, informatique",
)
- Cours Pertinents : Architecture logicielle, DevOps, Intergiciels et informatique orientée services, Apprentissage automatique, Sécurité logicielle, Réseaux avancés, Algorithmique avancée, Théorie du calcul.

#edu(
  institution: "IAE Nice",
  location: "Nice, Fr",
  dates: dates-helper(start-date: "Sept 2024", end-date: "Sept 2025"),
  degree: "Master en Management",
)
- Cours Pertinents : Transformation digitale des organistations, Management international, Modèles d'entreprise durables.

== Projets

#project(
  role: "Développeur principal",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Juil 2024", end-date: "Présent"),
  url: "github.com/anaschhilif/budgeteer",
)
- Développement et maintenance de Budgeteer, une application multiplateforme en Kotlin avec backend Spring Boot, utilisant Jetpack Compose et CI/CD avec GitHub Actions, pour aider les colocataires à gérer leurs dépenses partagées.

#project(
  role: "Développeur principal",
  name: "MusicMan",
  dates: dates-helper(start-date: "Juin 2024", end-date: "Présent"),
  url: "github.com/anaschhilif/music-man",
)
- Développement d'une application permettant de lire et contrôler la musique avec des commandes similaires à vim, construite entièrement en Rust.

== Activités Extrascolaires

#extracurriculars(
  activity: "Programmation compétitive",
  dates: dates-helper(start-date: "Jan 2021", end-date: "Présent"),
)
- Fondateur de Sharkoders, un club de programmation compétitive à Polytech Marseille, où nous avons donné des cours d'algorithmes aux étudiants et organisé des compétitions d'entraînement
- Organisation de compétitions de programmation à Polytech Nice pour l'association BDT où les étudiants s'affrontaient sur la plateforme en ligne Kattis

== Compétences et Récompenses
- *Langages de Programmation* : JavaScript, Python, C/C++, HTML/CSS, Java, Bash, R, Golang, Rust, Kotlin.
- *Technologies* : React, Svelte, Tailwind CSS, Git, UNIX, Google Cloud Platform, Angular, Spring, Nestjs.
- *DevOps* : Jenkins, Github actions, Github workers, Kubernetes, Docker, Caddy, NGINX, SonarQube, Artifactory.
- Classé 90ème sur 400 à la Compétition Thales Battledev 2024