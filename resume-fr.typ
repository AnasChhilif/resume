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
    size: 10pt,
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
    grid(
      columns: (auto, 1fr),
      gutter: 0.3cm,
      align: horizon,

      // Image in the first column
      box[#image("photo23.jpg", width: 2.0cm)], // Slightly smaller image

      // Text content in the second column - everything to the right of the picture
      box(
        align(left)[
          #text(
            size: 18pt,
            weight: "bold",
            fill: rgb("#26428b"),
            [#(author), Ingénieur Full Stack],
          )

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
            [Ingénieur Full Stack avec 2 ans d’expérience en développement web et mobile (Angular, React, NestJS, Spring Boot, Kotlin). Expertise en architecture logicielle et optimisation des performances.],
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
  generic-two-by-two(top-left: strong(institution), top-right: dates, bottom-left: emph(degree), bottom-right: emph(location))
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
  company: "Stiilt, SAS",
  location: "Nice, France",
)

Conception, développement et exploitation d’applications web et mobiles complexes dans un environnement startup dynamique :
- Architecture et implémentation de solutions *full stack* avec *Angular* et *NestJS*, couvrant à la fois le développement d’interfaces utilisateur et d’API backend
- Maintenance et optimisation des applications mobiles *iOS* et *Android*, garantissant compatibilité et performance multiplateforme
- Gestion et débogage d’infrastructures *Kubernetes*, incluant l’orchestration de conteneurs et les pipelines de déploiement
- Optimisation des performances sur les plateformes web et mobiles, avec une réduction de 40 % des temps de chargement grâce au refactoring et à la mise en cache
- Collaboration avec les équipes produit pour concevoir des solutions évolutives répondant aux besoins métiers et utilisateurs

#work(
  title: "Ingénieur Logiciel",
  dates: dates-helper(start-date: "Juil 2023", end-date: "Août 2023"),
  company: "INFOGERANCE ET INGENIERIE INFORMATIQUE",
  location: "Fès, Maroc",
)
Développement d’une application de gestion d’inventaire avec *ReactJS* et *FastAPI*, entraînant une réduction de 30 % du temps de traitement des commandes.

== Formation

#edu(
  institution: "Polytech Nice Sophia",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Diplôme d’ingénieur en informatique",
  location: "Sophia Antipolis, France",
)
Direction de plusieurs projets de groupe et gestion d’équipes pluridisciplinaires tout au long du cursus.

#edu(
  institution: "IAE Nice",
  dates: dates-helper(start-date: "Sept 2024", end-date: "Sept 2025"),
  degree: "Master en Management et Administration des Entreprises",
  location: "Nice, France",
)
Spécialisation en contrôle de gestion et analyse financière, avec un accent sur la transformation numérique.

#edu(
  institution: "Classes Préparatoires aux Grandes Écoles Settat",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Juil 2022"),
  degree: "Concours CCINP — Classement 165/1300",
  location: "Settat, Maroc",
)

== Projets

#project(
  role: "Développeur Principal",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Juil 2024", end-date: "Présent"),
  url: "https://github.com/budgeteer-app",
)

Application multiplateforme de gestion de dépenses partagées développée en *Kotlin* et *Spring Boot*. Développement d’une API robuste connectée à une application mobile multiplateforme utilisant *Kotlin Multiplatform*. Intégration continue via *GitHub Actions*.

#project(
  role: "Développeur Principal",
  name: "DsEasy",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Présent"),
  url: "https://github.com/ds-easy",
)
Service de génération d’examens développé en *Go* et *SQLite*, utilisant *gomigrate*, *SQLc* et *gorilla/mux*. Développement d’une API robuste en *Go*, connectée à un frontend réactif avec *React* et *Tailwind CSS*. Intégration continue pour des mises à jour fluides et une maintenance simplifiée.

== Compétences Techniques
- *Langages de Programmation* : JavaScript, Python, C/C++, Java, Go, Rust, Kotlin  
- *Technologies* : React, Svelte, Angular, Spring, NestJS, Tailwind CSS  
- *DevOps* : Kubernetes, Docker, Jenkins, GitHub Actions, SonarQube, GitLab, GitLab CI  
- *Cloud* : Google Cloud Platform, AWS  
- *Programmation Compétitive* : Top 90 sur 400 à la BattleDev Thales 2024 ; Fondateur du club Sharkoders à Polytech Marseille et organisateur de compétitions d’algorithmique à Polytech Nice au sein du BDT Club, promouvant la culture algorithmique et le développement collaboratif.

== Compétences Transversalles
- *Leadership* : Encadrement d’équipes de développement sur plusieurs projets, coordination entre différents domaines techniques  
- *Esprit d’équipe* : Promotion d’un environnement collaboratif et partage des connaissances au sein des équipes  
- *Gestion des tâches* : Planification et suivi des livrables dans des contextes multidisciplinaires  
- *Langues* : Arabe, Français, Anglais (courant)
