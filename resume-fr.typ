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
    size: 9.5pt,
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
            [#(author)],
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
            [
Ingénieur en informatique diplômé du Master Management et Administration des Entreprises (IAE Nice), alliant expertise technique et vision stratégique des systèmes d’information, avec un fort intérêt pour les enjeux technologiques des fusions-acquisitions et de la transformation digitale.
            ],
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
  author: "Anas Chhilif",
  location: "Nice, France",
  email: "chhilifanas@gmail.com",
  github: "github.com/anaschhilif",
  phone: "+33 7 83 39 17 91",
  personal-site: "chhilif.com",
  linkedin: "www.linkedin.com/in/anas-chhilif/",
  accent-color: "#26428b",
)

== Expérience Professionnelle

#work(
  title: "Ingénieur Full Stack – Analyse et Optimisation SI",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Sept 2025"),
  company: "Stiilt, SAS",
  location: "Nice, France",
)

- Conception et développement d’applications web et mobiles complexes en environnement cloud et conteneurisé (*Kubernetes, Docker*).  
- Analyse de la performance et rationalisation des architectures logicielles, réduction des coûts d’exploitation de 20 %.  
- Mise en œuvre de solutions scalables et résilientes alignées sur les besoins métiers.  
- Collaboration avec les équipes produit et direction technique pour la définition de roadmaps technologiques.  
- Expérience en gestion de projet et suivi de KPIs de performance applicative (temps de réponse, disponibilité, sécurité).

#work(
  title: "Ingénieur Logiciel – Modernisation SI",
  dates: dates-helper(start-date: "Juil 2023", end-date: "Août 2023"),
  company: "INFOGERANCE ET INGENIERIE INFORMATIQUE",
  location: "Fès, Maroc",
)
- Développement d’une application de gestion d’inventaire en *ReactJS* et *FastAPI* pour automatiser les processus internes.  
- Participation à l’analyse des besoins métier et à la refonte partielle de l’infrastructure logicielle.  
- Amélioration de la traçabilité et de la fiabilité des données, réduisant de 30 % le temps de traitement des commandes.

== Formation

#edu(
  institution: "Polytech Nice Sophia",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Diplôme d’ingénieur en informatique – Systèmes et technologies de l’information",
  location: "Sophia Antipolis, France",
)
- Approfondissement en architecture des systèmes, sécurité, cloud computing et gestion de projets.  
- Réalisation de projets pluridisciplinaires intégrant analyse de besoins, conception et pilotage technique.

#edu(
  institution: "IAE Nice",
  dates: dates-helper(start-date: "Sept 2024", end-date: "Sept 2025"),
  degree: "Master Management et Administration des Entreprises (MAE)",
  location: "Nice, France",
)
- Spécialisation en contrôle de gestion, analyse financière et stratégie d’entreprise.  
- Formation à la conduite du changement et à la gestion des risques dans les contextes de transformation digitale et M&A.

#edu(
  institution: "Classes Préparatoires aux Grandes Écoles – Lycée Settat",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Juil 2022"),
  degree: "Concours CCINP – Classement 165/1300",
  location: "Settat, Maroc",
)

== Projets Sélectionnés

#project(
  role: "Chef de projet technique",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Juil 2024", end-date: "Présent"),
  url: "https://github.com/budgeteer-app",
)
Application de gestion financière développée en *Kotlin* et *Spring Boot*.  
Mise en place d’une API sécurisée et d’un modèle de données structuré pour la consolidation et le reporting financier multi-utilisateur.

#project(
  role: "Architecte technique",
  name: "DsEasy",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Présent"),
  url: "https://github.com/ds-easy",
)
Conception d’un service d’automatisation d’examens en *Go* et *React*.  
Pilotage de l’intégration continue et de la maintenance du système via *GitHub Actions*.

== Compétences Clés

- *Systèmes d’Information & Architecture* : audit, performance, sécurité, intégration SI  
- *Transformation & M&A Tech* : compréhension des enjeux IT dans les opérations de fusion, carve-out et post-merger  
- *Langages* : JavaScript, Python, Java, Kotlin, Go  
- *Outils* : React, Angular, Spring Boot, NestJS, Docker, Kubernetes, GitLab CI/CD  
- *Analyse & Reporting* : Excel, PowerPoint, Notion, Confluence  
- *Langues* : Français (courant), Anglais (courant), Arabe (natif)

== Compétences Transversales

- *Analyse et synthèse* : évaluation rapide des environnements techniques et financiers.  
- *Leadership & Esprit d’équipe* : coordination de projets techniques, animation d’équipes pluridisciplinaires.  
- *Rigueur et esprit critique* : identification des risques opérationnels et opportunités de synergies IT.  
- *Communication* : restitution claire et structurée à des interlocuteurs techniques et non-techniques.

== Centres d’intérêt

- M&A technologique, transformation digitale, stratégie d’entreprise  
- Programmation compétitive : Top 90/400 – BattleDev Thales 2024  
- Innovation et entrepreneuriat : fondateur du club “Sharkoders” (Polytech Marseille)  
