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
    size: 11pt,
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
  align(horizon, [= #(author), Ingénieur Fullstack])
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

#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad[
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
  generic-two-by-two(
    top-left: strong(institution),
    top-right: dates,
    bottom-left: emph(degree),
    bottom-right: emph(location),
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

// Personal Information
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

Ingénieur en Informatique, Polytech Nice Sophia
À la recherche d'un poste en CDI à partir de septembre 2025

== Expérience Professionnelle

#work(
  title: "Ingénieur Full Stack",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Présent"),
  company: "Stiilt, SAS",
  location: "Nice, France",
)

Développement et déploiement d'applications web complexes dans un environnement startup dynamique :
- Architecture et implémentation de solutions *full stack* pour des applications critiques, utilisant *Angular* et *Nestjs*
- Maintenance et débogage d'infrastructures *Kubernetes*
- Amélioration des performances applicatives, réduisant les temps de chargement de 40%

#work(
  title: "Ingénieur Logiciel",
  dates: dates-helper(start-date: "Juil 2023", end-date: "Août 2023"),
  company: "INFOGERANCE ET INGENIERIE INFORMATIQUE",
  location: "Fès, Maroc",
)
Développement d'une application de gestion de stock utilisant *ReactJS* et *FastAPI*, permettant une réduction de 30% du temps de traitement des commandes.

== Formation


#edu(
  institution: "Polytech Nice Sophia",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Diplôme d'ingénieur, informatique",
  location: "Sophia Antipolis, France",
)

#edu(
  institution: "Classes Préparatoires aux Grandes Ecoles Settat",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Juil 2022"),
  degree: "Concours CCINP classement 165/1300",
  location: "Settat, Maroc",
)

== Projets

#project(
  role: "Développeur principal",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Juil 2024", end-date: "Présent"),
  url: "github.com/anaschhilif/budgeteer",
)

Application multiplateforme de gestion de dépenses partagées développée en *Kotlin* et *Spring Boot*. Développement d'une API robuste avec *Kotlin* et *Spring Boot*, connectée à une application mobile multiplateforme utilisant *Kotlin Multiplatform*. Intégration continue avec *GitHub Actions*.
#project(
  role: "Développeur principal",
  name: "MusicMan",
  dates: dates-helper(start-date: "Juin 2024", end-date: "Présent"),
  url: "github.com/anaschhilif/music-man",
)
Application de contrôle musical innovante développée en *Rust*.

== Activités Extrascolaires
Fondateur de Sharkoders et organisateur de compétitions de programmation à Polytech Nice, promouvant la culture algorithmique et le développement collaboratif.

== Compétences
- *Langages* : JavaScript, Python, C/C++, Java, Golang, Rust, Kotlin
- *Technologies* : React, Svelte, Angular, Spring, Nestjs, Tailwind CSS
- *DevOps* : Kubernetes, Docker, Jenkins, GitHub Actions, SonarQube
- *Cloud* : Google Cloud Platform, AWS
- Top 90 sur 400 à la Compétition Thales Battledev 2024